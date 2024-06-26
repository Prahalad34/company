
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Screens/MyDrivers.dart';
import 'package:yakcompany/Screens/MyFleet.dart';
import 'package:yakcompany/Screens/MyTrips.dart';
import 'package:yakcompany/Screens/Setting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget _buildSvgImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  TextStyle basicText = TextStyle(
      fontSize: 17.0, fontWeight: FontWeight.w600, color: AppColors.blackColor);

  TextStyle smallText = TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w600, color: AppColors.blackColor);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(children: [
          InkWell(
            onTap: () {
              Get.to(()=> const Setting());
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25), // Adjust the radius as needed
              child: Image.network(
                'https://picsum.photos/seed/picsum/200/300',
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
          ),
          const SizedBox(width: 5,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back',
                  style: TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.w600, color: AppColors.grayColor99),
                ),
                const SizedBox(height: 3,),
                Text(
                  'Codemeg Travellers !',
                  style: smallText,
                ),
              ],
            ),
          ),
          const Icon(Icons.notifications_outlined)
        ]) ,automaticallyImplyLeading: false,
      elevation: 1,),
      body: SafeArea(
          child: Padding(padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(children: [
              buildWithFill()
            ]),
          ),)
      ),
    );
  }
  Widget buildView()=> Column(
    children: [
      Card(
        color: AppColors.whiteColor,
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(
            'Congratulations!',
            style: TextStyle(
                fontSize: 15.0, fontWeight: FontWeight.w600, color: AppColors.blackColor),
          ),
          Text(
            'Your profile has been approved successfully Add  your fleet and get more business.',
            style: TextStyle(
                fontSize: 13.0, fontWeight: FontWeight.w500, color: AppColors.grayColor99),
          ),
          const SizedBox(height: 10,),
          Container(height: 1,width: MediaQuery.of(context).size.width-10,color: AppColors.inputColor,),
          const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              Get.to(()=>const MyFleet());
            },
            child: Row(children: [
              Expanded(
                child: Text(
                  'Start adding new fleet',
                  style: TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.blackColor),
                ),
              ),
              const Icon(Icons.chevron_right_sharp),

            ],),
          ),
          const SizedBox(height: 5,),
        ]),
      ),),
      const SizedBox(height: 5,),
      Card(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My  Drivers',
                        style: TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.w600, color: AppColors.grayColor99),
                      ),
                      Text(
                        '0 Drivers',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w600, color: AppColors.blackColor),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(()=> const MyDrivers());
                  },
                  child: Card(
                    color: AppColors.textBgColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Add new Driver',
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w500, color: AppColors.redColor),
                    ),
                  ),),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Container(height: 1,width: MediaQuery.of(context).size.width-10,color: AppColors.inputColor,),
            const SizedBox(height: 10,),
            Row(children: [
              Expanded(
                child: Text(
                  'Add new driver',
                  style: TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.blackColor),
                ),
              ),
              const Icon(Icons.chevron_right_sharp),

            ],),
            const SizedBox(height: 5,),
          ],
        ),
      ),)
    ],
  );

  Widget buildWithFill()=> Column(children: [
    Card(child: Column(children: [
      const SizedBox(height: 15,),
      Text(
        'Today',
        style: TextStyle(
            fontSize: 13.0, fontWeight: FontWeight.w600, color: AppColors.fontGrayColors),
      ),
      const SizedBox(height: 15,),
      Text(
        '\$650.50',
        style: TextStyle(
            fontSize: 17.0, fontWeight: FontWeight.w700, color: AppColors.blackColor),
      ),
      const SizedBox(height: 10,),
      Container(height: 1,width: MediaQuery.of(context).size.width-10,color: AppColors.inputColor,),
      const SizedBox(height: 10,),
      Row(
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 15,),
          Row(
            children: [
            _buildSvgImage('c_trip.svg', 16),
            const SizedBox(width: 10,),
            Text(
              '20 Trips',
              style: TextStyle(
                  fontSize: 13.0, fontWeight: FontWeight.w600, color: AppColors.blackColor),
            ),
          ],),
          Expanded(child: Container()),
          Row(children: [
            _buildSvgImage('ride.svg', 16),
            const SizedBox(width: 10,),
            Text(
              '3 Drivers',
              style: TextStyle(
                  fontSize: 13.0, fontWeight: FontWeight.w600, color: AppColors.blackColor),
            ),

          ],),
          const SizedBox(width: 15,),
        ],
      ),
      const SizedBox(height: 15,),
    ]),),
    const SizedBox(height: 15,),

    Card(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12,),
                    Text(
                      'Overall Revenue',
                      style: TextStyle(
                          fontSize: 13.0, fontWeight: FontWeight.w600, color: AppColors.grayColor99),
                    ),
                    Text(
                      '\$25,463.25',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w700, color: AppColors.blackColor),
                    ),
                  ],
                ),
              ),
              Card(
                color: AppColors.textBgColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '210 Transactions',
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.w600, color: AppColors.redColor),
                  ),
                ),)
            ],
          ),
          const SizedBox(height: 10,),
          Container(height: 1,width: MediaQuery.of(context).size.width-10,color: AppColors.inputColor,),
          const SizedBox(height: 10,),
          Row(children: [
            Expanded(
              child: Text(
                'Payment History',
                style: TextStyle(
                    fontSize: 13.0, fontWeight: FontWeight.w600, color: AppColors.blackColor),
              ),
            ),
            const Icon(Icons.chevron_right_sharp),

          ],),
          const SizedBox(height: 5,),
        ],
      ),
    ),),

   const SizedBox(height: 15,),

    Card(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Fleet',
                      style: TextStyle(
                          fontSize: 13.0, fontWeight: FontWeight.w600, color: AppColors.grayColor99),
                    ),
                    Text(
                      '6 Taxis & 2 Trucks',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColors.blackColor),
                    ),
                  ],
                ),
              ),
              Card(
                color: AppColors.textBgColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '8 Vehicle',
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.w600, color: AppColors.redColor),
                  ),
                ),)
            ],
          ),
          const SizedBox(height: 10,),
          Container(height: 1,width: MediaQuery.of(context).size.width-10,color: AppColors.inputColor,),
          const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              Get.to(()=>const MyFleet());
            },
            child: Row(children: [
              Expanded(
                child: Text(
                  'View complete Fleet',
                  style: TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.w500, color: AppColors.blackColor),
                ),
              ),
              const Icon(Icons.chevron_right_sharp),

            ],),
          ),
          const SizedBox(height: 5,),
        ],
      ),
    ),),
    const SizedBox(height: 15,),

    Card(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Drivers',
                      style: TextStyle(
                          fontSize: 13.0, fontWeight: FontWeight.w600, color: AppColors.grayColor99),
                    ),
                    Text(
                      '6 Drivers',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColors.blackColor),
                    ),
                  ],
                ),
              ),
              Card(
                color: AppColors.textBgColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '2 Unassigned',
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.w600, color: AppColors.redColor),
                  ),
                ),)
            ],
          ),
          const SizedBox(height: 10,),
          Container(height: 1,width: MediaQuery.of(context).size.width-10,color: AppColors.inputColor,),
          const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              Get.to(()=> const MyDrivers());
            },
            child: Row(children: [
              Expanded(
                child: Text(
                  'View all Drivers',
                  style: TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.w500, color: AppColors.blackColor),
                ),
              ),
              const Icon(Icons.chevron_right_sharp),

            ],),
          ),
          const SizedBox(height: 5,),
        ],
      ),
    ),),

  const SizedBox(height: 15,),

    Card(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overall Trips',
                      style: TextStyle(
                          fontSize: 13.0, fontWeight: FontWeight.w600, color: AppColors.grayColor99),
                    ),
                    Text(
                      '300 Trips',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColors.blackColor),
                    ),
                  ],
                ),
              ),
              Card(
                color: AppColors.textBgColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '5 Drivers',
                    style: TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.w600, color: AppColors.redColor),
                  ),
                ),)
            ],
          ),
          const SizedBox(height: 10,),
          Container(height: 1,width: MediaQuery.of(context).size.width-10,color: AppColors.inputColor,),
          const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              Get.to(()=> const MyTrips());
            },
            child: Row(children: [
              Expanded(
                child: Text(
                  'View all Trips',
                  style: TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.w500, color: AppColors.blackColor),
                ),
              ),
              const Icon(Icons.chevron_right_sharp),

            ],),
          ),
          const SizedBox(height: 5,),
        ],
      ),
    ),),


  ],);
}
