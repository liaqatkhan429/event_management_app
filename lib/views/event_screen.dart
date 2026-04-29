import 'package:event_management_app/model/event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../widgets/reuseble_widgets.dart';

class EventScreen extends StatefulWidget {
  final EventModel events;
  const EventScreen({super.key, required this.events});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  final String userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMMM yyyy').format(widget.events.dateTime!.toDate());
    String formattedTime = DateFormat(' hh:mm a').format(widget.events.dateTime!.toDate() );
    return Scaffold(
body: SingleChildScrollView(
  child: Column(

    children: [
      Stack(
        children: [
          Container(
            height: 404,
            width: double.infinity,
            decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(widget.events.image.toString()),
            fit: BoxFit.cover
            )
            )
          ),
          Positioned(
            top: 60,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/backarrow.png",color: Colors.white,width: 20,height: 18,)),
               const SizedBox(width: 260,),

                widget.events.favorite!.contains(userId)
                    ? Icon(Icons.favorite, color: Colors.red,)
                    : Image.asset("assets/fivorite.png",color: Colors.white,width: 20,height: 18,)],
            ),
          ),

        ],
      ),
      const SizedBox(height: 14,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.events.title.toString(),
              style: GoogleFonts.poppins(fontSize: 15.8, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Row(
              children:  [
                Icon(Icons.calendar_today_outlined, size: 15, ),
                SizedBox(width: 8),
                customText(
                   formattedDate,
                    fontSize: 14, fontWeight: FontWeight.w400),
                customText(
                   formattedTime,
                    fontSize: 14, fontWeight: FontWeight.w400),

              ],
            ),
            const SizedBox(height: 8),
            Row(
              children:  [
                Icon(Icons.location_on_outlined, size: 18, ),
                SizedBox(width: 8),
                customText(
                    widget.events.location.toString(),
                    fontSize: 14, fontWeight: FontWeight.w400),
              ],
            ),
            const SizedBox(height: 24),
            customText("Events details",fontWeight: FontWeight.w700,fontSize: 16, ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.events.eventDetails.toString(),
                  style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start,
                ),
              ),
            ),

          ],
        ),
      )
    ],
  ),
),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: customButton(text: 'Add to my calendar'),
      ),
    );
  }
}
