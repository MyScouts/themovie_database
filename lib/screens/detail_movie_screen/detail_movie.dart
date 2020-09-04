import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:themovie_database/model/widget/getMovie.dart';
import 'package:themovie_database/retrofit/config.dart';
import 'package:themovie_database/retrofit/entities/movie_detail.dart';
import 'package:themovie_database/retrofit/services/res_client.dart';
import 'package:themovie_database/screens/detail_movie_screen/widgets/country_widgets.dart';
import 'package:themovie_database/screens/detail_movie_screen/widgets/language_widgets.dart';
import 'package:themovie_database/screens/watch_movie/watch_movie_ui.dart';

import 'widgets/conpany_widgets.dart';

class DetailMovie extends StatefulWidget {
  @override
  _detailMovie createState() => _detailMovie();
}

class _detailMovie extends State<DetailMovie> {

  @override
  Widget build(BuildContext context) {
    HomeArg _arg = ModalRoute.of(context).settings.arguments;


    final client =
        RestClient(Dio(BaseOptions(contentType: "application/json")));
    return Scaffold(
      body: FutureBuilder(
        future: client.getMovidetail(_arg.movieId, API_KEY),
        builder: (BuildContext context, AsyncSnapshot<MoviewDetail> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error');
          }
          MoviewDetail moviewDetail = snapshot.data;
          return _detailUi(moviewDetail, context);
        },
      ),
    );
  }
}

Widget _detailUi(MoviewDetail moviewDetail, BuildContext context) {
  return Column(children: [
    Stack(children: [
      CachedNetworkImage(
          fit: BoxFit.fill,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          imageUrl: IMG_URL_500 + moviewDetail.backdrop_path,
          placeholder: (context, url) => new CircularProgressIndicator()),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.06,
          left: MediaQuery.of(context).size.width * 0.1,
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios, color: Colors.white))),
      Container(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          height: MediaQuery.of(context).size.height * 0.4,
          alignment: Alignment.bottomRight,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(moviewDetail.title.toUpperCase(),
                    style: GoogleFonts.oswald(fontSize: 25.0)),
                Text('DATE: ' + moviewDetail.release_date),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  RatingBar(
                      emptyColor: Colors.white,
                      filledColor: Colors.yellow,
                      size: 25.0,
                      initialRating: moviewDetail.vote_average / 5,
                      isHalfAllowed: false,
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      onRatingChanged: null)
                ])
              ]))
    ]),
    Expanded(
        child: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                alignment: Alignment.topRight,
                child: Text(moviewDetail.status,
                    style: TextStyle(fontStyle: FontStyle.italic))),
            Text('OVERVIEW',
                style: GoogleFonts.roboto(
                    fontSize: 20.0, fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
            Text(moviewDetail.overview),
            Padding(padding: EdgeInsets.only(top: 3.0, bottom: 10)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('POPULARITY: ${moviewDetail.popularity}',
                  style: TextStyle(fontSize: 12.0)),
              Text('VOTE AVERAGE: ${moviewDetail.vote_average}',
                  style: TextStyle(fontSize: 12.0)),
              Text('VOTE COUNT: ${moviewDetail.vote_count}',
                  style: TextStyle(fontSize: 12.0))
            ]),
            Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Card(
                  color: Colors.green,
                  child: FlatButton.icon(
                      onPressed: null,
                      icon: FaIcon(FontAwesomeIcons.film, color: Colors.white),
                      label: Text('WATCH TRAILER',
                          style: GoogleFonts.tauri(color: Colors.white)))),
              Card(
                  color: Colors.red,
                  child: FlatButton.icon(
                      onPressed: () => Navigator.pushNamed(
                          context, '/watch_movie',
                          arguments: DetaileMovieARG(moviewDetail)),
                      icon: FaIcon(FontAwesomeIcons.film, color: Colors.white),
                      label: Text('WATCH FILM',
                          style: GoogleFonts.tauri(color: Colors.white))))
            ]),
            Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
            Text('INFORMATION',
                style: GoogleFonts.roboto(
                    fontSize: 20.0, fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.symmetric(vertical: 3.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                    color: Colors.white,
                    child: FlatButton.icon(
                        onPressed: () => companyWidgets(context, moviewDetail),
                        icon: FaIcon(FontAwesomeIcons.solidBuilding,
                            color: Colors.black, size: 20.0),
                        label: Text('Conpany',
                            style: GoogleFonts.roboto(color: Colors.black)))),
                Card(
                    color: Colors.white,
                    child: FlatButton.icon(
                        onPressed: () => countryWidgets(context, moviewDetail),
                        icon: FaIcon(FontAwesomeIcons.couch,
                            color: Colors.black, size: 20.0),
                        label: Text('Contry',
                            style: GoogleFonts.roboto(color: Colors.black)))),
                Card(
                    color: Colors.white,
                    child: FlatButton.icon(
                        onPressed: () => languageWidgets(context, moviewDetail),
                        icon: FaIcon(FontAwesomeIcons.globeAsia,
                            color: Colors.black, size: 20.0),
                        label: Text('Language',
                            style: GoogleFonts.roboto(color: Colors.black))))
              ],
            ),
          ])),
    ))
  ]);
}

class DetaileMovieARG {
  MoviewDetail moviewDetail;

  DetaileMovieARG(this.moviewDetail);
}
