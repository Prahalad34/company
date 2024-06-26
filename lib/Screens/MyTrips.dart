import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';

class MyTrips extends StatefulWidget {
  const MyTrips({Key? key}) : super(key: key);

  @override
  State<MyTrips> createState() => _MyTripsState();
}

class _MyTripsState extends State<MyTrips> {
  Widget _buildSvgImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  TextStyle titleText = TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w600, color: AppColors.blackColor);

  TextStyle subTitleText = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: AppColors.fontGrayColors);

  final List<String> filters = [
    'All Trips',
    'Today’s Trips',
    'Last 7 days Trips',
    'Last 30 days Trips'
  ];

  int isSelected = 0;
  var name = "All Trips";
  var filterName = "All Trips";
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                'My Trips',
                style: titleText,
              )
            ]),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        _buildSvgImage('ride.svg', 25),
                        const SizedBox(
                          width: 5,
                        ),
                        Wrap(
                          direction: Axis.vertical,
                          children: [
                            Text('Overall Trips',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackColor)),
                            Text('2000',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor)),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: 1,
                      color: AppColors.grayColor99.withOpacity(.2),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        _buildSvgImage('money.svg', 22),
                        const SizedBox(
                          width: 5,
                        ),
                        Wrap(
                          direction: Axis.vertical,
                          children: [
                            Text('Overall Revenue',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackColor)),
                            Text('\$18,900.00',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 15),
                          color: Colors.white,
                          child: Card(
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.greenLightColor,
                                        ),
                                        color: AppColors.greenLightColor,
                                        shape: BoxShape.rectangle,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(5.0),
                                            bottomRight: Radius.circular(5.0)),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.fromLTRB(20, 2, 7, 2),
                                        child: Text('Completed',
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.greenColor)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('RIDE154656287',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.fontGrayColors)),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      _buildSvgImage('pick.svg', 17),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Flexible(
                                        child: Wrap(
                                          direction: Axis.vertical,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(right: 5),
                                              child: Text(
                                                  '71, PU4, Behind C21 Mall, Scheme 41, Vijay',
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 13.0,
                                                      fontWeight: FontWeight.w500,
                                                      color: AppColors.blackColor)),
                                            ),
                                            const SizedBox(
                                              height: 9,
                                            ),
                                            Container(
                                              color: AppColors.grayColor99
                                                  .withOpacity(.5),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  20,
                                              height: 1,
                                            ),
                                            const SizedBox(
                                              height: 9,
                                            ),
                                            Text(
                                                'Staff  Campus, B-Block, Sector, Bhawarkua',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.blackColor)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 9,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 30.0,
                                        // NetworkImage('https://via.placeholder.com/150'),
                                        backgroundColor: Colors.transparent,
                                        child: _buildSvgImage('avatar.svg', 50),
                                      ),
                                      Expanded(
                                        child: Wrap(
                                          direction: Axis.vertical,
                                          children: [
                                            Text('Darcy Tierney',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.blackColor)),
                                            Text('16 Dec, 2013 | 05:20 PM',
                                                style: TextStyle(
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.blackColor)),
                                          ],
                                        ),
                                      ),
                                      Text('\$180',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blackColor)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Container(
                                  color: AppColors.grayColor99.withOpacity(.5),
                                  width: MediaQuery.of(context).size.width - 10,
                                  height: 1,
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: [
                                          _buildSvgImage('ride.svg', 21),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text('Ride',
                                              style: TextStyle(
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.blackColor)),
                                        ],
                                      ),
                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: [
                                          _buildSvgImage('km.svg', 20),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text('3.8kms',
                                              style: TextStyle(
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.blackColor)),
                                        ],
                                      ),
                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: [
                                          _buildSvgImage('date.svg', 15),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text('16 Dec, 2013',
                                              style: TextStyle(
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.blackColor)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: Visibility(
              visible: isVisible,
              child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22)),
                  ),
                  color: AppColors.whiteColor,
                  elevation: 3,
                  child: Container(
                    // color: Colors.white,
                    padding: const EdgeInsets.all(7),
                    height: 320,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.whiteColor,
                      ),
                      color: AppColors.whiteColor,
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 37,
                          width: MediaQuery.of(context).size.width - 10,
                          child: Row(
                            children: [
                              Text(
                                'Select your date range',
                                style: titleText,
                              ),
                              Expanded(child: Container()),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      isVisible = false;
                                    });
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: AppColors.fontColors,
                                  ))
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: filters.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 0),
                                  child: Material(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isSelected = index;
                                          filterName = filters[index];
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 0),
                                        child: Column(
                                          children: [
                                            Row(children: [
                                              Text(filters[index],
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: AppColors
                                                          .fontColors)),
                                              Expanded(child: Container()),
                                              isSelected == index
                                                  ? Icon(
                                                Icons.check_circle,
                                                color: AppColors.redColor,
                                              )
                                                  : Icon(
                                                Icons.circle_outlined,
                                                color: AppColors.redColor,
                                              )
                                            ]),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: 1,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                                  10,
                                              color: AppColors.grayColor99
                                                  .withOpacity(.2),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 45,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      name = "All Trips";
                                      isVisible = false;
                                    });
                                  },
                                  child: Container(
                                    // width: 110,
                                    height: 45,
                                    padding: const EdgeInsets.fromLTRB(
                                        52, 13, 52, 13),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.redColor,
                                            width: 1),
                                        color: AppColors.whiteColor,
                                        shape: BoxShape.rectangle,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(22.0))),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Clear',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.blackColor),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      name = filterName;
                                      isVisible = false;
                                    });
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 45,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.redColor,
                                            width: 1),
                                        color: AppColors.redColor,
                                        shape: BoxShape.rectangle,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(22.0))),
                                    child: Text(
                                      'Apply',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.whiteColor),
                                    ),
                                  ),
                                ),
                              ]),
                        )
                      ],
                    ),
                  )),
            ))
      ],
    );
  }
}
