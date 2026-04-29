import 'package:event_management_app/services/event.dart';
import 'package:event_management_app/views/event_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/event.dart';
import '../provider/calender.dart';
import '../widgets/reuseble_widgets.dart';


class Features extends StatefulWidget {
  const Features({super.key});

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  List<String> stateList = [
    "Pakistan",
  ];
  List<String> cityList = [
    "Karachi",
    "Lahore",
    "Islamabad",
    "Rawalpindi",
    "Faisalabad",
    "Multan",
    "Peshawar",
    "Quetta",
    "Sialkot",
    "Hyderabad",
    "Dubai",
    "London",
    "New York",
    "Toronto",
    "Istanbul",
  ];
  List<String> groupList = [
    "Group1",
    "Group2",
    "Group3",
    "Group4",
  ];
  String? selectedCountry;
  String? selectedCity;
  String? selectedGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 62,),

            //// header
            Row(
              children: [
                customText(
                  "Features",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                            return StatefulBuilder(
                                builder: (context, setStateDialog){
                                  return Dialog(
                                    insetPadding: EdgeInsets.symmetric(horizontal: 14,vertical: 130),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),

                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                InkWell(
                                                    onTap: (){
                                                      Navigator.pop(context);
                                                    },
                                                    child: Icon(Icons.close)),
                                                const SizedBox(width: 101),
                                                customText(
                                                  "Filter Events",
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Theme.of(context).brightness == Brightness.dark
                                                      ? Colors.white70
                                                      : Colors.black,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 23),
                                            customText(
                                              "City",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Theme.of(context).brightness == Brightness.dark
                                                  ? Colors.white70
                                                  : Colors.black,
                                            ),
                                            const SizedBox(height: 6),
                                            CustomDropdown(
                                              hintText: "Select City",
                                              items: cityList,
                                              selectedValue: selectedCity,
                                              onChanged: (value){
                                                setState(() {
                                                  setState(() {
                                                    selectedCity = value;
                                                  });
                                                });
                                              },
                                            ),
                                            const SizedBox(height: 23),
                                            customText(
                                              "State",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Theme.of(context).brightness == Brightness.dark
                                                  ? Colors.white70
                                                  : Colors.black,
                                            ),
                                            const SizedBox(height: 6),
                                            CustomDropdown(
                                              hintText: "Select State",
                                              items: stateList,
                                              selectedValue: selectedCountry,
                                              onChanged: (value){
                                                selectedCountry = value;
                                              },
                                            ),
                                            const SizedBox(height: 23),
                                            customText(
                                              "Groups",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Theme.of(context).brightness == Brightness.dark
                                                  ? Colors.white70
                                                  : Colors.black,
                                            ),
                                            const SizedBox(height: 6),
                                            CustomDropdown(hintText: "Group",
                                              items: groupList,
                                              selectedValue: selectedGroup,
                                              onChanged: (value){
                                                setState(() {
                                                  selectedGroup = value;
                                                });
                                              },
                                            ),
                                            const SizedBox(height: 23),
                                            Row(
                                              children: [
                                                /// Religious
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedGroup = "Religious";
                                                    });
                                                  },
                                                  child: customButton2(
                                                    width: 96,
                                                    height: 35,
                                                    color: selectedGroup == "Religious"
                                                        ? buttonColor
                                                        : Colors.transparent,
                                                    borderColor: selectedGroup == "Religious"
                                                        ? Colors.transparent
                                                        : const Color(0xff545454),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Image.asset(
                                                          "assets/religion.png",height: 20,width: 20,
                                                          color: selectedGroup == "Religious"
                                                              ? Colors.white
                                                              : const Color(0xff545454),
                                                        ),
                                                        customText(
                                                          "Religious",
                                                          fontSize: 12,
                                                          color: selectedGroup == "Religious"
                                                              ? Colors.white
                                                              : const Color(0xff545454),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                const SizedBox(width: 6),

                                                /// Business
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedGroup = "Business";
                                                    });
                                                  },
                                                  child: customButton2(
                                                    width: 96,
                                                    height: 35,
                                                    color: selectedGroup == "Business"
                                                        ? buttonColor
                                                        : Colors.transparent,
                                                    borderColor: selectedGroup == "Business"
                                                        ? Colors.transparent
                                                        : const Color(0xff545454),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Image.asset(
                                                          "assets/business.png",height: 20,width: 20,
                                                          color: selectedGroup == "Business"
                                                              ? Colors.white
                                                              : const Color(0xff545454),
                                                        ),
                                                        customText(
                                                          "Business",
                                                          fontSize: 12,
                                                          color: selectedGroup == "Business"
                                                              ? Colors.white
                                                              : const Color(0xff545454),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                const SizedBox(width: 6),

                                                /// Religious 2
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedGroup = "Religious2";
                                                    });
                                                  },
                                                  child: customButton2(
                                                    width: 96,
                                                    height: 35,
                                                    color: selectedGroup == "Religious2"
                                                        ? buttonColor
                                                        : Colors.transparent,
                                                    borderColor: selectedGroup == "Religious2"
                                                        ? Colors.transparent
                                                        : const Color(0xff545454),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Image.asset(
                                                          "assets/religious.png",height: 20,width: 20,
                                                          color: selectedGroup == "Religious2"
                                                              ? Colors.white
                                                              : const Color(0xff545454),
                                                        ),
                                                        customText(
                                                          "Religious",
                                                          fontSize: 12,
                                                          color: selectedGroup == "Religious2"
                                                              ? Colors.white
                                                              : const Color(0xff545454),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            const SizedBox(height: 12),

                                            Row(

                                              children: [
                                                /// Education
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedGroup = "Education";
                                                    });
                                                  },
                                                  child: customButton2(
                                                    width: 109,
                                                    height: 35,
                                                    color: selectedGroup == "Education"
                                                        ? buttonColor
                                                        : Colors.transparent,
                                                    borderColor: selectedGroup == "Education"
                                                        ? Colors.transparent
                                                        : const Color(0xff545454),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Image.asset(
                                                          "assets/education.png",height: 20,width: 20,
                                                          color: selectedGroup == "Education"
                                                              ? Colors.white
                                                              : const Color(0xff545454),
                                                        ),
                                                        customText(
                                                          "Education",
                                                          fontSize: 12,
                                                          color: selectedGroup == "Education"
                                                              ? Colors.white
                                                              : const Color(0xff545454),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                const SizedBox(width: 6),

                                                /// Community
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedGroup = "Community";
                                                    });
                                                  },
                                                  child: customButton2(
                                                    width: 109,
                                                    height: 35,
                                                    color: selectedGroup == "Community"
                                                        ? buttonColor
                                                        : Colors.transparent,
                                                    borderColor: selectedGroup == "Community"
                                                        ? Colors.transparent
                                                        : const Color(0xff545454),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Image.asset(
                                                          "assets/community.png",height: 20,width: 20,
                                                          color: selectedGroup == "Community"
                                                              ? Colors.white
                                                              : const Color(0xff545454),
                                                        ),
                                                        customText(
                                                          "Community",
                                                          fontSize: 12,
                                                          color: selectedGroup == "Community"
                                                              ? Colors.white
                                                              : const Color(0xff545454),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 24,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      setStateDialog(() {
                                                        selectedCity = null;
                                                        selectedCountry = null;
                                                        selectedGroup = null;
                                                      });
                                                      setState(() {

                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: customButton(text: "Clear Filter",fontSize: 14,fontWeight: FontWeight.w600,height: 45,width: 132,color: Colors.transparent,txtColor: Color(0xff555555),borderColor: Colors.black)),
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      setState(() {});

                                                    },
                                                    child: customButton(text: "Apply Filter",fontSize: 14,fontWeight: FontWeight.w600,height: 45,width: 132)),
                                              ],
                                            )

                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                      },
                    );
                  },
                  child: Image.asset("assets/filter.png",height: 42,width: 42,),
                ),
              ],
            ),

            Expanded(
              child: StreamProvider<List<EventModel>>.value(
                  value: EventServices().getEvents(),
                  initialData: [],
                builder: (context, child){
                  final eventList =
                  context.watch<List<EventModel>>();

                  final filteredList = eventList.where((event) {
                    final location = event.location?.toLowerCase() ?? "";

                    final cityMatch = selectedCity == null ||
                        selectedCity!.isEmpty ||
                        location.contains(selectedCity!.toLowerCase());

                    final countryMatch = selectedCountry == null ||
                        selectedCountry!.isEmpty ||
                        location.contains(selectedCountry!.toLowerCase());


                    return (cityMatch || countryMatch) ;
                  }).toList();

                  if (filteredList.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Data Found.!",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    );
                  }

                    return ListView.builder(
                        itemCount: filteredList.length,
                        itemBuilder: (context, i){
                          String formattedDate = DateFormat('dd MMMM yyyy').format(filteredList[i].dateTime!.toDate());
                          String formattedTime = DateFormat(' hh:mm a').format(filteredList[i].dateTime!.toDate() );
                          return Column(
                            children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: Color(0xffBABABA),
                                        width: 0.6,
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => EventScreen(events: filteredList[i])));
                                          },
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(12),
                                                    child: Image.network(
                                                      filteredList[i].image.toString(),
                                                      height: 180,
                                                      width: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),

                                                  Positioned(
                                                    top: 12,
                                                    right: 12,
                                                    child: InkWell(
                                                        onTap: () async {
                                                          try{
                                                            if(filteredList[i].favorite!.contains(userId)){
                                                              await EventServices().removeFromFavorite(
                                                                  eventID: filteredList[i].docId.toString(),
                                                                  userID: userId);
                                                            }else{
                                                              await EventServices().addToFavorite(
                                                                  eventID: filteredList[i].docId.toString(),
                                                                  userID: userId);
                                                            }
                                                          }catch(e){
                                                            showSnackBar(context, e.toString());
                                                          }
                                                        },
                                                        child: filteredList[i].favorite!.contains(userId)
                                                        ? Icon(Icons.favorite, color: Colors.red,)
                                                        : Image.asset("assets/fivorite.png", height: 24,width: 24,color: Colors.white,)),
                                                  ),
                                                ],
                                              ),

                                              // Event details
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                filteredList[i].title.toString(),
                                                      style: GoogleFonts.poppins(fontSize: 15.8, fontWeight: FontWeight.w600),
                                                    ),
                                                    const SizedBox(height: 12),
                                                    Row(
                                                      children:  [
                                                        Icon(Icons.calendar_today_outlined, size: 15, ),
                                                        SizedBox(width: 8),
                                                        /// Date
                                                        customText(
                                                           formattedDate,
                                                            fontSize: 14, fontWeight: FontWeight.w400,
                                                          color: Theme.of(context).brightness == Brightness.dark
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),

                                                        ///Time
                                                        customText(
                                                            formattedTime,
                                                            fontSize: 14, fontWeight: FontWeight.w400,
                                                          color: Theme.of(context).brightness == Brightness.dark
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),

                                                      ],
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Row(
                                                      children:  [
                                                        Icon(Icons.location_on_outlined, size: 18, ),
                                                        SizedBox(width: 8),
                                                        customText(
                                                            filteredList[i].location.toString(),
                                                            fontSize: 14, fontWeight: FontWeight.w400,
                                                          color: Theme.of(context).brightness == Brightness.dark
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),
                                                      ],
                                                    ),


                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        InkWell(
                                            onTap: () {
                                            try{
                                              final event = filteredList[i];

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
                                            child: customButton(text: "Add to my calendar"))
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