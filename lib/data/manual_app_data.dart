import 'package:duckladydinh/api/app_data.dart';

class ManualAppData extends AppData {
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
    return idioms;
  }

  @override
  List<Event> getEvents() {
    return events;
  }

  @override
  String getResumeLocation() {
    return "/assets/static/Lam_Gia_Thuan_CV_3_0.pdf";
  }
}

final idioms = [
  Idiom(
    author: "Nature",
    quote: "Thuan is the Multiverse's most handsome and gorgeous boy",
  ),
  Idiom(
    author: "Thuan, The Handsome",
    quote:
        "Giving up is so easy and consumes so little energy, but it is never gonna work",
  ),
  Idiom(
    author: "World History",
    quote:
        "The world is vast, the history is rich, but never before has the world seen a perfect being like Thuan",
  ),
  Idiom(
    author: "Thuan, The Determined",
    quote:
        "Do what you want, forget about consequences and do even more for whatever's coming",
  ),
  Idiom(
    author: "Whis, The Angel",
    quote:
        "Ghost or not, there's nothing that Beerus sama can't destroy... oh, except for the absolute divine beauty of Thuan, of course",
  ),
];

final events = [
  Event(
    date: DateTime(2020, 2, 5),
    summary: "I graduated! Eureka!",
    story: null,
  ),
  Event(
    date: DateTime(2020, 2, 9),
    summary: "I thought of making a cute blog and tried my hands on React.",
    story: null,
  ),
  Event(
    date: DateTime(2020, 2, 18),
    summary: "I went for Google Onsite. Incredible Googlers!",
    story: null,
  ),
  Event(
    date: DateTime(2020, 3, 31),
    summary: "I officially finished my student tasks at 360T after 2 years.",
    story: null,
  ),
  Event(
    date: DateTime(2020, 4, 3),
    summary:
        "Google HC decided to give me a chance. I felt explosive! But the Corona is getting in my way =((.",
    story: null,
  ),
  Event(
    date: DateTime(2020, 4, 11),
    summary: "I played with Flutter for the first time.",
    story: null,
  ),
  Event(
    date: DateTime(2020, 4, 13),
    summary: "I learnt about gRPC for the first time.",
    story: null,
  ),
  Event(
    date: DateTime(2020, 4, 24),
    summary:
        "I learned of the situation of Google and Corona. Worry, I do, but still with hope!",
    story: null,
  ),
  Event(
    date: DateTime(2020, 4, 26),
    summary:
        "I finally understood the basics of Go, Flutter and gRPC. They are awesome together.",
    story: null,
  ),
  Event(
    date: DateTime(2020, 5, 15),
    summary: "I became a true research assistant for my university.",
    story: null,
  ),
  Event(
    date: DateTime(2020, 5, 15),
    summary: "I managed to record the presentation for EANN 2020.",
    story: null,
  ),
  Event(
    date: DateTime(2020, 5, 16),
    summary:
        "I finally figured out an idea for my personal blog: A Philosophy Blog of Universal Facts!",
    story: null,
  ),
  Event(
    date: DateTime(2020, 5, 16),
    summary:
        "I ranked 1800 at CodeJam 2020. Still faraway from what I desire, but still a solid 10% improvement!",
    story: null,
  ),
  Event(
    date: DateTime(2020, 5, 17),
    summary:
        "I ranked 392 at KickStart Round C 2020. Still faraway from what I want but I solved all problems!",
    story: null,
  ),
  Event(
    date: DateTime(2020, 5, 18),
    summary:
        "My first personal blog with Google's stunning Flutter is official released.",
    story: null,
  ),
];
