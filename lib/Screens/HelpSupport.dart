import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({Key? key}) : super(key: key);

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  Widget _buildSvgImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  TextStyle titleText = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w600, color: AppColors.blackColor);

  TextStyle subTitleText = TextStyle(
      fontSize: 12.5,
      fontWeight: FontWeight.w600,
      color: AppColors.fontGrayColors);

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
              width: 9,
            ),
            Text(
              'Help & Support',
              style: titleText,
            )
          ]),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                  shrinkWrap: true,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Call or Chat with us',
                      style: titleText,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                _buildSvgImage('whatsapp.svg', 19),
                                const SizedBox(
                                  width: 7,
                                ),
                                Expanded(
                                  child: Text(
                                    'WhatsApp',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.blackColor),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: AppColors.grayColor99,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Text(
                              'Stay Connected with Us on WhatsApp for Any Assistance or Support You May Need from Our Side.',
                              style: subTitleText,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Container(
                      color: AppColors.grayColor99.withOpacity(.4),
                      width: MediaQuery.of(context).size.width - 0,
                      height: 1,
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Text('FAQs',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor)),
                    const SizedBox(
                      height: 0,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 350,
                      child: ListView.builder(
                        itemCount: itemData.length,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.inputCornerColor,
                              ),
                              color: AppColors.inputColor,
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15.0)),
                            ),
                            margin: const EdgeInsets.only(top: 17),
                            child: ExpansionPanelList(
                              animationDuration:
                                  const Duration(milliseconds: 1000),
                              dividerColor: Colors.grey,
                              elevation: 1,
                              children: [
                                ExpansionPanel(
                                  body: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Container(
                                          color: AppColors.grayColor99.withOpacity(.4),
                                          width: MediaQuery.of(context).size.width - 0,
                                          height: 1,
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          itemData[index].discription,
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 15,
                                              letterSpacing: 0.3,
                                              height: 1.3),
                                        ),
                                      ],
                                    ),
                                  ),
                                  headerBuilder:
                                      (BuildContext context, bool isExpanded) {
                                    return Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        itemData[index].headerItem,
                                        style: TextStyle(
                                            color: itemData[index].colorsItem,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    );
                                  },
                                  isExpanded: itemData[index].expanded,
                                )
                              ],
                              expansionCallback: (int item, bool status) {
                                setState(() {
                                  itemData[index].expanded =
                                      !itemData[index].expanded;
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
            )));
  }

  List<ItemModel> itemData = <ItemModel>[
    ItemModel(
      headerItem: 'What I need to cancel a booking?',
      discription:
          "Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
      colorsItem: Colors.black,
    ),
    ItemModel(
      headerItem: 'Is safe to use app?',
      discription:
          "Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
      colorsItem: Colors.black,
    ),
    ItemModel(
      headerItem: 'How do I receive booking details?',
      discription:
          "Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
      colorsItem: Colors.black,
    ),
  ];
}

class ItemModel {
  bool expanded;
  String headerItem;
  String discription;
  Color colorsItem;

  ItemModel({
    this.expanded = false,
    required this.headerItem,
    required this.discription,
    required this.colorsItem,
  });
}
