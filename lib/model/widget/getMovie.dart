import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themovie_database/retrofit/config.dart';
import 'package:themovie_database/retrofit/entities/movie.dart';
import 'package:themovie_database/retrofit/services/MovieDB.dart';

import 'loading.dart';

class GetMovieDB extends StatelessWidget {
  String categrory;

  GetMovieDB(this.categrory);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      key: UniqueKey(),
      future: MovieDB.getInstance().getAllMovie(categrory),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return LoadingIndicatorWidget();
        } else if (snapshot.hasError) {
          return Text('ERROR');
        }
        List<Movie> data = snapshot.data;
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20.0, left: 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(categrory.toUpperCase(),
                        style: GoogleFonts.fjallaOne(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (BuildContext context) {})
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: _itemMoviel(context, data),
            )
          ],
        );
      },
    );
  }

  ListView _itemMoviel(BuildContext context, List<Movie> movies) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: movies == null ? 0 : movies.length,
      itemBuilder: (BuildContext context, int index) {
        String url = IMG_URL_POSTER + movies[index].posterPath;
        return InkWell(
          onTap: () => onShowDetail(context, movies[index].id),
          child: Card(
            child: CachedNetworkImage(
              imageUrl: url,
              placeholder: (context, url) => new CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
        );
      },
    );
  }

  onShowDetail(BuildContext context, movie) {
    Navigator.pushNamed(context, '/detail_movie', arguments: HomeArg(movie));
  }
}

class HomeArg {
  int movieId;

  HomeArg(this.movieId);
}
