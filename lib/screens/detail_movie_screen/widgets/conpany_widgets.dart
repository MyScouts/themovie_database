import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themovie_database/retrofit/config.dart';
import 'package:themovie_database/retrofit/entities/movie_detail.dart';

companyWidgets(BuildContext context, MoviewDetail moviewDetail) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: Colors.black54,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0))),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: MediaQuery.of(context).size.height * 0.4,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text('COMPANY',
                          style: GoogleFonts.aBeeZee(fontSize: 20.0))),
                  Container(
                      child: moviewDetail == null
                          ? Text('NO COMPANY')
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount:
                                  moviewDetail.production_companies.length ?? 1,
                              itemBuilder: (BuildContext context, int index) {
                                String url;
                                if (moviewDetail.production_companies[index]
                                        .logo_path ==
                                    null) {
                                  url = IMG_URL_500 +
                                      '/tkFE81jJIqiFYPP8Tho57MXRQEx.png';
                                } else {
                                  url = IMG_URL_500 +
                                      moviewDetail.production_companies[index]
                                          .logo_path;
                                }

                                return Card(
                                    color: Colors.white,
                                    child: FlatButton.icon(
                                        onPressed: null,
                                        icon: CachedNetworkImage(
                                          imageUrl: url,
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                          placeholder: (context, url) =>
                                              new CircularProgressIndicator(),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                        ),
                                        label: Expanded(
                                          child: Text(
                                            moviewDetail
                                                .production_companies[index]
                                                .name ??
                                                'NO COMMUNITY',
                                            style: GoogleFonts.roboto(
                                                color: Colors.black),
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                            maxLines: 1,
                                          ),
                                        )));
                              },
                            ))
                ],
              ),
            ),
          ),
        );
      });
}
