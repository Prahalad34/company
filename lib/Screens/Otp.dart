
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Screens/UnderReview.dart';
import 'package:yakcompany/Widgets/button_widget.dart';
import 'package:http/http.dart' as http;
import '../Constants/BaseUrl.dart';
import 'AddProfile.dart';
import 'HomeScreen.dart';


class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();


  Widget _buildSvgImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

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

  String? _savedNumber;
  late bool isLg = false;

  @override
  void initState() {
    super.initState();
    _retrieveName();
  }

  Future<void> _retrieveName() async {
    final prefs = await SharedPreferences.getInstance();

    // Check where the name is saved before or not
    if (!prefs.containsKey('phone')) {
      print(prefs.getString('phone'));
      return;
    }
    if (!prefs.containsKey('name')) {
      print(prefs.getString('name'));
      return;
    }
    if (!prefs.containsKey('email')) {
      print(prefs.getString('email'));
      return;
    }
    if (!prefs.containsKey('company')) {
      print(prefs.getString('company'));
      return;
    }
    if (!prefs.containsKey('data')) {
      print(prefs.getString('data'));
      return;
    }

    setState(() {
      print(" Number == " + prefs.getString('phone').toString());
      _savedNumber = prefs.getString('phone');
      phoneController.text = _savedNumber!;
      print(" Name == " + prefs.getString('name').toString());
      _savedNumber = prefs.getString('name');
      nameController.text = _savedNumber!;
      print(" Email == " + prefs.getString('email').toString());
      _savedNumber = prefs.getString('email');
      emailController.text = _savedNumber!;
      print(" Company == " + prefs.getString('company').toString());
      _savedNumber = prefs.getString('company');
      companyController.text = _savedNumber!;
    });
  }

  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false; // No internet connection
    } else {
      return true; // Internet connection available
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
                Text('Verification Code',
                  style: basicText,
                ),
                const SizedBox(height: 10,),
                Text(
                  '5-Digit verification code has been sent to your registered mobile number.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.fontGrayColors),
                ),
                const SizedBox(height: 30,),
                Stack(
                  children: [
                    IntlPhoneField(
                      controller: phoneController,
                      flagsButtonPadding: const EdgeInsets.all(4),
                      dropdownIconPosition: IconPosition.trailing,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(.2),
                        counterText: "",
                        contentPadding: const EdgeInsets.all(7),
                      ),
                      initialCountryCode: 'IN',

                      onChanged: (phone) {
                        setState(() {
                          print(phone.completeNumber);
                          phoneController =
                          phone.completeNumber as TextEditingController;
                        });
                      },
                    ),

                    Positioned(
                        right: 7,
                        top: 1,
                        bottom: 1,
                        child: Center(
                          child: Text(
                            'Change',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.themeColor),),
                        )
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 56,
                  child: OtpTextField(
                    numberOfFields: 5,
                    borderColor: AppColors.themeColor,
                    focusedBorderColor: AppColors.themeColor,
                    cursorColor: AppColors.themeColor,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    fieldWidth: 50,
                    borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Verification Code"),
                              content: Text(
                                  'Code entered is $verificationCode'),
                            );
                          }
                      );
                    }, // end onSubmit
                  ),
                ),


                const SizedBox(
                  height: 35,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: ButtonWidget(
                      text: 'Send',
                      onPressed: () {
                         Get.to(const HomeScreen());
                        //verifyOtp(emailController.text,nameController.text,phoneController.text);
                      }),
                ),
                const SizedBox(height: 25),
                Center(
                  child: Text(
                    'Haven’t received the verification code?',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.fontGrayColors),
                  ),
                ),

                Center(
                  child: Text(
                    'Resend',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.themeColor),
                  ),
                ),
              ]),
        ),),
    );
  }

    Future<void> verifyOtp(String name, String email, String phone) async {
      var url = BaseUrl.verifyOtp;
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['phone'] = phone;
      request.fields['company_name'] = companyController.text;
      try {
        final response = await request.send();
        if (response.statusCode == 200) {
          var data = jsonDecode(await response.stream.bytesToString());
          print(data);
          Fluttertoast.showToast(
            msg: data['mess'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UnderReview()),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Verification successful!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(
                'Verification failed with status: ${response.statusCode}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $e')),
        );
      }
    }
  }

