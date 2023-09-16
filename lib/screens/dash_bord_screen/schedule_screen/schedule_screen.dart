import 'package:flutter/material.dart';
import 'package:flutter_ui_assesment/const/constants.dart';
import 'package:flutter_ui_assesment/screens/dash_bord_screen/home_screen/widgets.dart';
import 'package:get/get.dart';

import '../../../utils/common_widget.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        body: Column(
          children: [
            getHeight(20.0),
            getTitleWithIconAppbar(),
            getHeight(20.0),
            getCustomTabbar(),
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1 content
                  getUpcomingTab(),
                  // Tab 2 content
                  getPastTab()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getPastTab() {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 25,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(),
        itemBuilder: (BuildContext context, int index) {
          return buildAppointmentCard(
            onTap: ()=>getBottomSheet(context)
          );
        },
      ),
    );
  }

  Widget getUpcomingTab() {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 25,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(),
        itemBuilder: (BuildContext context, int index) {
          return buildAppointmentCard(
              onTap: () => getBottomSheet(context));
        },
      ),
    );
  }

  Future<dynamic> getBottomSheet(BuildContext context) {
    return showModalBottomSheet(
                  context: context,
                  builder: (BuildContext builderContext) {
                    return SizedBox(
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Center(
                              child:  SizedBox(
                                  width: 80,
                                  child: Divider(
                                    thickness: 3,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  regularBodyText(
                                      text: "Summary",
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                  regularBodyText(
                                      text: "Cancel",
                                      fontColor: Colors.blueAccent),
                                ],
                              ),
                            ),
                            getDoctorListTile(),
                            getHeight(20.0),
                            regularBodyText(
                                text: "Doctors,advice",
                                fontWeight: FontWeight.bold),
                            getHeight(10.0),
                            getDoctorsAdviceWidget(
                                adviceText:
                                    "Drink four Litters of water everyday"),
                            getDoctorsAdviceWidget(adviceText: "No smoking"),
                            getDoctorsAdviceWidget(
                                adviceText: "Sleep 8 hours"),
                            getHeight(20.0),
                            regularBodyText(
                              text: "Discharge",
                              fontWeight: FontWeight.bold,
                            ),
                            getHeight(10.0),
                            Row(
                              children: [
                                getPdfContainer(fileCount: "File 1"),
                                getPdfContainer(fileCount: "File 2"),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
  }

  ///Customized tab bar
  Padding getCustomTabbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBar(
            tabs: const [
              Tab(text: 'Upcoming'),
              Tab(text: 'Past'),
            ],
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  30.0), // Adjust the border radius as needed
              color: Colors
                  .white, // Change the color to your desired background color
            ),
            labelColor: Colors.black,
            indicatorSize:
                TabBarIndicatorSize.tab, // Use tab size for the indicator
            labelPadding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Adjust padding as needed
          ),
        ),
      ),
    );
  }

  Widget getPdfContainer({fileCount}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 80,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                pdfImage,
                height: 50,
              ),
              regularBodyText(text: fileCount ?? '', fontSize: 15.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget getDoctorsAdviceWidget({adviceText}) {
    return Row(
      children: [
        const Icon(
          Icons.check,
          color: Colors.green,
        ),
        regularBodyText(text: adviceText)
      ],
    );
  }

  Widget getTitleWithIconAppbar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getCustomText(
              text: "Schedule", fontSize: 20.0, fontWeight: FontWeight.bold),
          const CircleAvatar(
            child: Icon(Icons.notifications),
          )
        ],
      ),
    );
  }
}
