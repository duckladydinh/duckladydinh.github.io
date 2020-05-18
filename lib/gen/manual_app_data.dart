import 'package:duckladydinh/api/app_data.dart';

class ManualAppData extends AppData {
  final _idioms = [
    Idiom(
        author: "Nature",
        quote: "Thuan is the Multiverse's most handsome and gorgeous boy"),
    Idiom(
        author: "Thuan, The Handsome",
        quote:
            "Giving up is so easy and consumes so little energy, but it is never gonna work"),
    Idiom(
        author: "World History",
        quote:
            "The world is vast, the history is rich, but never before has the world seen a perfect being like Thuan"),
    Idiom(
        author: "Thuan, The Determined",
        quote:
            "Do what you want, forget about consequences and do even more for whatever's coming"),
  ];

  final _events = [
    Event(date: "Feb 05, 2020", summary: "I graduated! Eureka!", story: null),
    Event(
        date: "Feb 09, 2020",
        summary: "I made a cute blog with React and Bulma.",
        story: null),
    Event(
        date: "Feb 18, 2020",
        summary: "I went for Google Onsite. Incredible Googlers!",
        story: null),
    Event(
        date: "Feb 25, 2020",
        summary:
            "Alex let me know he already wanted to give me the job before my thesis but... I didn't understand the meaning. Too late, then.",
        story: null),
    Event(
        date: "Mar 31, 2020",
        summary: "I built my first Docker Image for Alex.",
        story: null),
    Event(
        date: "Mar 31, 2020",
        summary:
            "I officially finished my student tasks at 360T after 2 years.",
        story: null),
    Event(
        date: "Apr 03, 2020",
        summary:
            "Google HC decided to give me a chance. I felt explosive! But the Corona is getting in my way.",
        story: null),
    Event(
        date: "Apr 12, 2020",
        summary: "I played with Flutter for the first time.",
        story: null),
    Event(
        date: "Apr 13, 2020",
        summary: "I knew about gRPC for the first time.",
        story: null),
    Event(
        date: "Apr 24, 2020",
        summary:
            "I learned of the situation of Google and Corona. Worry, I do, but still with hope.",
        story: null),
    Event(
        date: "Apr 26, 2020",
        summary:
            "I finally understood the basics of Go, Flutter and gRPC. They are awesome together.",
        story: null),
    Event(
        date: "May 15, 2020",
        summary: "I became a true research assistant for my university.",
        story: null),
    Event(
        date: "May 15, 2020",
        summary: "I managed to record the presentation for EANN 2020.",
        story: null),
    Event(
        date: "May 16, 2020",
        summary:
            "I finally figured out an idea for my personal blog: A Philosophy Blog of Universal Facts!",
        story: null),
    Event(
        date: "May 16, 2020",
        summary:
            "I ranked 1800 at CodeJam 2020. Still faraway from what I desire, but still a solid 10% improvement!",
        story: null),
    Event(
        date: "May 17, 2020",
        summary:
            "I ranked 392 at KickStart Round C 2020. Still faraway from what I want but I solved all problems!",
        story: null),
    Event(
        date: "May 18, 2020",
        summary:
            "My first personal blog with Google's stunning Flutter is official released.",
        story: null),
  ];

  @override
  String getAuthor() {
    return "Gia Thuan Lam";
  }

  @override
  String getAuthorDayTitle() {
    return "Coder of the Glorious Sunshine";
  }

  @override
  String getAuthorNightTitle() {
    return "Coder of the Mysterious Night";
  }

  @override
  List<Idiom> getIdioms() {
    return _idioms;
  }

  @override
  List<Event> getEvents() {
    return _events;
  }
}
