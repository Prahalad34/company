
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:yakcompany/Constants/ColorCodes.dart';
import 'package:yakcompany/Widgets/button_widget.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController phoneController = TextEditingController();

  String dropdownValue = 'Male';

  Widget _buildSvgImage(String assetName, double width) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  TextStyle basicText = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor);

  TextStyle smallText = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor);

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
            'Profile',
            style: basicText,
          )
        ]),
        automaticallyImplyLeading: false,
      ),
      body: Padding(padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
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
                  height: 5,
                ),
                buildFormView(),

                const SizedBox(
                  height: 35,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                  child: ButtonWidget(
                      text: 'Update',
                      onPressed: () {
                       Get.back();
                      }),
                ),
                const SizedBox(height: 25),

              ]),
        ),),
    );

  }

  Widget buildFormView()=> Form(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 20),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Name',
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
          height: 60,
          child: TextField(
            style: smallText,
            decoration:  InputDecoration(
              hintText: 'Harry',
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
          height: 10,
        ),

        Text(
            'Email',
            textAlign: TextAlign.start,
            style: smallText),
        const SizedBox(
          height: 7,
        ),
        SizedBox(
          height: 60,
          child: TextField(
            style: smallText,
            decoration:  InputDecoration(
              hintText: 'example@example.com',
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
          height: 10,
        ),

        Text(
            'Gender',
            textAlign: TextAlign.start,
            style: smallText),
        const SizedBox(
          height: 7,
        ),
        DropdownButtonFormField(
          decoration:  InputDecoration(
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
          dropdownColor: Colors.white,
          value: dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Male', 'Female'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: smallText,
              ),
            );
          }).toList(),
        )

      ]),);
}
