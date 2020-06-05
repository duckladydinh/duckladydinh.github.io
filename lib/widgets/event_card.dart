import 'package:duckladydinh/api/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final Event event;

  EventCard(this.event);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: this.event.key,
      margin: EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat.yMMMd().format(this.event.date),
                style: Theme.of(context).textTheme.headline6,
              ),
              const Divider(),
              Text(
                this.event.summary,
                style: Theme.of(context)
                    .textTheme
                    .apply(fontSizeFactor: 1.25)
                    .bodyText1,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
