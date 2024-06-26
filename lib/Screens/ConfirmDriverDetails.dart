
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Screens/DriverAddSuccess.dart';
import 'package:yakcompany/Widgets/button_widget.dart';

class ConfirmDriverDetails extends StatefulWidget {
  const ConfirmDriverDetails({super.key});

  @override
  State<ConfirmDriverDetails> createState() => _ConfirmDriverDetailsState();
}

class _ConfirmDriverDetailsState extends State<ConfirmDriverDetails> {

  Widget _buildSvgImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  TextStyle basicText = TextStyle(
      fontSize: 17.0, fontWeight: FontWeight.w600, color: AppColors.blackColor);

  TextStyle smallText = TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.blackColor);

  var selectGender = "Select driver’s gender";

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
              'Confirm Driver Details',
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
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(55), // Adjust the radius as needed
                              child: Image.network(
                                'https://picsum.photos/seed/picsum/200/300',
                                fit: BoxFit.cover,
                                width: 110,
                                height: 110,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Driver’s name',
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
                            height: 50,
                            child: TextField(
                              style: smallText,
                              decoration:  InputDecoration(
                                hintText: 'Enter license number',
                                hintStyle: TextStyle(fontSize: 14,color: AppColors.grayColor99),
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
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Gender',
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
                            height: 49,
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
                                contentPadding: const EdgeInsets.all(7),
                              ),
                              dropdownColor: Colors.white,
                              value: selectGender,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectGender = newValue!;
                                });
                              },
                              items: <String>[selectGender].map<DropdownMenuItem<String>>((String value) {
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
                              text: 'Date of birth',
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
                            height: 50,
                            child: TextField(
                              readOnly: true,
                              style: smallText,
                              decoration:  InputDecoration(
                                  hintText: '12 Mar 2024',
                                  hintStyle: TextStyle(fontSize: 14,color: AppColors.grayColor99),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(.2),
                                  contentPadding: const EdgeInsets.all(7),
                                  suffixIcon: InkWell(
                                      onTap: () {

                                      },
                                      child: Icon(Icons.calendar_month_sharp))
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Driver’s email',
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
                              decoration:  InputDecoration(
                                hintText: 'Enter email address',
                                hintStyle: TextStyle(fontSize: 14,color: AppColors.grayColor99),
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
                            ),
                          ),
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
                            width: 150,
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
                            height: 15,
                          ),

                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Driving license',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 165,
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
                                height: 35,
                              ),
                              Container(
                                width: 165,
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
                            height: 35,
                          ),
                          ButtonWidget(
                              text: 'Submit',
                              onPressed: () {
                                Get.to(()=>const DriverAddSuccess());
                              }),
                          const SizedBox(
                            height: 15,
                          ),

                        ])))));
  }
}
