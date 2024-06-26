import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Screens/SignUp.dart';
import 'package:http/http.dart' as http;

import '../Constants/BaseUrl.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controller = TextEditingController();
  var isLength = 0;

  Widget _buildImage(String assetName, [double width = 50]) {
    return Image.asset('assets/$assetName', width: width);
  }

  Widget _buildSvgImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  TextStyle basicText = TextStyle(
      fontSize: 17.0, fontWeight: FontWeight.w600, color: AppColors.blackColor);

  // this function will save the name to the shared preferences
  Future<void> _saveName() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('phone', controller.text);
  }

  late bool isLg = false;
  final _loginFormKey = GlobalKey<FormState>();

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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 70,
            ),
            Center(child: _buildImage('logo.png', 100)),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Enter your mobile number',
              style: basicText,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Please Enter your Registered Mobile Number to get OTP',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.fontGrayColors),
            ),
            const SizedBox(
              height: 30,
            ),
            IntlPhoneField(
              controller: controller,
              flagsButtonPadding: const EdgeInsets.all(4),
              dropdownIconPosition: IconPosition.trailing,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(.2),
                counterText: "",
                contentPadding: const EdgeInsets.all(7),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                setState(() {
                  isLength = phone.number.length;
                  print(phone.completeNumber);
                });
              },
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              height: 48,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    elevation: 2,
                    backgroundColor: isLength > 7
                        ? AppColors.themeColor
                        : AppColors.themeColor.withOpacity(.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    //const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  onPressed: () {
                    //  Get.to(const SignUp());
                    _saveName();
                    _handleLoginUser();
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor),
                  )),
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> _handleLoginUser() async {
  //   print('login');
  //   if (_loginFormKey.currentState!.validate()) {
  //     print(' if login');
  //     setState(() {
  //       isLg = true;
  //     });
  //     bool isConnected = await checkInternetConnectivity();
  //
  //     isConnected ? login(
  //         controller.text.toString(), controller.text.toString()) :
  //     Fluttertoast.showToast(
  //         msg: "No internet connection",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         textColor: Colors.white,
  //         fontSize: 16.0
  //     );
  //   } else {
  //     print(' else login');
  //   }
  // }
  //
  // login(emailOrPhone, password) async
  // {
  //   Map data = {
  //     'username': emailOrPhone,
  //     'password': password,
  //     'device_type': 'android',
  //     // 'device_id': device_id,
  //     // 'device_token' : device_token
  //   };
  //   print(data.toString());
    var url = BaseUrl.login;
    final response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },

        body: {
          'phone': controller.text,
          'device_type': 'android',
          // 'device_id': device_id,
          // 'device_token' : device_token
        },
        encoding: Encoding.getByName("utf-8")
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      //LoginResponse.fromJson(jsonDecode(response.body.toString()));
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
      print(data);
      setState(() {
        isLg = false;
      });
      print(data['status']);
      print(data['data']);
      print(data['page']);
      if (data['status']) {
        Fluttertoast.showToast(
            msg: data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0
        );
         //Toast.show(data['message'], context,);
      }

      // data['status']? Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen())): Toast.show(data['message'], context,);

    }
  }
}
