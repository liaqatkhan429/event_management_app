import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_management_app/services/event.dart';
import 'package:flutter/material.dart';

import '../model/event.dart';
import '../services/cloudinary.dart';
import '../services/image_picker.dart';
import '../widgets/reuseble_widgets.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {

  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController eventDetailsController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

// combine
  late DateTime finalDateTime = DateTime(
    selectedDate!.year,
    selectedDate!.month,
    selectedDate!.day,
    selectedTime!.hour,
    selectedTime!.minute,
  );

  String? imageUrl;
  final CloudinaryService _cloudinaryService = CloudinaryService();
  final ImagePickerService _imagePicker = ImagePickerService();
  bool isUploading = false;
  bool isLoading = false;
  bool isUploaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Padding(
  padding:  EdgeInsets.symmetric(horizontal: 24,),
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
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            const SizedBox(width: 10),
            customText(
              "Create Event",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
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
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
            const SizedBox(height: 6),
            CustomTextFormField(
                controller: titleController,
                hintText: "Title"),
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
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
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
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
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
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
            const SizedBox(height: 6),
            CustomTextFormField(
                controller: locationController,
                hintText: "Location"),

            const SizedBox(height: 24),
            customText(
              "Event Detail",
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
            const SizedBox(height: 6),
            CustomTextFormField(
                controller: eventDetailsController,
                hintText: "Event Details",
            maxLines: 4,
            ),
            const SizedBox(height: 24),
            customText(
              "Upload Image",
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
            const SizedBox(height: 6),
            InkWell(
              onTap: (){
                try {
                  pickAndUploadImage();
                }catch(e){
                  showSnackBar(context, e.toString());
                }
              },
              child: Container(
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
                    const SizedBox(height: 15),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: isUploading
                          ? const CircularProgressIndicator(
                          color: Color(0xff505050),
                        strokeWidth: 0.8,
                      )
                          : isUploaded
                          ? const Icon(Icons.check, size: 55, color: Colors.green)
                          : Image.asset("assets/upload.png"),
                    ),
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
            ),
            const SizedBox(height: 24),

            InkWell(
                onTap: () async{
                  if(titleController.text.isEmpty || locationController.text.isEmpty || eventDetailsController.text.isEmpty){
                    showSnackBar(context, "Fill all fields");
                    return ;
                  }
                  if(selectedDate == null || selectedTime == null){
                    showSnackBar(context, "Select date and time");
                    return ;
                  }
                  if(imageUrl == null){
                    showSnackBar(context, "Select image");
                    return ;
                  }
                  try{
                    isLoading = true;
                    setState(() {});
                    EventServices().createEvent(
                        EventModel(
                          title: titleController.text,
                          dateTime: Timestamp.fromDate(finalDateTime),
                          location: locationController.text,
                          eventDetails: eventDetailsController.text,
                          image: imageUrl,
                          createAt: DateTime.now().millisecondsSinceEpoch,
                        ),
                    ).then((val){
                      isLoading = false;
                      setState(() {});
                      showSnackBar(context, "Event Created Successfully");
                      Navigator.pop(context);
                    }
                    );
                  }catch(e){
                    isLoading = false;
                    setState(() {});
                    showSnackBar(context, e.toString());
                  }
                },
                child: customButton2(
                    width: 392, height: 56,
                    child: isLoading
                        ? CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 0.8,
                    )
                        : customText("Create Event", color: Colors.white)
                ),
            ),
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


  void pickAndUploadImage() async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Select Image Source",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.blue),
                title: const Text("Camera"),
                onTap: () async {
                  Navigator.pop(context);
                  File? imageFile = await _imagePicker.pickFromCamera();
                  if (imageFile != null) {
                    await uploadImageFile(imageFile);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.green),
                title: const Text("Gallery"),
                onTap: () async {
                  Navigator.pop(context);
                  File? imageFile = await _imagePicker.pickFromGallery();
                  if (imageFile != null) {
                    await uploadImageFile(imageFile);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Upload to Cloudinary & save URL in Firestore
  Future<void> uploadImageFile(File imageFile) async {
    setState(() {
      isUploading = true;
      isUploaded = false;
    });

    String? url = await _cloudinaryService.uploadImage(imageFile);

    if (url != null) {
      setState(() {
        imageUrl = url;
        isUploading = false;
        isUploaded = true;
        showSnackBar(context, "Image Uploaded");
      });
    } else {
      setState(() {
        isUploading = false;
        isUploaded = false;
      });
    }
  }
}
