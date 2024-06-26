
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Widgets/button_widget.dart';

class UpdateCompanyDetails extends StatefulWidget {
  const UpdateCompanyDetails({super.key});

  @override
  State<UpdateCompanyDetails> createState() => _UpdateCompanyDetailsState();
}

class _UpdateCompanyDetailsState extends State<UpdateCompanyDetails> {
  Widget _buildSvgImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  TextStyle basicText = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w600, color: AppColors.blackColor);

  TextStyle smallText = TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.blackColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: _buildSvgImage('back.svg', 20)),
              const SizedBox(width: 7,),
              Text('Company Details', style:basicText,),
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(
                        height: 10,
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
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(top: 22,bottom: 22,left: 25,right: 25),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: AppColors.inputColor, width: 1),
                            color: Colors.grey.withOpacity(.2),
                            shape: BoxShape.rectangle,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(7))),
                        child: Column(children: [
                          _buildSvgImage('upload.svg', 25),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Choose images from your gallery and upload them.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.fontGrayColors),
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 160,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    15) // Adjust the radius as needed
                            ),
                            child: Image.asset(
                              'assets/img_bg.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 160,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    15) // Adjust the radius as needed
                            ),
                            child: Image.asset(
                              'assets/img_bg.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 160,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    15) // Adjust the radius as needed
                            ),
                            child: Image.asset(
                              'assets/img_bg.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 160,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    15) // Adjust the radius as needed
                            ),
                            child: Image.asset(
                              'assets/img_bg.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      ButtonWidget(
                          text: 'Update',
                          onPressed: () {
                           // Get.to(()=>const UnderReview());
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                    ]))));
  }
}
