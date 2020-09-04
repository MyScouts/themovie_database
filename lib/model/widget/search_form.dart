import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget searchForm() => Padding(
      padding: EdgeInsets.all(20.0),
      child: Material(
        color: Color(0xffEEEEEE),
        elevation: 1.0,
        borderRadius: BorderRadius.circular(30.0),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              focusColor: Colors.black26,
              prefixIcon: Icon(Icons.search, color: Colors.black26),
              hintText: 'Search for a movie, tv show, person',
              hintStyle: TextStyle(color: Color(0xffCECECE))),
        ),
      ),
    );
