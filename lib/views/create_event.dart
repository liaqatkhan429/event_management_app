import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/resuble_widgets.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24,),
  child: SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(height: 50),
        Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/backarrow.png",
                height: 24,
                width: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 10),
            customText(
              "Business Group",
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 24),
            customText(
              "Title",
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            const SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: "Made in Melanin! Black History Month Social",
                hintStyle: GoogleFonts.poppins(
                    fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff505050)
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                      "Date",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    Container(
                        width: 148,
                      height: 46,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff838383),
                          width: 0.4,
                        ),
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            pickDate(context);

                          },
                          child: Row(
                            children: [
                              customText(
                                  selectedDate == null
                                      ? "No Date Selected"
                                      : "${selectedDate!.day}/ ${selectedDate!.month}/ ${selectedDate!.year}",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xff555555)
                              ),
                              const Spacer(),
                              Icon(Icons.calendar_today_outlined, size: 18,  color: Color(0xff555555))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 16,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                      "Time",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    Container(
                      width: 148,
                      height: 46,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff838383),
                            width: 0.4,
                          ),
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            pickTime(context);
                          },
                          child: Row(
                            children: [
                              customText(
                                  selectedTime == null
                                      ? "No Time Selected"
                                      : selectedTime!.format(context),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xff555555)
                              ),
                              const Spacer(),
                              Icon(Icons.access_time, size: 24,  color: Color(0xff555555))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),

              ],
            ),
            const SizedBox(height: 24),
            customText(
              "Location",
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            const SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                hintStyle: GoogleFonts.poppins(
                    fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff505050)
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 24),
            customText(
              "Event Detail",
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            const SizedBox(height: 6),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Lorem ipsum dolor sit amet consectetur. Lectus viverra fermentum natoque nibh enim aliquam tincidunt eu purus. Non habitasse sed feugiat aliquet tortor. Risus turpis quam est quam leo turpis ipsum. Amet non sed lacus placerat turpis in. Vitae amet sit sed dictum eget scelerisque massa nibh.",
                hintStyle: GoogleFonts.poppins(
                    fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff505050)
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 24),
            customText(
              "Upload Image",
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            const SizedBox(height: 6),
            Container(
              width: 154,
              height: 127,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff838383),
                  width: 0.4,
                ),
                borderRadius: BorderRadius.circular(6)
              ),
              child: Column(
                children: [
                  const SizedBox(height: 27),
                  Image.asset("assets/upload.png"),
                  const SizedBox(height: 10),
                  customText(
                    "Upload",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xff555555)
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            customButton(text: "Create Event"),
            const SizedBox(height: 24),

          ],
        ),
      ],
    ),
  ),
),
    );
  }
  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }



  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }
}
