import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themovie_database/retrofit/config.dart';
import 'package:themovie_database/retrofit/entities/movie_detail.dart';
import 'package:themovie_database/retrofit/entities/video.dart';
import 'package:themovie_database/retrofit/services/res_client.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:themovie_database/screens/detail_movie_screen/detail_movie.dart';

class WatchMovieUI extends StatefulWidget {
  @override
  _WatchMovieState createState() => _WatchMovieState();
}

class _WatchMovieState extends State<WatchMovieUI> {
  RestClient client =
      RestClient(Dio(BaseOptions(contentType: "application/json")));
  String nameTitle;
  String key;
  int indexRow = 1;

  @override
  Widget build(BuildContext context) {
    DetaileMovieARG _arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
            title: Expanded(
                child: Text(_arg.moviewDetail.title.toString(),
                    overflow: TextOverflow.ellipsis))),
        body: SingleChildScrollView(
            child: SafeArea(
                child: FutureBuilder(
                    future:
                        client.getVideoMovieId(_arg.moviewDetail.id, API_KEY),
                    builder:
                        (BuildContext context, AsyncSnapshot<Video> snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('error');
                      }
                      Video listVideo = snapshot.data;
                      return _movieWidget(
                          listVideo, _arg.moviewDetail, context);
                    }))));
  }

  Widget _movieWidget(
      Video listVideo, MoviewDetail movieDetail, BuildContext context) {
    YoutubePlayerController _playerController = YoutubePlayerController(
        initialVideoId: listVideo.results[0].key,
        flags: YoutubePlayerFlags(autoPlay: false, mute: true));
    final url = IMG_URL_POSTER + movieDetail.poster_path;
    return Column(children: [
      YoutubePlayer(
          controller: _playerController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.red),
      Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Text(nameTitle ?? listVideo.results[0].name,
              maxLines: 2,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Row(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: CachedNetworkImage(imageUrl: url)),
                    Expanded(
                        child: Column(children: [
                      Text(movieDetail.title.toUpperCase(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Text(movieDetail.overview,
                              style: TextStyle(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5))
                    ]))
                  ])))),
      Container(
          padding: EdgeInsets.only(left: 15.0),
          alignment: Alignment.centerLeft,
          child: Text('EPISODE')),
      Container(
          padding: EdgeInsets.all(15.0),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: listVideo.results.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      setState(() {
                        nameTitle = listVideo.results[index].name;
                        indexRow = index + 1;
                        _playerController.load(listVideo.results[index].key);

                      });

                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: indexRow == index + 1
                                ? Colors.green
                                : Colors.white),
                        alignment: Alignment.center,
                        child: Text((index + 1).toString(),
                            style: TextStyle(color: Colors.black))));
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3.0,
                  crossAxisSpacing: 10.0)))
    ]);
  }
}
