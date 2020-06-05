import 'dart:math';

import 'package:duckladydinh/api/models.dart';
import 'package:duckladydinh/widgets/event_card.dart';
import 'package:flutter/material.dart';

import 'annotated_divider.dart';

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

    final eventMap = Map<int, List<Event>>();
    for (var event in this.events) {
      final year = event.date.year;
      if (!eventMap.containsKey(year)) {
        eventMap[year] = List<Event>();
      }
      final eventList = eventMap[year];
      eventList.add(event);
    }

    return Column(
      children: eventMap.entries
          .expand((e) => [
                AnnotatedDivider(e.key.toString()),
                GridView.count(
                  childAspectRatio: estimatedColWidth / this.estimatedHeight,
                  physics: ScrollPhysics(),
                  crossAxisCount: cols,
                  shrinkWrap: true,
                  children: [for (var event in e.value) EventCard(event)],
                ),
              ])
          .toList(),
    );
  }
}
