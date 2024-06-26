import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Screens/AddVehicleDocuments.dart';
import 'package:yakcompany/Widgets/button_widget.dart';

class AddVehicleDetails extends StatefulWidget {
  const AddVehicleDetails({super.key});

  @override
  State<AddVehicleDetails> createState() => _AddVehicleDetailsState();
}

class _AddVehicleDetailsState extends State<AddVehicleDetails> {
  TextStyle basicText = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w600, color: AppColors.blackColor);

  TextStyle smallText = TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.blackColor);

  Widget _buildSvgImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  String serviceType = 'Select service type';
  String vehicleType = 'Select vehicle type';
  String vehicleBrand = 'Select vehicle brand';
  String vehicleModel = 'Enter vehicle model';
  String vehicleColor = 'Select vehicle color';
  String availableSeats = 'Select available seats ';

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
              'Add Vehicle Details',
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
                        'Provide complete details of your vehicle.',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor),
                      ),

                  const SizedBox(
                    height: 15,
                  ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Select service type',
                          style: smallText,
                          children:  <TextSpan>[
                            TextSpan(text: '*', style: TextStyle(
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
                      height: 59,
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),//<-- SEE HERE
                              borderSide: BorderSide(color: Colors.grey.withOpacity(.2), width: 0),
                            ),
                            focusedBorder: OutlineInputBorder( //<-- SEE HERE
                              borderSide: BorderSide(color: Colors.grey.withOpacity(.2), width: 0),
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(.2),
                          ),
                          dropdownColor: Colors.white,
                          value: serviceType,
                          onChanged: (String? newValue) {
                            setState(() {
                              serviceType = newValue!;
                            });
                          },
                          items: <String>[serviceType].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 13),
                              ),
                            );
                          }).toList(),
                      ),
                    ),
                      const SizedBox(
                    height: 15,
                  ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Vehicle type',
                          style: smallText,
                          children:  <TextSpan>[
                            TextSpan(text: '*', style: TextStyle(
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
                      height: 59,
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),//<-- SEE HERE
                              borderSide: BorderSide(color: Colors.grey.withOpacity(.2), width: 0),
                            ),
                            focusedBorder: OutlineInputBorder( //<-- SEE HERE
                              borderSide: BorderSide(color: Colors.grey.withOpacity(.2), width: 0),
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(.2),
                          ),
                          dropdownColor: Colors.white,
                          value: vehicleType,
                          onChanged: (String? newValue) {
                            setState(() {
                              vehicleType = newValue!;
                            });
                          },
                          items: <String>[vehicleType].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 13),
                              ),
                            );
                          }).toList(),
                      ),
                    ),
                      const SizedBox(
                    height: 15,
                  ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Vehicle brand',
                          style: smallText,
                          children:  <TextSpan>[
                            TextSpan(text: '*', style: TextStyle(
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
                      height: 59,
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),//<-- SEE HERE
                              borderSide: BorderSide(color: Colors.grey.withOpacity(.2), width: 0),
                            ),
                            focusedBorder: OutlineInputBorder( //<-- SEE HERE
                              borderSide: BorderSide(color: Colors.grey.withOpacity(.2), width: 0),
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(.2),
                          ),
                          dropdownColor: Colors.white,
                          value: vehicleBrand,
                          onChanged: (String? newValue) {
                            setState(() {
                              vehicleBrand = newValue!;
                            });
                          },
                          items: <String>[vehicleBrand].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 13),
                              ),
                            );
                          }).toList(),
                      ),
                    ),
                      const SizedBox(
                    height: 15,
                  ),RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Vehicle model',
                          style: smallText,
                          children:  <TextSpan>[
                            TextSpan(text: '*', style: TextStyle(
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
                      height: 59,
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),//<-- SEE HERE
                              borderSide: BorderSide(color: Colors.grey.withOpacity(.2), width: 0),
                            ),
                            focusedBorder: OutlineInputBorder( //<-- SEE HERE
                              borderSide: BorderSide(color: Colors.grey.withOpacity(.2), width: 0),
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(.2),
                          ),
                          dropdownColor: Colors.white,
                          value: vehicleModel,
                          onChanged: (String? newValue) {
                            setState(() {
                              vehicleModel = newValue!;
                            });
                          },
                          items: <String>[vehicleModel].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 13),
                              ),
                            );
                          }).toList(),
                      ),
                    ),
                      const SizedBox(
                    height: 15,
                  ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Vehicle color',
                          style: smallText,
                          children:  <TextSpan>[
                            TextSpan(text: '*', style: TextStyle(
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
                      height: 59,
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),//<-- SEE HERE
                              borderSide: BorderSide(color: Colors.grey.withOpacity(.2), width: 0),
                            ),
                            focusedBorder: OutlineInputBorder( //<-- SEE HERE
                              borderSide: BorderSide(color: Colors.grey.withOpacity(.2), width: 0),
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(.2),
                          ),
                          dropdownColor: Colors.white,
                          value: vehicleColor,
                          onChanged: (String? newValue) {
                            setState(() {
                              vehicleColor = newValue!;
                            });
                          },
                          items: <String>[vehicleColor].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 13),
                              ),
                            );
                          }).toList(),
                      ),
                    ),
                      const SizedBox(
                    height: 15,
                  ), RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Available seats for passengers',
                          style: smallText,
                          children:  <TextSpan>[
                            TextSpan(text: '*', style: TextStyle(
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
                      height: 59,
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),//<-- SEE HERE
                              borderSide: BorderSide(color: Colors.grey.withOpacity(.2), width: 0),
                            ),
                            focusedBorder: OutlineInputBorder( //<-- SEE HERE
                              borderSide: BorderSide(color: Colors.grey.withOpacity(.2), width: 0),
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(.2),
                          ),
                          dropdownColor: Colors.white,
                          value: availableSeats,
                          onChanged: (String? newValue) {
                            setState(() {
                              availableSeats = newValue!;
                            });
                          },
                          items: <String>[availableSeats].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 13),
                              ),
                            );
                          }).toList(),
                      ),
                    ),
                      const SizedBox(
                    height: 15,
                  ),
                      ButtonWidget(
                          text: 'Next',
                          onPressed: () {
                            Get.to(()=>const AddVehicleDocuments());
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                    ]),

                ))));
  }
}
