
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Screens/HomeScreen.dart';

class UnderReview extends StatefulWidget {
  const UnderReview({super.key});

  @override
  State<UnderReview> createState() => _UnderReviewState();
}

class _UnderReviewState extends State<UnderReview> {

  Widget _buildImage(String assetName, [double width = 300]) {
    return Image.asset('assets/$assetName', width: width);
  }

  Widget _buildSvgImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  TextStyle basicText = TextStyle(
      fontSize: 17.0, fontWeight: FontWeight.w600, color: AppColors.blackColor);

  TextStyle smallText = TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.blackColor);
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {

      setState(() {
        Get.to(()=>HomeScreen());
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(padding: const EdgeInsets.all(15),
      child: Column(children: [
        const SizedBox(
          height: 90,
        ),
        _buildSvgImage('underreview.svg', 150),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Profile Under Review!',
          style: basicText,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Your request has been successfully submitted for approval.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor),
        ),const SizedBox(
          height: 20,
        ),
        Text(
          'After approval, you can start using the app and boost your business sales with our uninterrupted and customer-oriented services.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              color: AppColors.fontGrayColors),
        ),

      ]),),
    );
  }
}
