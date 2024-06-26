
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Screens/ConfirmVehicleDetails.dart';
import 'package:yakcompany/Widgets/button_widget.dart';

class AddVehiclePhotos extends StatefulWidget {
  const AddVehiclePhotos({super.key});

  @override
  State<AddVehiclePhotos> createState() => _AddVehiclePhotosState();
}

class _AddVehiclePhotosState extends State<AddVehiclePhotos> {
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
              width: 7,
            ),
            Text(
              'Add Vehicle Photos',
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
                          Text(
                            'Upload all images of your vehicle.',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Front view of vehicle',
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
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Back view of vehicle',
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
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Driver side view of vehicle',
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
                          ),const SizedBox(
                            height: 15,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Passenger side view of vehicle',
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
                            height: 25,
                          ),
                          Text(
                            'Note: Please ensure the upload of authentic and clear images of your vehicle, featuring both the front and back sides, prominently displaying the number plate.',
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
                               Get.to(()=>const ConfirmVehicleDetails());
                              }),
                          const SizedBox(
                            height: 15,
                          ),

                        ])))));
  }

}
