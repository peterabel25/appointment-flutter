import 'package:auntie_rafiki_appointments/models/event.dart';
import 'package:auntie_rafiki_appointments/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  Event? event;
  @override
  void initState() {
    event = Provider.of<EventProvider>(context, listen: false)
        .getEventById(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(event!.name),
        actions: [
          IconButton(
              onPressed: () {
                final result = eventProvider.deleteEvent(widget.id);
                if (result) {
                  Navigator.pop(context);
                }
                eventProvider.deleteEvent(widget.id);
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 250,
            child: Image.network(event!.featuredImage),
          ),
          SizedBox(
            height: 15,
          ),
          Text(event!.name),
          SizedBox(
            height: 15,
          ),
          Text(event!.description),
          SizedBox(
            height: 15,
          ),
          Text(event!.location),
          SizedBox(
            height: 15,
          ),
          Text(event!.time)
        ],
      )),
    );
  }
}
