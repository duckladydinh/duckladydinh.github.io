import 'dart:math';

import 'package:duckladydinh/api/app_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventBoard extends StatelessWidget {
  final double estimatedHeight;
  final List<Event> events;
  final double maxWidth;
  final double minWidth;

  EventBoard({this.events, this.maxWidth, this.minWidth, this.estimatedHeight});

  @override
  Widget build(BuildContext context) {
    final cols = max(1, (this.maxWidth / this.minWidth).floor());
    final estimatedColWidth = this.maxWidth / cols;

    return GridView.count(
      childAspectRatio: estimatedColWidth / this.estimatedHeight,
      physics: ScrollPhysics(),
      crossAxisCount: cols,
      shrinkWrap: true,
      children: [
        for (var event in events)
          Card(
            key: event.key,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    DateFormat.yMMMd().format(event.date),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const Divider(),
                  Text(
                    event.summary,
                    style: Theme.of(context)
                        .textTheme
                        .apply(fontSizeFactor: 1.25)
                        .bodyText1,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
