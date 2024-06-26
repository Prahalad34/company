import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Screens/AddVehicleDetails.dart';
import 'package:yakcompany/Screens/AssignDriverList.dart';
import 'package:yakcompany/Screens/VehicleDetails.dart';

class MyFleet extends StatefulWidget {
  const MyFleet({super.key});

  @override
  State<MyFleet> createState() => _MyFleetState();
}

class _MyFleetState extends State<MyFleet> {
  TextStyle basicText = TextStyle(
      fontSize: 17.0, fontWeight: FontWeight.w600, color: AppColors.blackColor);

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
              child: const Icon(Icons.arrow_back)),
          const SizedBox(
            width: 5,
          ),
          Text(
            'My Fleet',
            style: basicText,
          )
        ]),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Stack(
              children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Get.to(()=> const VehicleDetails());
                        },
                        child: Card(
                            child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  // Adjust the radius as needed
                                  child: Image.network(
                                    'https://picsum.photos/seed/picsum/200/300',
                                    fit: BoxFit.cover,
                                    width: 90,
                                    height: 90,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Wrap(
                                  direction: Axis.vertical,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Ride',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grayColor99),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Icon(
                                          Icons.fiber_manual_record_sharp,
                                          size: 5,
                                          color: AppColors.grayColor99,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          'Volkswagen',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grayColor99),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Icon(
                                          Icons.fiber_manual_record_sharp,
                                          size: 5,
                                          color: AppColors.grayColor99,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          'Sedan',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grayColor99),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.check_circle,
                                          color: AppColors.greenColor,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          'GR 678-UVWX',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blackColor),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Michael Mark',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.blackColor),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width - 10,
                              color: AppColors.inputColor,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap:(){
                                Get.to(()=> const AssignDriverList());
                        },
                              child: Row(children: [
                                Expanded(
                                  child: Text(
                                    'Change Driver',
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blackColor),
                                  ),
                                ),
                                const Icon(Icons.chevron_right_sharp),
                              ]),
                            ),
                          ]),
                        )),
                      );
                    }),
                
                Positioned(
                  bottom: 10,
                  right: 5,
                  left: 5,
                  child: Center(
                    child: SizedBox(
                      width: 120,
                      child: InkWell(
                        onTap: () {
                          Get.to(()=> const AddVehicleDetails());
                        },
                        child: Card(
                          color: AppColors.redColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19)),
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Row(children: [Icon(Icons.add_circle,size: 22,color: AppColors.whiteColor,),
                             const SizedBox(width: 5,),
                              Text(
                                'Add new',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteColor),
                              ),],),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
