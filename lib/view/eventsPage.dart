import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final data = Supabase.instance.client
  .from("event")
  .select("name,description,image");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String,dynamic>>>(
        future: data,
        builder: (context,snapshot){
          if (!snapshot.hasData){
            return const Center (child :CircularProgressIndicator());
          }
          final events = snapshot.data!;
          return ListView.builder(
            itemCount : events.length,
            itemBuilder: ((context,index){
              final event = events[index];
              return Card(
                    clipBehavior: Clip.antiAlias,
                    child : Column(
                      children: [
                        ListTile(
                          title : Text(event["name"]),
                        ),
                        Image.asset("assets/images/${event['image']}"),
                        Padding( 
                          padding: const EdgeInsets.all(16.0),
                          child: Text(event["description"],
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),),
                        )
                      ],));
            })
          );}
          ));
          }
          }

