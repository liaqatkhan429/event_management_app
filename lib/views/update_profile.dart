
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import '../provider/user.dart';
import '../services/cloudinary.dart';
import '../services/image_picker.dart';
import '../services/user.dart';
import '../widgets/resuble_widgets.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  String? profileImageUrl;

  final CloudinaryService _cloudinaryService = CloudinaryService();
  final UserServices _userServices = UserServices();
  final ImagePickerService _imagePicker = ImagePickerService();

  String userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    // TODO: implement initState
    var userProvider = Provider.of<UserProvider>(context, listen: false);

    nameController = TextEditingController(
      text: userProvider.getUser().userName.toString(),
    );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Edit Detail',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Profile Picture Section
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      userProvider.getUser().profileImage.toString()
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: (){
                        try {
                          pickAndUploadImage();
                        }catch(e){
                          showSnackBar(context, e.toString());
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Username Label
            const Text(
              'Username',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),

            // Text Input Field
            TextField(
              controller: nameController,

              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: GoogleFonts.poppins(
                    fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff505050)
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),

              ),
            ),

            const SizedBox(height: 30),

            // Save Changes Button
            InkWell(
                onTap: ()async {
                  try {
                    setState(() => isLoading = true);

                    await UserServices().mergeData(
                      UserModel(
                        docId: userProvider.getUser().docId!,
                        userName: nameController.text.trim(),
                      ),
                    );

                    UserModel updatedUser = await UserServices()
                        .getUserProfile(userProvider.getUser().docId!);

                    userProvider.setUser(updatedUser);


                    showSnackBar(context, "Profile Updated Successfully");
                    Navigator.pop(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  } finally {
                    setState(() => isLoading = false);
                  }
                },
                child: customButton2(child: isLoading
                    ? CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 0.8,
                )
                    : customText("Save Changes", color: Colors.white)))
          ],
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

    String? url = await _cloudinaryService.uploadImage(imageFile);

    if (url != null) {
      /// 1️ Local state update (instant preview)
      setState(() {
        profileImageUrl = url;
      });

      ///  Firestore update
      await _userServices.mergeData(
        UserModel(
          docId: userId,
          profileImage: url,
        ),
      );

      ///  Provider refresh (IMPORTANT)
      UserModel updatedUser = await _userServices.getUserProfile(userId);
      Provider.of<UserProvider>(context, listen: false).setUser(updatedUser);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile picture updated")),
      );
    }
  }

}
