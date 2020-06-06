import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:duckladydinh/api/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IdiomBoard extends StatefulWidget {
  final double boardRatio;
  final List<Idiom> idioms;

  IdiomBoard({this.idioms, double maxWidth, double maxHeight})
      : boardRatio = maxWidth / maxHeight;

  @override
  _IdiomBoardState createState() {
    return _IdiomBoardState();
  }
}

class _IdiomBoardState extends State<IdiomBoard> {
  final CarouselController _carouselController = CarouselController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          _carouselController.previousPage();
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          _carouselController.nextPage();
        }
      },
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlayInterval: const Duration(seconds: 8),
          aspectRatio: widget.boardRatio,
          scrollPhysics: ScrollPhysics(),
          enlargeCenterPage: true,
          autoPlay: true,
        ),
        carouselController: _carouselController,
        items: [
          for (var idiom in widget.idioms)
            Padding(
              key: idiom.key,
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    idiom.quote,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    "by ${idiom.author}",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
