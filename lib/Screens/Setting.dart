
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Screens/HelpSupport.dart';
import 'package:yakcompany/Screens/Profile.dart';
import 'package:yakcompany/Screens/TermsAndPrivacyPolicy.dart';
import 'package:yakcompany/Screens/UpdateCompanyDetails.dart';


class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  Widget _buildSvgImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  TextStyle titleText = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor);

TextStyle subTitleText = TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      color: AppColors.fontGrayColors);

  bool _isShown = true;

  void _delete(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const  CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 22,
              // backgroundColor: Colors.red.shade50,
              child: Icon(Icons.logout,color: Colors.red,),
            ),
            content: const Text('Are you sure you wantto Logout?',style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold),),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Remove the box
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red)
                      ),
                      child: Center(child: const Text('No',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14))))),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                  },
                  child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red
                      ),
                      child: Center(child: const Text('Yes',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),))))
            ],
          );
        });
  }


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
            'Setting',
            style: titleText,
          )
        ]),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child:  Padding(padding:const EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            InkWell(
              onTap: () {
                Get.to(const Profile());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                    _buildSvgImage('profile.svg',16),
                    const SizedBox(width: 15,),
                      Text('Profile',
                        style:titleText,
                      ),

                  ],),
                  Padding(
                    padding: const EdgeInsets.only(left: 31),
                    child: Text('Update your name and profile picture (DP)',
                      style:subTitleText,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25,),
            InkWell(
              onTap: () {
               Get.to(const UpdateCompanyDetails());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(

                    children: [
                    _buildSvgImage('company.svg',16),
                    const SizedBox(width: 15,),
                    Text('Company Details',
                      style:titleText,
                    ),

                  ],),
                  Padding(
                    padding: const EdgeInsets.only(left: 31),
                    child: Text('Update your company name and documents',
                      style:subTitleText,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25,),
            InkWell(
              onTap: () {
                Get.to(const HelpSupport());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                    _buildSvgImage('help.svg',16),
                    const SizedBox(width: 15,),
                      Text('Help &  Support',
                        style:titleText,
                      ),
                  ],),
                  Padding(
                    padding: const EdgeInsets.only(left: 31),
                    child: Text('Get instant help and ask for quick support',
                      style:subTitleText,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25,),
            InkWell(
              onTap: () {
                Get.to(const TermsAndPrivacyPolicy());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                    _buildSvgImage('terms.svg',16),
                    const SizedBox(width: 15,),
                    Text('Terms and Privacy Policy',
                      style:titleText,
                    ),

                  ],),
                  Padding(
                    padding: const EdgeInsets.only(left: 31),
                    child: Text('Understand your rights and privacy standards',
                      style:subTitleText,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25,),
            Row(
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              _buildSvgImage('logout.svg',16),
             // const SizedBox(width: 15,),
                TextButton(
                  // This button is enabled only if _isShown = true
                    onPressed: _isShown == true ? () => _delete(context) : null,
                    child: const Text('Logout',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),

              ],),
            const SizedBox(height: 12,),

          ],
        ),),
      ),
    );
  }
}
