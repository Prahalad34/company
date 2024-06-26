


import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Screens/AddProfile.dart';
import 'package:yakcompany/Screens/Login.dart';
import 'package:yakcompany/Widgets/button_widget.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();

  String dropdownValue = 'Select gender';

  Widget _buildImage(String assetName, [double width = 300]) {
    return Image.asset('assets/$assetName', width: width);
  }

  Widget _buildSvgImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
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
  void initState() {
    nameController.clear();
    emailController.clear();
    companyController.clear();
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

    setState(() {
      print(" Number == " + prefs.getString('phone').toString());
      _savedNumber = prefs.getString('phone');
      phoneController.text = _savedNumber!;
    });
  }

  var Data;


  Future<void> _saveName() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('company', companyController.text);
    prefs.setString('name', nameController.text);
    prefs.setString('photo', phoneController.text);
    prefs.setString('email', emailController.text);
   // prefs.setInt('data',);
  }

  @override
  void dispose() {
    super.dispose();
  }

  late bool isLg = false;


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
                Text('Your phone number is not registered',
                  style: basicText,
                ),
                const SizedBox(height: 10,),
                Text(
                  'Kindly input the required details to complete the registration process.',
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
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                            },
                            child: Text(
                              'Change',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.themeColor),),
                          ),
                        )
                    )
                  ],
                ),
                buildFormView(),

                const SizedBox(
                  height: 35,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: ButtonWidget(
                      text: 'Next',
                      onPressed: () {
                        if (_signUpFormKey.currentState?.validate() ?? false) {

                           Get.to(const AddProfile());
                          _saveName();
                        }
                      }),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 0, 45, 10),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'By clicking on “Next” you are agreeing to our  ',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.fontGrayColors),
                      children: <TextSpan>[
                        TextSpan(text: 'Terms of use', style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.themeColor,
                            decoration: TextDecoration.underline)),

                      ],
                    ),
                  ),
                ),
              ]),
        ),),
    );
  }

  Widget buildFormView() =>
      Form(child: Form(
        key: _signUpFormKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 30),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Enter your name',
                  style: smallText,
                  children: <TextSpan>[
                    TextSpan(text: '*', style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.themeColor)),

                  ],
                ),
              ),

              const SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 60,
                child: TextFormField(
                  controller: nameController,
                  style: smallText,
                  decoration: InputDecoration(
                    hintText: 'Harry',
                    hintStyle: TextStyle(
                        fontSize: 14, color: AppColors.grayColor99),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(.2),
                    contentPadding: const EdgeInsets.all(7),
                  ),
                  onSaved: (val) {
                    //  phone = val;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Enter your email',
                  style: smallText,
                  children: <TextSpan>[
                    TextSpan(text: '*', style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.themeColor)),

                  ],
                ),
              ),

              const SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 60,
                child: TextFormField(
                    controller: emailController,
                    style: smallText,
                    decoration: InputDecoration(
                      hintText: 'example@example.com',
                      hintStyle: TextStyle(
                          fontSize: 14, color: AppColors.grayColor99),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(.2),
                      contentPadding: const EdgeInsets.all(7),
                    ),
                    onSaved: (val) {
                      //  phone = val;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a email';
                      }
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    }
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Enter your company name',
                  style: smallText,
                  children: <TextSpan>[
                    TextSpan(text: '*', style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.themeColor)),

                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 60,
                child: TextFormField(
                  controller: companyController,
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
                      ),),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(.2),
                    contentPadding: const EdgeInsets.all(7),
                  ),
                  onSaved: (val) {
                    //  phone = val;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a company name';
                    }
                    return null;
                  },
                ),
              ),

            ]),
      ),);

  // Future<void> _handleLoginUser() async {
  //   if (_signUpFormKey.currentState != null &&
  //       _signUpFormKey.currentState!.validate()) {
  //     setState(() {
  //       isLg = true;
  //     });
  //
  //     bool isConnected = await checkInternetConnectivity();
  //
  //     if (isConnected) {
  //       await Signup(
  //         nameController.text,
  //         emailController.text,
  //         phoneController.text,
  //         // '', // password
  //         // '', // confirm password
  //       );
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: "No internet connection",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         textColor: Colors.white,
  //         fontSize: 16.0,
  //       );
  //     }
  //   } else {
  //     print('Form validation failed');
  //   }
  // }
  //
  // Future<void> Signup(name, email, phone) async {
  //   Map<String, String> data = {
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //     // 'password': password,
  //     // 'c_password': cPassword,
  //     // 'device_type': 'android',
  //     // 'device_token': 'your_device_token', // Add your actual device token here
  //   };
  //
  //   print('Signup data: $data');
  //
  //   var url = BaseUrl.login; // Replace with your actual URL
  //   final response = await http.post(
  //     Uri.parse(url),
  //     headers: {
  //       "Accept": "application/json",
  //       "Content-Type": "application/x-www-form-urlencoded"
  //     },
  //     body: {
  //       'name': name,
  //       'email': email,
  //       'photo': phone,
  //     },
  //     encoding: Encoding.getByName("utf-8"),
  //   );
  //
  //   print('Response status code: ${response.statusCode}');
  //   print('Response body: ${response.body}');
  //
  //   if (response.statusCode == 200) {
  //     var responseData = jsonDecode(response.body);
  //     print('Parsed response data: $responseData');
  //
  //     if (responseData['status']) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => AddProfile()),
  //       );
  //     } else {
  //       setState(() {
  //         isLg = false;
  //       });
  //       Fluttertoast.showToast(
  //         msg: responseData['message'],
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         textColor: Colors.white,
  //         fontSize: 16.0,
  //       );
  //       print('Failed: ${responseData['message']}');
  //     }
  //   } else {
  //     setState(() {
  //       isLg = false;
  //     });
  //     print('Failed to login. Status code: ${response.statusCode}');
  //   }
  // }

}



