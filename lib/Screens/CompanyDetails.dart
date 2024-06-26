import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Screens/Otp.dart';
import 'package:yakcompany/Screens/UnderReview.dart';
import 'package:yakcompany/Widgets/button_widget.dart';

import '../Constants/BaseUrl.dart';

class CompanyDetails extends StatefulWidget {
  const CompanyDetails({super.key});

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  Widget _buildImage(String assetName, [double width = 300]) {
    return Image.asset('assets/$assetName', width: width);
  }

  Widget _buildSvgImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  TextStyle basicText = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w600, color: AppColors.blackColor);

  TextStyle smallText = TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.blackColor);

  String? _savedNumber;

  @override
  void initState() {
    super.initState();
    _retrieveName();
  }

  Future<void> _retrieveName() async {
    final prefs = await SharedPreferences.getInstance();

    // Check where the name is saved before or not
    if (!prefs.containsKey('company')) {
      print(prefs.getString('company'));
      return;
    }

    setState(() {
      print(" vadsf == " + prefs.getString('company').toString());
      _savedNumber = prefs.getString('company');
      _companyNameController.text = _savedNumber!;
    });
  }
  final TextEditingController _companyNameController = TextEditingController();

  File? _image1;
  File? _image2;
  File? _image3;
  File? _image4;
  int isClick = 0;

  Future<void> _getImage(ImageSource source, int imageNumber) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        switch (imageNumber) {
          case 1:
            _image1 = File(pickedFile.path);
            break;
          case 2:
            _image2 = File(pickedFile.path);
            break;
          case 3:
            _image3 = File(pickedFile.path);
            break;
          case 4:
            _image4 = File(pickedFile.path);
            break;
        }
      });
    }
  }
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

  Future<void> uploadImage() async {
    if ((_image1 == null && _image2 == null && _image3 == null && _image4 == null) || _companyNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select images and enter a company name.')),
      );
      return;
    }

    String imageBaseUrl = "https://your-server-url.com/images/";
    var url = BaseUrl.login;
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );

    request.fields['company_name'] = _companyNameController.text;
    request.fields['image_base_url'] = imageBaseUrl;

    if (_image1 != null) {
      String fileName1 = _image1!.path.split('/').last;
      request.files.add(
        await http.MultipartFile.fromPath('company_doc[]', _image1!.path, filename: fileName1),
      );
    }

    if (_image2 != null) {
      String fileName2 = _image2!.path.split('/').last;
      request.files.add(
        await http.MultipartFile.fromPath('company_doc[]', _image2!.path, filename: fileName2),
      );
    }
    if (_image3 != null) {
      String fileName3 = _image3!.path.split('/').last;
      request.files.add(
        await http.MultipartFile.fromPath('company_doc[]', _image3!.path, filename: fileName3),
      );
    }
    if (_image4 != null) {
      String fileName4 = _image4!.path.split('/').last;
      request.files.add(
        await http.MultipartFile.fromPath('company_doc[]', _image4!.path, filename: fileName4),
      );
    }


    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        var data = jsonDecode(await response.stream.bytesToString());
        print(data);
        print(response.statusCode);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Otp()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload successful!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload failed with status: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: InkWell(
              onTap: () {
                Get.back();
              },
              child: _buildSvgImage('back.svg', 20)),

          automaticallyImplyLeading: false,
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const SizedBox(
                    height: 0,
                  ),
                  Text(
                    'Complete your company details',
                    style: basicText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Add your latest photo to complete you profile.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.fontGrayColors),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Enter your company name',
                      style: smallText,
                      children: <TextSpan>[
                        TextSpan(
                            text: '*',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.themeColor)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    height: 60,
                    child: TextField(
                      controller: _companyNameController,
                      style: smallText,
                      decoration: InputDecoration(
                        hintText: 'Codemeg Travelers Pvt. Ltd.',
                        hintStyle: TextStyle(
                            fontSize: 14, color: AppColors.grayColor99),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(.2),
                        contentPadding: const EdgeInsets.all(7),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Upload government issued company documents',
                      style: smallText,
                      children: <TextSpan>[
                        TextSpan(
                            text: '*',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.themeColor)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),

                 InkWell(
                    onTap: () => _showPicker(context ,1),
                    child:  Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.inputColor, width: 1),
                          color: Colors.grey.withOpacity(.2),
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.all(Radius.circular(7))),
                      child: Column(children: [
                        _buildSvgImage('upload.svg', 25),
                        const SizedBox(
                          height: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 22,right: 22),
                          child: Text(
                            'Choose images from your gallery and upload them.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.fontGrayColors),
                          ),
                        ),
                      ]),
                    )
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            _showPicker(context, 1);
                          });
                        },
                     child:
                        Container(
                          width: 150,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  15) // Adjust the radius as needed
                              ),
                          child: _image1 != null
                              ? Image.file(_image1!, fit: BoxFit.cover)
                              : Image.asset('assets/img_bg.png', fit: BoxFit.cover),
                          //     ? Image.file(_image1!)
                          //     : Image.asset(
                          //   'assets/img_bg.png',
                          //   fit: BoxFit.cover,
                          // ),
                        )
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            _showPicker(context, 2);
                          });
                        },
                        child: Container(
                          width: 150,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)
                          ),// Adjust the radius as needed
                              child: _image2 != null
                          ? Image.file(_image2!, fit: BoxFit.cover)
                                : Image.asset('assets/img_bg.png', fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            _showPicker(context, 3);
                          });
                        },
                        child: Container(
                          width: 150,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  15) // Adjust the radius as needed
                              ),
                          child: _image3 != null
                              ? Image.file(_image3!, fit: BoxFit.cover)
                              : Image.asset('assets/img_bg.png', fit: BoxFit.cover),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            _showPicker(context, 4);
                          });
                        },
                        child: Container(
                          width: 150,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  15) // Adjust the radius as needed
                              ),
                          child: _image4 != null
                              ? Image.file(_image4!, fit: BoxFit.cover)
                              : Image.asset('assets/img_bg.png', fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                      const SizedBox(
                        height: 15,
                      ),
                      ButtonWidget(
                          text: 'Submit',
                          onPressed: () {
                            Get.to(()=>const Otp());
                            uploadImage();
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                ]))));
  }
}
