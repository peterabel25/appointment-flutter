import 'package:auntie_rafiki_appointments/models/event.dart';
import 'package:auntie_rafiki_appointments/pages/event_page.dart';
import 'package:auntie_rafiki_appointments/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("events"),
      ),
      body: ListView.builder(
          itemCount: eventProvider.events.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                //     Navigator.of(context).pushNamed("event",arguments: {"id":eventProvider.events[index].id});
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return EventPage(id: eventProvider.events[index].id);
                }));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: Image.network(
                          eventProvider.events[index].featuredImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                eventProvider.events[index].name,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Text(eventProvider.events[index].date),
                              Text(eventProvider.events[index].time)
                            ],
                          ),
                          Text(eventProvider.events[index].category)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          eventProvider.addEvent();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
