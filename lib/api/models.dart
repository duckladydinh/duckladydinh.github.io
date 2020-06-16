import 'package:flutter/material.dart';

class Idiom {
  final Key key;
  final String author;
  final String quote;

  Idiom({this.author, this.quote}) : key = UniqueKey();
}

class Event {
  final Key key;
  final DateTime date;
  final String summary;
  final String story;

  Event({this.date, this.summary, this.story}) : key = UniqueKey();
}

class PageReference {
  final Key key;
  final String name;
  final String link;
  final ImageProvider icon;

  PageReference({this.name, this.link, this.icon}) : key = UniqueKey();
}
