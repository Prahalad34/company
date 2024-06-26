
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';

class TermsAndPrivacyPolicy extends StatefulWidget {
  const TermsAndPrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<TermsAndPrivacyPolicy> createState() => _TermsAndPrivacyPolicyState();
}

class _TermsAndPrivacyPolicyState extends State<TermsAndPrivacyPolicy> {

  Widget _buildSvgImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  TextStyle titleText = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Row(children: [
          InkWell(
              onTap: () {
                Get.back();
              },
              child: _buildSvgImage('back.svg', 20)),
          const SizedBox(
            width: 9,
          ),
          Text(
            'Terms and Privacy Policy',
            style: titleText,
          )
        ]),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
