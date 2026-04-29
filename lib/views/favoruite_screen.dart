import 'package:event_management_app/views/event_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../model/event.dart';
import '../provider/calender.dart';
import '../services/event.dart';
import '../widgets/reuseble_widgets.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 62,),
              customText(
                "Favorite",
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme
                    .of(context)
                    .brightness == Brightness.dark
                    ? Colors.white
                    : Color(0xFF555555),
              ),

              Expanded(
                child: StreamProvider<List<EventModel>>.value(
                  value: EventServices().getFavoriteEvents(userId),
                  initialData: [],
                  builder: (context, child) {
                    final eventList = context.watch<List<EventModel>>();
                    if (eventList.isEmpty) {
                      return Center(child: Text(
                        "No Events Found.!",
                        style: GoogleFonts.poppins(
                            fontSize: 15.8, fontWeight: FontWeight.w600),
                      ),);
                    }

                    return ListView.builder(
                        itemCount: eventList.length,
                        itemBuilder: (context, i) {
                          String formattedDate = DateFormat('dd MMMM yyyy')
                              .format(eventList[i].dateTime!.toDate());
                          String formattedTime = DateFormat(' hh:mm a').format(
                              eventList[i].dateTime!.toDate());
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        color: Color(0xffBABABA),
                                      width: 0.6
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => EventScreen(events: eventList[i])));
                                        },
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(
                                                      12),
                                                  child: Image.network(
                                                    eventList[i].image.toString(),
                                                    height: 180,
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),

                                                Positioned(
                                                    top: 12,
                                                    right: 12,
                                                    child: Icon(Icons.favorite,
                                                      color: Colors.red,)
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  customText(
                                                    eventList[i].title.toString(),
                                                    fontSize: 15.8,
                                                    fontWeight: FontWeight.w600,
                                                    color: Theme
                                                        .of(context)
                                                        .brightness == Brightness.dark
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                  const SizedBox(height: 12),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.calendar_today_outlined,
                                                        size: 15,),
                                                      SizedBox(width: 8),

                                                      /// Date
                                                      customText(
                                                        formattedDate,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                        color: Theme
                                                            .of(context)
                                                            .brightness ==
                                                            Brightness.dark
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),


                                                      ///Time
                                                      customText(
                                                        formattedTime,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                        color: Theme
                                                            .of(context)
                                                            .brightness ==
                                                            Brightness.dark
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),

                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.location_on_outlined,
                                                        size: 18,),
                                                      SizedBox(width: 8),
                                                      customText(
                                                        eventList[i].location
                                                            .toString(),
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                        color: Theme
                                                            .of(context)
                                                            .brightness ==
                                                            Brightness.dark
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () {
                                        try{
                                          final event = eventList[i];

                                          DateTime eventDate = event
                                              .dateTime!.toDate();
                                          String eventId = event.docId
                                              .toString();

                                          final provider = context.read<
                                              CalendarProvider>();

                                          bool added = provider
                                              .addEvent(
                                              eventDate, eventId);

                                          showSnackBar(context, added
                                              ? "Added to calendar"
                                              : "Already added ",);
                                        }catch(e){
                                          showSnackBar(context, e.toString());
                                        }
                                          },
                                          child: customButton(
                                              text: "Add to my calendar"))
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 24,),
                            ],
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
