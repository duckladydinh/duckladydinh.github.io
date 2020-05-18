import 'package:flutter/material.dart';

abstract class AppData {
  String getAuthor();

  String getAuthorDayTitle();

  String getAuthorNightTitle();

  List<Idiom> getIdioms();

  List<Event> getEvents();

  String getResumeLocation();
}

class Idiom {
  final Key key;
  final String author;
  final String quote;

  Idiom({this.author, this.quote}) : key = UniqueKey();
}

class Event {
  final Key key;
  final String date;
  final String summary;
  final String story;

  Event({this.date, this.summary, this.story}) : key = UniqueKey();
}
