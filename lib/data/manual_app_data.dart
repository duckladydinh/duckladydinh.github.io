import 'package:duckladydinh/api/models.dart';
import 'package:duckladydinh/api/providers.dart';
import 'package:flutter/material.dart';

class ManualDataProvider extends DataProvider {
  List<Idiom> _idioms;
  List<Event> _events;
  List<PageReference> _pageReferences;
  ImageProvider _moonImage;
  ImageProvider _sunImage;
  BoxDecoration _nightWallpaper;
  BoxDecoration _dayWallpaper;

  ManualDataProvider() {
    _idioms = List.unmodifiable(idioms);

    _events = List.from(events);
    _events.sort((a, b) => b.date.compareTo(a.date));
    _events = List.unmodifiable(_events);

    _pageReferences = List.unmodifiable(pageReferences);

    _moonImage = AssetImage("static/icons/moon_icon.png");
    _sunImage = AssetImage("static/icons/sun_icon.png");

    _nightWallpaper = BoxDecoration(
      image: DecorationImage(
        image: AssetImage("static/wallpapers/night_wallpaper.gif"),
        fit: BoxFit.cover,
      ),
    );
    _dayWallpaper = BoxDecoration(
      image: DecorationImage(
        image: AssetImage("static/wallpapers/light_wallpaper.gif"),
        fit: BoxFit.cover,
      ),
    );
  }

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

  @override
  ImageProvider getMoonIcon() {
    return _moonImage;
  }

  @override
  ImageProvider getSunIcon() {
    return _sunImage;
  }

  @override
  List<PageReference> getExternalPageReferences() {
    return _pageReferences;
  }

  @override
  BoxDecoration getDayWallpaper() {
    return _dayWallpaper;
  }

  @override
  BoxDecoration getNightWallpaper() {
    return _nightWallpaper;
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
        "Ghost or not, there's nothing that Beerus-sama can't destroy... oh, except for the absolute divine beauty of Thuan, of course",
  ),
  Idiom(
    author: "The Book",
    quote:
        "If it's possible for others, it's possible for me. It is only a question of strategies!",
  ),
  Idiom(
      author: "Thuan, The Heaven Chaser",
      quote: "Every way to heaven goes through hell"),
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
    summary: "Light in the cloudy sky! =)) GooGooGooGoo...Google!",
    story: null,
  ),
  Event(
    date: DateTime(2020, 7, 16),
    summary:
        "I finally made the move that has no way back. I know of the consequences, but I won't back off. I won't accept an ordinary life! Tears in eyes, worries in the mind, life in the fire... shine or die!",
    story: null,
  ),
];

final pageReferences = [
  PageReference(
    name: "Resume",
    link: "/assets/static/Lam_Gia_Thuan_CV_4_0.pdf",
    icon: AssetImage("static/icons/resume_icon.png"),
  ),
  PageReference(
    name: "GitHub",
    link: "https://github.com/duckladydinh",
    icon: AssetImage("static/icons/github_icon.png"),
  ),
  PageReference(
    name: "Scholar",
    link: "https://scholar.google.com/citations?user=TbQgL_QAAAAJ",
    icon: AssetImage("static/icons/scholar_icon.png"),
  ),
];
