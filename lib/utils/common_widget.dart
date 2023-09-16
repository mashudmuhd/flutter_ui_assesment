
import 'package:flutter/material.dart';

Widget getCustomText(
{text,fontSize,fontColor,fontWeight}){
  return Text(text??'',style: TextStyle(
    fontSize: fontSize,
    color: fontColor,
    fontWeight: fontWeight
  ),);

}

Widget regularBodyText({text, fontSize,fontColor,fontWeight}){
  return Text(text,style: TextStyle(fontSize: fontSize??16.0,color: fontColor,fontWeight: fontWeight),);
}

Widget getHeight(height){
  return SizedBox(height: height??10.0);
}



Widget buildAppointmentCard({onTap}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0,1), // Changes the position of the shadow
            ),
          ],
        ),
        width:double.maxFinite,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: regularBodyText(text: "Appointment Date",fontColor: Colors.grey),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.timer),
                      regularBodyText(text: "Wed Jun 20"),
                      const Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10),
                        child: CircleAvatar(radius: 5,),
                      ),
                      regularBodyText(text: "8:00 - 8:00PM"),
                      const Spacer(),
                      const Icon(Icons.more_vert_outlined)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(),
                  ),
                  getDoctorListTile(),
                ],
              ),
            ),
            const Positioned(
                left:-7,
                top:30,
                child: SizedBox(height:100, child: VerticalDivider(thickness: 2,color: Colors.green,))),
          ],
        ),
      ),
    ),
  );
}

Widget getDoctorListTile() {
  return Row(
                  children: [
                    const Stack(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              "https://www.freepnglogos.com/uploads/doctor-png/doctor-bulk-billing-doctors-chapel-hill-health-care-medical-3.png"),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.green,
                              child: Icon(Icons.video_call, size: 10, color: Colors.white,)),
                        )
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        regularBodyText(text: "Dr. Sakshi sinha"),
                        getHeight(3.0),
                        regularBodyText(text: "Dermologist", fontColor: Colors.grey),
                      ],
                    )
                  ],
                );
}