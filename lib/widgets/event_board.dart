import 'dart:math';

import 'package:duckladydinh/api/models.dart';
import 'package:duckladydinh/widgets/event_card.dart';
import 'package:flutter/material.dart';

import 'annotated_divider.dart';

class EventBoard extends StatelessWidget {
  final List<Event> events;
  final double boardWidth;

  final int maxCols;
  final double cellWidth;
  final double cellHeight;
  final double columnSpace;

  EventBoard(
      {this.events,
      this.boardWidth,
      this.maxCols = 2,
      this.cellWidth = 600.0,
      this.cellHeight = 300.0,
      this.columnSpace = 20.0});

  @override
  Widget build(BuildContext context) {
    final cols = min(maxCols, max(1, (boardWidth / cellWidth).floor()));
    final totalWidth = (this.columnSpace * 2 + cellWidth) * cols;
    final eventMap = groupedEventsByYear(events);
    final aspectRatio = getAspectRatio(cols);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: max(0, (boardWidth - totalWidth) / 2.0)),
      child: Column(
        children: eventMap.entries
            .expand((e) => [
                  AnnotatedDivider(e.key.toString()),
                  GridView.count(
                    childAspectRatio: aspectRatio,
                    physics: ScrollPhysics(),
                    crossAxisCount: cols,
                    shrinkWrap: true,
                    children: [
                      for (var event in e.value)
                        Padding(
                          padding: EdgeInsets.all(this.columnSpace),
                          child: EventCard(event),
                        )
                    ],
                  ),
                ])
            .toList(),
      ),
    );
  }

  Map<int, List<Event>> groupedEventsByYear(List<Event> events) {
    final eventMap = Map<int, List<Event>>();
    for (var event in events) {
      final year = event.date.year;
      if (!eventMap.containsKey(year)) {
        eventMap[year] = List<Event>();
      }
      final eventList = eventMap[year];
      eventList.add(event);
    }
    return eventMap;
  }

  double getAspectRatio(int cols) {
    return cellWidth / cellHeight;
  }
}
