
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
import '../widgets/reuseble_widgets.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController nameController = TextEditingController();
  bool isLoading = false;
  bool isUploading = false;


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
      text: userProvider.getUser().userName ?? "User",
    );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black12
          : Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black12
            : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back,   color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Edit Details',
          style: TextStyle(

            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
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
                  Container(
                    height: 142,
                    width: 142,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black12.withValues(alpha: 0.1),
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: userProvider.getUser().profileImage != null
                              ? NetworkImage(userProvider.getUser().profileImage!)
                              : const AssetImage("assets/user2.png") as ImageProvider,
                          fit: BoxFit.cover,
                        )
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
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: isUploading
                            ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 0.6,
                            color: Colors.white,
                          ),
                        )
                            : const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Username Label
             Text(
              'Username',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
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

    setState(() {
      isUploading = true;
    });
    String? url = await _cloudinaryService.uploadImage(imageFile);

    if (url != null) {
      /// 1️ Local state update (instant preview)
      setState(() {
        profileImageUrl = url;
        isUploading = false;
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
      showSnackBar(context, "Profile Image Updated");
    }
  }

}
