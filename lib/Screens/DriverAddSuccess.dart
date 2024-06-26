
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Screens/HomeScreen.dart';

class DriverAddSuccess extends StatefulWidget {
  const DriverAddSuccess({super.key});

  @override
  State<DriverAddSuccess> createState() => _DriverAddSuccessState();
}

class _DriverAddSuccessState extends State<DriverAddSuccess> {
  Widget _buildSvgImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  TextStyle basicText = TextStyle(
      fontSize: 19.0, fontWeight: FontWeight.w600, color: AppColors.blackColor);

  TextStyle smallText = TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.blackColor);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(padding: const EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 15),
        child: Column(children: [
          const SizedBox(
            height: 90,
          ),
          _buildSvgImage('complete.svg', 160),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Good Job!',
            style: basicText,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Your request to add a new driver has been successfully submitted.',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor),
          ),const SizedBox(
            height: 20,
          ),
          Text(
            'Our team will thoroughly review the documents, ensuring the accuracy of all details. You will be notified as soon as the verification process is completed.',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: AppColors.fontGrayColors),
          ),const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Get.offAll(()=> const HomeScreen());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back,color: AppColors.redColor,size: 20,),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Back to Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.redColor),
                ),
              ],
            ),
          ),

        ]),),
    );
  }

}
