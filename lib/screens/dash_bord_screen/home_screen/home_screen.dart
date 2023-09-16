import 'package:flutter/material.dart';
import 'package:flutter_ui_assesment/screens/dash_bord_screen/home_screen/widgets.dart';
import 'package:flutter_ui_assesment/utils/app_colors.dart';
import 'package:flutter_ui_assesment/utils/common_widget.dart';

import '../../../const/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        getHeader(),
        getBody(),
      ],
    );
  }

  ///Header information
  Widget getHeader() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Color.fromRGBO(255, 0, 0, 0.5),
            ],
          ),),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                            tempImageDoc
                        )
                    ),
                    getIconAvatarWidget(
                        backGroundColor: Colors.white,
                        icon: const Icon(Icons.notifications_none))
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomText(
                            text: "Welcome!\nRajesh",
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0),
                        regularBodyText(
                            text: "Hows it going today ?",
                            fontColor: Colors.grey),

                        Padding(
                          padding:  const EdgeInsets.only(top: 20),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.orange,
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 10),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.brightness_high_sharp,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  getCustomText(
                                      text: "Urgent Care",
                                      fontColor: Colors.white,
                                      fontSize: 15.0)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 180,
                      height: 200,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  tempImageDoc),
                              fit: BoxFit.contain)),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  ///Body
  Padding getBody() {
    return Padding(
        padding: const EdgeInsets.only(top: 240),
        child: Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: AppColors.backgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                regularBodyText(
                  text: "Our Services",
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
                getHeight(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getCircleContainerWithBorder(
                        radius: 30.0,
                        icon: Icons.medical_services_outlined,
                        labelText: "Consultation"),
                    getCircleContainerWithBorder(
                      radius: 30.0,
                      labelText: "Medicine",
                      icon: Icons.local_hospital_outlined,
                    ),
                    getCircleContainerWithBorder(
                        radius: 30.0,
                        labelText: "Ambulance",
                        icon: Icons.directions_bus),
                  ],
                ),
                getHeight(10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getCustomText(
                        text: "Appointment", fontWeight: FontWeight.bold,fontSize: 18.0),
                    getCustomText(text: "See All", fontColor: AppColors.secondaryColor)
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: 25,
                    separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(),
                    itemBuilder: (BuildContext context, int index) {
                      return buildAppointmentCard();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }







}
