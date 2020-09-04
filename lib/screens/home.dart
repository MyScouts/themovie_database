import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:themovie_database/model/widget/getMovie.dart';
import 'package:themovie_database/model/widget/search_form.dart';
import 'package:themovie_database/retrofit/config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeSate createState() => _HomeSate();
}

class _HomeSate extends State<HomeScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            searchForm(),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: CATEGORY.length,
                    itemBuilder: (BuildContext context, int index) {
                      GetMovieDB getMovieDB = new GetMovieDB(CATEGORY[index]);
                      return Container(
                          margin: EdgeInsets.only(bottom: 50.0),
                          child: SizedBox(
                            child: getMovieDB,
                          ));
                    },
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
