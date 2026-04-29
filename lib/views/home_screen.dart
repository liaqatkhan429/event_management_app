import 'package:event_management_app/model/event.dart';
import 'package:event_management_app/services/event.dart';
import 'package:event_management_app/widgets/reuseble_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/calender.dart';
import 'calender.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Color _getNextColor(int index) {
    List<Color> colors = [
      Color(0xff00B383),
      Color(0xffCF3232),
      Color(0xff0095FF),

    ];

    return colors[index % colors.length];
  }

  DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
  bool isSelected = false;
  int selectedTab = 0;
  List<String> stateList = ["Pakistan"];
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
  List<String> groupList = ["Group1", "Group2", "Group3", "Group4"];
  String? selectedCountry;
  String? selectedCity;
  String? selectedGroup;

  String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/homebg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      customText(
                        "Events",
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
                              return Dialog(
                                insetPadding: EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 130,
                                ),
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
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Icon(Icons.close),
                                            ),
                                            const SizedBox(width: 101),
                                            customText(
                                              "Filter Events",
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  Theme.of(
                                                        context,
                                                      ).brightness ==
                                                      Brightness.dark
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
                                          color:
                                              Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white70
                                              : Colors.black,
                                        ),
                                        const SizedBox(height: 6),
                                        CustomDropdown(
                                          hintText: "Select City",
                                          items: cityList,
                                          selectedValue: selectedCity,
                                          onChanged: (value) {
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
                                          color:
                                              Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white70
                                              : Colors.black,
                                        ),
                                        const SizedBox(height: 6),
                                        CustomDropdown(
                                          hintText: "Select State",
                                          items: stateList,
                                          selectedValue: selectedCountry,
                                          onChanged: (value) {
                                            selectedCountry = value;
                                          },
                                        ),
                                        const SizedBox(height: 23),
                                        customText(
                                          "Groups",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color:
                                              Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white70
                                              : Colors.black,
                                        ),
                                        const SizedBox(height: 6),
                                        CustomDropdown(
                                          hintText: "Group",
                                          items: groupList,
                                          selectedValue: selectedGroup,
                                          onChanged: (value) {
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
                                                color:
                                                    selectedGroup == "Religious"
                                                    ? buttonColor
                                                    : Colors.transparent,
                                                borderColor:
                                                    selectedGroup == "Religious"
                                                    ? Colors.transparent
                                                    : const Color(0xff545454),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Image.asset(
                                                      "assets/religion.png",
                                                      height: 20,
                                                      width: 20,
                                                      color:
                                                          selectedGroup ==
                                                              "Religious"
                                                          ? Colors.white
                                                          : const Color(
                                                              0xff545454,
                                                            ),
                                                    ),
                                                    customText(
                                                      "Religious",
                                                      fontSize: 12,
                                                      color:
                                                          selectedGroup ==
                                                              "Religious"
                                                          ? Colors.white
                                                          : const Color(
                                                              0xff545454,
                                                            ),
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
                                                color:
                                                    selectedGroup == "Business"
                                                    ? buttonColor
                                                    : Colors.transparent,
                                                borderColor:
                                                    selectedGroup == "Business"
                                                    ? Colors.transparent
                                                    : const Color(0xff545454),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Image.asset(
                                                      "assets/business.png",
                                                      height: 20,
                                                      width: 20,
                                                      color:
                                                          selectedGroup ==
                                                              "Business"
                                                          ? Colors.white
                                                          : const Color(
                                                              0xff545454,
                                                            ),
                                                    ),
                                                    customText(
                                                      "Business",
                                                      fontSize: 12,
                                                      color:
                                                          selectedGroup ==
                                                              "Business"
                                                          ? Colors.white
                                                          : const Color(
                                                              0xff545454,
                                                            ),
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
                                                color:
                                                    selectedGroup ==
                                                        "Religious2"
                                                    ? buttonColor
                                                    : Colors.transparent,
                                                borderColor:
                                                    selectedGroup ==
                                                        "Religious2"
                                                    ? Colors.transparent
                                                    : const Color(0xff545454),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Image.asset(
                                                      "assets/religious.png",
                                                      height: 20,
                                                      width: 20,
                                                      color:
                                                          selectedGroup ==
                                                              "Religious2"
                                                          ? Colors.white
                                                          : const Color(
                                                              0xff545454,
                                                            ),
                                                    ),
                                                    customText(
                                                      "Religious",
                                                      fontSize: 12,
                                                      color:
                                                          selectedGroup ==
                                                              "Religious2"
                                                          ? Colors.white
                                                          : const Color(
                                                              0xff545454,
                                                            ),
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
                                                color:
                                                    selectedGroup == "Education"
                                                    ? buttonColor
                                                    : Colors.transparent,
                                                borderColor:
                                                    selectedGroup == "Education"
                                                    ? Colors.transparent
                                                    : const Color(0xff545454),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Image.asset(
                                                      "assets/education.png",
                                                      height: 20,
                                                      width: 20,
                                                      color:
                                                          selectedGroup ==
                                                              "Education"
                                                          ? Colors.white
                                                          : const Color(
                                                              0xff545454,
                                                            ),
                                                    ),
                                                    customText(
                                                      "Education",
                                                      fontSize: 12,
                                                      color:
                                                          selectedGroup ==
                                                              "Education"
                                                          ? Colors.white
                                                          : const Color(
                                                              0xff545454,
                                                            ),
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
                                                color:
                                                    selectedGroup == "Community"
                                                    ? buttonColor
                                                    : Colors.transparent,
                                                borderColor:
                                                    selectedGroup == "Community"
                                                    ? Colors.transparent
                                                    : const Color(0xff545454),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Image.asset(
                                                      "assets/community.png",
                                                      height: 20,
                                                      width: 20,
                                                      color:
                                                          selectedGroup ==
                                                              "Community"
                                                          ? Colors.white
                                                          : const Color(
                                                              0xff545454,
                                                            ),
                                                    ),
                                                    customText(
                                                      "Community",
                                                      fontSize: 12,
                                                      color:
                                                          selectedGroup ==
                                                              "Community"
                                                          ? Colors.white
                                                          : const Color(
                                                              0xff545454,
                                                            ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 24),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedCity = null;
                                                  selectedCountry = null;
                                                  selectedGroup = null;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: customButton(
                                                text: "Clear Filter",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                height: 45,
                                                width: 132,
                                                color: Colors.transparent,
                                                txtColor: Color(0xff555555),
                                                borderColor: Colors.black,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              child: customButton(
                                                text: "Apply Filter",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                height: 45,
                                                width: 132,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Image.asset(
                          "assets/filter.png",
                          height: 42,
                          width: 42,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),

                  ///// tabbar
                  Row(
                    children: [
                      _buildTab("Calendar view", 0),
                      const SizedBox(width: 10),
                      _buildTab("List view", 1),
                    ],
                  ),
                  const SizedBox(height: 22),

                  Expanded(
                    child: TabBarView(
                      children: [
                        selectedTab == 0
                            ? ListView(
                                children: [
                                  CustomCalendar(),
                                  const SizedBox(height: 14),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: customText(
                                      "Today Events",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  StreamProvider<List<EventModel>>.value(
                                    value: EventServices().getTodaysEvents(),
                                    initialData: [],
                                    builder: (context, child) {
                                      final list = context
                                          .watch<List<EventModel>>();
                                      final filteredList = list.where((event) {
                                        final location =
                                            event.location?.toLowerCase() ?? "";

                                        final cityMatch =
                                            selectedCity == null ||
                                            selectedCity!.isEmpty ||
                                            location.contains(
                                              selectedCity!.toLowerCase(),
                                            );

                                        final countryMatch =
                                            selectedCountry == null ||
                                            selectedCountry!.isEmpty ||
                                            location.contains(
                                              selectedCountry!.toLowerCase(),
                                            );

                                        return (cityMatch || countryMatch);
                                      }).toList();

                                      if (filteredList.isEmpty) {
                                        return const Center(
                                          child: Text(
                                            "No Data Found.!",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        );
                                      }

                                      return ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: filteredList.length,
                                        itemBuilder: (context, i) {
                                          String formattedDate =
                                              DateFormat(
                                                'EEE, d MMM yyyy',
                                              ).format(
                                                filteredList[i].dateTime!
                                                    .toDate(),
                                              );
                                          String formattedTime =
                                              DateFormat(' hh:mm a').format(
                                                filteredList[i].dateTime!
                                                    .toDate(),
                                              );
                                          return Column(
                                            children: [
                                              Container(
                                                height: 165,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: BoxBorder.all(
                                                    color: Color(0xffCFCFCF),
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 14,
                                                      ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Image.network(
                                                            filteredList[i]
                                                                .image
                                                                .toString(),
                                                            width: 50,
                                                            height: 46,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              customText(
                                                                filteredList[i]
                                                                    .title
                                                                    .toString(),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 16,
                                                                color:
                                                                    Theme.of(
                                                                          context,
                                                                        ).brightness ==
                                                                        Brightness
                                                                            .dark
                                                                    ? Colors
                                                                          .white
                                                                    : Colors
                                                                          .black,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  customText(
                                                                    formattedDate,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12,
                                                                    color: Color(
                                                                      0xff7A7A7A,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  customText(
                                                                    formattedTime,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12,
                                                                    color: Color(
                                                                      0xff7A7A7A,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          const Spacer(),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            onTap: () async {
                                                              try {
                                                                if (filteredList[i]
                                                                    .favorite!
                                                                    .contains(
                                                                      userId,
                                                                    )) {
                                                                  await EventServices().removeFromFavorite(
                                                                    eventID: filteredList[i]
                                                                        .docId
                                                                        .toString(),
                                                                    userID:
                                                                        userId,
                                                                  );
                                                                } else {
                                                                  await EventServices().addToFavorite(
                                                                    eventID: filteredList[i]
                                                                        .docId
                                                                        .toString(),
                                                                    userID:
                                                                        userId,
                                                                  );
                                                                }
                                                              } catch (e) {
                                                                showSnackBar(
                                                                  context,
                                                                  e.toString(),
                                                                );
                                                              }
                                                            },
                                                            child:
                                                                filteredList[i]
                                                                    .favorite!
                                                                    .contains(
                                                                      userId,
                                                                    )
                                                                ? Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color: Colors
                                                                        .red,
                                                                  )
                                                                : Image.asset(
                                                                    "assets/fivorite.png",
                                                                    height: 24,
                                                                    width: 24,
                                                                    color: Color(
                                                                      0xff555555,
                                                                    ),
                                                                  ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 13,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.location_on,
                                                            color: Color(
                                                              0xffCF3232,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          customText(
                                                            filteredList[i]
                                                                .location
                                                                .toString(),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                              0xff3C3C3C,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 8),

                                                      //// calender view
                                                      InkWell(
                                                        onTap: () {
                                                         try{
                                                           final event = list[i];

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
                                                          text:
                                                          "Add to my calendar",
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          height: 42,
                                                          width: 172,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              )
                            : StreamProvider<List<EventModel>>.value(
                          value: EventServices().getTodaysEvents(),
                          initialData: [],
                          builder: (context, child) {
                            final list = context
                                .watch<List<EventModel>>();
                            final filteredList = list.where((event) {
                              final location =
                                  event.location?.toLowerCase() ?? "";

                              final cityMatch =
                                  selectedCity == null ||
                                      selectedCity!.isEmpty ||
                                      location.contains(
                                        selectedCity!.toLowerCase(),
                                      );

                              final countryMatch =
                                  selectedCountry == null ||
                                      selectedCountry!.isEmpty ||
                                      location.contains(
                                        selectedCountry!.toLowerCase(),
                                      );

                              return (cityMatch || countryMatch);
                            }).toList();

                            if (filteredList.isEmpty) {
                              return const Center(
                                child: Text(
                                  "No Data Found.!",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }


                            return ListView.builder(
                              itemCount: filteredList.length,
                              itemBuilder: (context, i) {
                                String formattedDate =
                                DateFormat(
                                  'EEE, d MMM yyyy',
                                ).format(
                                  filteredList[i].dateTime!
                                      .toDate(),
                                );
                                String formattedTime =
                                DateFormat(' hh:mm a').format(
                                  filteredList[i].dateTime!
                                      .toDate(),
                                );
                                return Column(
                                  children: [
                                    Container(
                                      height: 165,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        border: BoxBorder.all(
                                          color: Color(0xffCFCFCF),
                                          width: 1,
                                        ),
                                      ),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 14,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.network(
                                                  filteredList[i]
                                                      .image
                                                      .toString(),
                                                  width: 50,
                                                  height: 46,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    customText(
                                                      filteredList[i]
                                                          .title
                                                          .toString(),
                                                      fontWeight:
                                                      FontWeight
                                                          .w500,
                                                      fontSize: 16,
                                                      color:
                                                      Theme.of(
                                                        context,
                                                      ).brightness ==
                                                          Brightness
                                                              .dark
                                                          ? Colors
                                                          .white
                                                          : Colors
                                                          .black,
                                                    ),
                                                    Row(
                                                      children: [
                                                        customText(
                                                          formattedDate,
                                                          fontWeight:
                                                          FontWeight
                                                              .w400,
                                                          fontSize:
                                                          12,
                                                          color: Color(
                                                            0xff7A7A7A,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        customText(
                                                          formattedTime,
                                                          fontWeight:
                                                          FontWeight
                                                              .w400,
                                                          fontSize:
                                                          12,
                                                          color: Color(
                                                            0xff7A7A7A,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                InkWell(
                                                  splashColor: Colors
                                                      .transparent,
                                                  onTap: () async {
                                                    try {
                                                      if (filteredList[i]
                                                          .favorite!
                                                          .contains(
                                                        userId,
                                                      )) {
                                                        await EventServices().removeFromFavorite(
                                                          eventID: filteredList[i]
                                                              .docId
                                                              .toString(),
                                                          userID:
                                                          userId,
                                                        );
                                                      } else {
                                                        await EventServices().addToFavorite(
                                                          eventID: filteredList[i]
                                                              .docId
                                                              .toString(),
                                                          userID:
                                                          userId,
                                                        );
                                                      }
                                                    } catch (e) {
                                                      showSnackBar(
                                                        context,
                                                        e.toString(),
                                                      );
                                                    }
                                                  },
                                                  child:
                                                  filteredList[i]
                                                      .favorite!
                                                      .contains(
                                                    userId,
                                                  )
                                                      ? Icon(
                                                    Icons
                                                        .favorite,
                                                    color: Colors
                                                        .red,
                                                  )
                                                      : Image.asset(
                                                    "assets/fivorite.png",
                                                    height: 24,
                                                    width: 24,
                                                    color: Color(
                                                      0xff555555,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 13,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: Color(
                                                    0xffCF3232,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                customText(
                                                  filteredList[i]
                                                      .location
                                                      .toString(),
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  color: Color(
                                                    0xff3C3C3C,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            InkWell(
                                              onTap: () {
                                                try{
                                                  final event = list[i];

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
                                                text:
                                                "Add to my calendar",
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.w500,
                                                height: 42,
                                                width: 172,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    bool isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },
        child: customButton(
          height: 44,
          width: 152,
          fontSize: 16,
          text: text,
          color: isSelected ? buttonColor : Colors.transparent,
          txtColor: isSelected ? Colors.white : Color(0xff727272),
        ),
      ),
    );
  }

}

Widget customDialog() {
  return Container(
    width: 392,
    height: 525,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.close),
              const SizedBox(width: 101),
              customText(
                "Filter Events",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
