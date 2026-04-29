import 'package:event_management_app/model/event.dart';
import 'package:event_management_app/services/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon:  Icon(Icons.arrow_back, color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,),
        ),
        title:  Text(
          'Notification',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,),
        ),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),

      body: StreamProvider<List<EventModel>>.value(
        value: EventServices().getEvents(),
        initialData: const [],

        builder: (context, child) {
          final eventList = context.watch<List<EventModel>>();


          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: eventList.length,
            itemBuilder: (context, i) {
              final event = eventList[i];
              bool isRead = i > 2;


              String formattedTime = "Loading...";
              if (event.dateTime != null) {
                final date = event.dateTime!.toDate();
                formattedTime = DateFormat('hh:mm a').format(date);
              }

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black12
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: (event.image == null || event.image!.isEmpty)
                          ? Container(
                        width: 60,
                        height: 60,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image, size: 30),
                      )
                          : Image.network(
                        event.image!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60,
                            height: 60,
                            color: Colors.grey[300],
                            child: const Icon(Icons.broken_image),
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 12),


                    Expanded(
                      child: Text(
                        event.title ?? "No Title",
                        style:  TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black87,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    /// 🔴 Status + Time
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isRead ? Colors.transparent : Colors.red,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          formattedTime,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}