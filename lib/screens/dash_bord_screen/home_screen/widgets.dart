import 'package:flutter/material.dart';
import 'package:flutter_ui_assesment/const/constants.dart';

import '../../../utils/common_widget.dart';

CircleAvatar getIconAvatarWidget({icon, backGroundColor}) {
  return CircleAvatar(
    radius: 20,
    backgroundColor: backGroundColor,
    child: icon,
  );
}


Widget getCircleContainerWithBorder({radius, icon, labelText}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(boxShadow:  [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
              offset: Offset(0, 0)),
        ], borderRadius: BorderRadius.circular(30)),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: radius ?? 20.0,
          child: Icon(
            icon,color: Colors.blue,
          ),
        ),
      ),
      getHeight(10.0),
      regularBodyText(text: labelText,fontSize: 15.0)
    ],
  );
}



