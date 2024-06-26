
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Screens/ConfirmDriverDetails.dart';
import 'package:yakcompany/Widgets/button_widget.dart';

class AddDocuments extends StatefulWidget {
  const AddDocuments({super.key});

  @override
  State<AddDocuments> createState() => _AddDocumentsState();
}

class _AddDocumentsState extends State<AddDocuments> {

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
          title: Row(children: [
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: _buildSvgImage('back.svg', 20)),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Add Documents',
              style: basicText,
            )
          ]),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Add a photo holding your driving license',
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
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: AppColors.inputColor, width: 1),
                                color: Colors.grey.withOpacity(.2),
                                shape: BoxShape.rectangle,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(7))),
                            child: Column(children: [
                              const SizedBox(
                                height: 7,
                              ),
                              _buildSvgImage('upload.svg', 25),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Choose image from your gallery and upload.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.fontGrayColors),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Front view of driving license',
                              style: smallText,
                              children: <TextSpan>[
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.fontColors)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: AppColors.inputColor, width: 1),
                                color: Colors.grey.withOpacity(.2),
                                shape: BoxShape.rectangle,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(7))),
                            child: Column(children: [
                              const SizedBox(
                                height: 7,
                              ),
                              _buildSvgImage('upload.svg', 25),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Choose image from your gallery and upload.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.fontGrayColors),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ]),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Back view of driving license',
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
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: AppColors.inputColor, width: 1),
                                color: Colors.grey.withOpacity(.2),
                                shape: BoxShape.rectangle,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(7))),
                            child: Column(children: [
                              const SizedBox(
                                height: 7,
                              ),
                              _buildSvgImage('upload.svg', 25),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Choose image from your gallery and upload.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.fontGrayColors),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ]),
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          Text(
                            'Note: Please ensure the upload of authentic and clear images of your documents.',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.fontColors),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ButtonWidget(
                              text: 'Next',
                              onPressed: () {
                                Get.to(()=>const ConfirmDriverDetails());
                              }),
                          const SizedBox(
                            height: 15,
                          ),

                        ])))));
  }
}
