

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Screens/CompanyDetails.dart';
import 'package:yakcompany/Screens/Otp.dart';
import 'package:yakcompany/Widgets/button_widget.dart';

import '../Constants/BaseUrl.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({Key? key}) : super(key: key);

  @override
  State<AddProfile> createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {

  Widget _buildImage(String assetName, [double width = 50]) {
    return Image.asset('assets/$assetName', width: width);
  }

  TextStyle basicText = TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor);

  TextStyle smallText = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor);

  File? _image;

  var imageURL = '';

  void _showPicker(BuildContext context, int imageNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an Image'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Gallery'),
                  onTap: () {
                    _getImage(ImageSource.gallery, imageNumber);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _getImage(ImageSource.camera, imageNumber);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Future<void> _getImage(ImageSource source, int imageNumber) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (imageNumber == 1) {
          _image = File(pickedFile.path);
        }
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70,),
                Center(child: _buildImage('logo.png', 100)),
                const SizedBox(height: 40,),
                Text('Complete your profile',
                  style:basicText,
                ),
                const SizedBox(height: 10,),
                Text(
                  'Add your latest photo to complete you profile',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.fontGrayColors),
                ),
                const SizedBox(height: 30,),
               // Center(child: _buildSvgImage('avatar.svg', 90)),

                Center(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap : ()=> _showPicker(context, 1),
                        child: CircleAvatar(
                          radius: 80,
                          child: ClipOval(
                          child: _image == null && imageURL.isEmpty
                              ? Image.network(
                            'https://picsum.photos/seed/picsum/200/300',
                            fit: BoxFit.cover,
                            width: 160,
                            height: 160,
                          )
                              : _image != null
                              ? Image.file(
                            _image!,
                            fit: BoxFit.cover,
                            width: 160,
                            height: 160,
                          )
                              : Image.network(
                            imageURL,
                            fit: BoxFit.cover,
                            width: 160,
                            height: 160,
                          ),
                        ),
                        )
                      ),
                      // Positioned(
                      //     bottom: -0,
                      //     left: 110,
                      //     child: IconButton(onPressed: (){
                      //       showImagePickerOption(context);
                      //     },icon:const Icon(Icons.add_a_photo),))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: ButtonWidget(
                      text: 'Next',
                      onPressed: () {
                      //  Get.to(()=>const Otp());
                        Get.to(()=>const CompanyDetails());
                      }),
                ),
                const SizedBox(height: 25),
          Center(
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Otp(),));
              },
              child: Text(
                'Skip for now',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.fontGrayColors),
              ),
            ),
          ),

              ]),
        ),),
    );

  }
}

