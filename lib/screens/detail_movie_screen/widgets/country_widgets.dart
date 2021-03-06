import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themovie_database/retrofit/config.dart';
import 'package:themovie_database/retrofit/entities/movie_detail.dart';

countryWidgets(BuildContext context, MoviewDetail moviewDetail) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: MediaQuery.of(context).size.height * 0.4,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text('COUNTRY  ',
                        style: GoogleFonts.aBeeZee(fontSize: 20.0))),
                Container(
                    child: moviewDetail == null
                        ? Text('NO COUNTRY IS SHOW')
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount:
                                moviewDetail.production_countries.length ?? 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                  color: Colors.white,
                                  child: FlatButton.icon(
                                      onPressed: null,
                                      icon: FaIcon(
                                        FontAwesomeIcons.globe,
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                          moviewDetail
                                                  .production_companies[index]
                                                  .name ??
                                              'NO COMMUNITY',
                                          style: GoogleFonts.roboto(
                                              color: Colors.black))));
                            } ))
              ],
            ),
          ),
        );
      });
}
