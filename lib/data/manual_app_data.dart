import 'package:duckladydinh/api/models.dart';
import 'package:duckladydinh/api/providers.dart';

class ManualDataProvider extends DataProvider {
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
    return List.unmodifiable(idioms);
  }

  @override
  List<Event> getEvents() {
    final copy = List.from(events);
    copy.sort((a, b) => a.date.compareTo(b.date));
    return List.unmodifiable(copy);
  }

  @override
  String getResumeLocation() {
    return "/assets/static/Lam_Gia_Thuan_CV_4_0.pdf";
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
  Idiom(
    author: "The Book",
    quote:
        "If it's possible for others, it's possible for me. It is only a question of strategies!",
  ),
];

final events = [
  Event(
    date: DateTime(2016, 9, 5),
    summary: "I came to Germany!",
    story: null,
  ),
  Event(
    date: DateTime(2017, 1, 29),
    summary:
        "FAU Winter Contest, runner-up at TUM, my first glory ever at university!",
    story: null,
  ),
  Event(
    date: DateTime(2019, 4, 17),
    summary:
        "For the first time in many years, I finally made my way through Code Jam Round 1! (Rank 902 Round 1A)",
    story: null,
  ),
  Event(
    date: DateTime(2020, 2, 5),
    summary: "I graduated! Eureka!",
    story: null,
  ),
  Event(
    date: DateTime(2020, 2, 9),
    summary:
        "I thought of a personal website and tried my hands on React + Bulma.",
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
    date: DateTime(2020, 4, 24),
    summary:
        "I learned of the situation of Google and Corona. Worry, I do, but still with hope!",
    story: null,
  ),
  Event(
    date: DateTime(2020, 4, 26),
    summary:
        "I learned the basics of Go, Flutter and gRPC. They are awesome together.",
    story: null,
  ),
  Event(
    date: DateTime(2020, 5, 15),
    summary: "I became a true research assistant for my university.",
    story: null,
  ),
  Event(
    date: DateTime(2020, 5, 16),
    summary:
        "I finally figured out the idea behind my personal website: A Philosophy Blog of Universal Facts!",
    story: null,
  ),
  Event(
    date: DateTime(2020, 5, 16),
    summary:
        "I ranked 1796 at CodeJam 2020. Still faraway from what I desire, but still a solid 10% improvement!",
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
        "My first personal website with Google's stunning Flutter is officially released.",
    story: null,
  ),
  Event(
    date: DateTime(2020, 6, 4),
    summary:
        "Today, for the first time, I checked out what beneath the JVM: absolute beauty.",
    story: null,
  ),
  Event(
    date: DateTime(2020, 6, 5),
    summary:
        "Fun experiment! A little bird told me my English was too broken. Today, I recorded myself singing in English and Vietnamese and surprisingly, both are equally broken to the point that I can feel the struggle in pronouncing every word.",
    story: null,
  ),
];
