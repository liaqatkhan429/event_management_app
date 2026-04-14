import 'package:event_management_app/widgets/resuble_widgets.dart';
import 'package:flutter/material.dart';

import 'calender.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

bool  isSelected = false;
int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body:   Container(
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
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              String? selectedGroup;

                              return StatefulBuilder(
                                builder: (context, setState) {
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
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 23),
                                            customText(
                                              "City",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                            const SizedBox(height: 6),
                                            CustomDropdown(
                                              hintText: "Select City",
                                            ),
                                            const SizedBox(height: 23),
                                            customText(
                                              "State",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                            const SizedBox(height: 6),
                                            CustomDropdown(
                                              hintText: "Select City",
                                            ),
                                            const SizedBox(height: 23),
                                            customText(
                                              "Groups",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                            const SizedBox(height: 6),
                                            CustomDropdown(hintText: "Group"),
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
                                                      setState(() {
                                                        selectedGroup = "";
                                                      });
                                                    },
                                                    child: customButton(text: "Clear Filter",fontSize: 14,fontWeight: FontWeight.w600,height: 45,width: 132,color: Colors.transparent,txtColor: Color(0xff555555),borderColor: Colors.black)),
                                                customButton(text: "Apply Filter",fontSize: 14,fontWeight: FontWeight.w600,height: 45,width: 132),
                                              ],
                                            )

                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Image.asset("assets/filter.png",height: 42,width: 42,),
                      ),
                    ],
                  ),
                  const SizedBox(height: 38),

                  ///////
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
                            Container(
                              height: 165,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: BoxBorder.all(
                                  color: Color(0xffCFCFCF),
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset("assets/user.png"),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            customText(
                                              "Tech Meetup",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                            customText(
                                              "Wed, 5 Nov 2025, 2:00PM - 3:00PM",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Color(0xff7A7A7A),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Icon(Icons.favorite_outline_rounded,color: Color(0xff555555),),
                                      ],
                                    ),
                                    const SizedBox(height: 13),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Color(0xffCF3232),
                                        ),
                                        const SizedBox(width: 8),
                                        customText(
                                          "2464 Royal Ln. Mesa, New Jersey 45463",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff3C3C3C),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    customButton(
                                      text: "Add to my calendar",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 42,
                                      width: 172,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Container(
                              height: 165,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: BoxBorder.all(
                                  color: Color(0xffCFCFCF),
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset("assets/user.png"),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            customText(
                                              "Tech Meetup",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                            customText(
                                              "Wed, 5 Nov 2025, 2:00PM - 3:00PM",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Color(0xff7A7A7A),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Icon(Icons.favorite_outline_rounded,color: Color(0xff555555),),
                                      ],
                                    ),
                                    const SizedBox(height: 13),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Color(0xffCF3232),
                                        ),
                                        const SizedBox(width: 8),
                                        customText(
                                          "2464 Royal Ln. Mesa, New Jersey 45463",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff3C3C3C),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    customButton(
                                      text: "Add to my calendar",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 42,
                                      width: 172,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16,),
                          ],
                        )
                            : ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, i){

                              return  Column(
                                children: [
                                  Container(
                                    height: 165,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: BoxBorder.all(
                                        color: Color(0xffCFCFCF),
                                        width: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 14,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset("assets/user.png"),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  customText(
                                                    "Tech Meetup",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                  ),
                                                  customText(
                                                    "Wed, 5 Nov 2025, 2:00PM - 3:00PM",
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: Color(0xff7A7A7A),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Icon(Icons.favorite_outline_rounded,color: Color(0xff555555),),
                                            ],
                                          ),
                                          const SizedBox(height: 13),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: Color(0xffCF3232),
                                              ),
                                              const SizedBox(width: 8),
                                              customText(
                                                "2464 Royal Ln. Mesa, New Jersey 45463",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff3C3C3C),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          customButton(
                                            text: "Add to my calendar",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            height: 42,
                                            width: 172,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16,),
                                ],
                              );

                            })

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

        )
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

class CustomDropdown extends StatefulWidget {
  final String hintText;

  const CustomDropdown({super.key, required this.hintText});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  final List<String> items = ["Option 1", "Option 2", "Option 3"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(width: 0.4, color: Color(0xff838383)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: customText(
            widget.hintText,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),

          items: items.map((item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),

          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
        ),
      ),
    );
  }
}
