import 'dart:io';

import 'package:event_management_app/services/vote.dart';
import 'package:flutter/material.dart';

import '../model/vote.dart';
import '../services/cloudinary.dart';
import '../services/image_picker.dart';
import '../widgets/reuseble_widgets.dart';

class VoteScreen extends StatefulWidget {
  const VoteScreen({super.key});

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  TextEditingController questionController = TextEditingController();
  TextEditingController optionOneController = TextEditingController();
  TextEditingController optionTwoController = TextEditingController();

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
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  customText(
                    "Vote",
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
                    "Question",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  const SizedBox(height: 6),
                  CustomTextFormField(
                      controller: questionController,
                      hintText: "Enter Question",
                  ),
                  const SizedBox(height: 24),

                  customText(
                    "Options",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  const SizedBox(height: 6),
                  CustomTextFormField(
                    controller: optionOneController,
                    hintText: "Option 1",
                  ),
                  const SizedBox(height: 18),
                  CustomTextFormField(
                    controller: optionTwoController,
                    hintText: "Option 2",
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
                  const SizedBox(height: 200),

                  InkWell(
                    onTap: () async{
                      if(questionController.text.isEmpty || optionOneController.text.isEmpty || optionTwoController.text.isEmpty) {
                        showSnackBar(context, "Fill all fields");
                        return ;
                      }
                      if(imageUrl == null){
                        showSnackBar(context, "Select image");
                        return ;
                      }
                      try{
                        isLoading = true;
                        setState(() {});
                        VoteServices().createQuestion(
                          VoteModel(
                          question: questionController.text,
                          optionOne: optionOneController.text,
                          optionTwo: optionTwoController.text,
                            image: imageUrl,
                        ),
                        ).then((val){
                          isLoading = false;
                          setState(() {});
                          showSnackBar(context, "Question Created Successfully");
                          Navigator.pop(context);
                        });
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
                            : customText("Vote", color: Colors.white)
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
      });
    } else {
      setState(() {
        isUploading = false;
        isUploaded = false;
      });
    }
  }
}
