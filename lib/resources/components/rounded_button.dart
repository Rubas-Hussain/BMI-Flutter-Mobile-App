import 'package:flutter/material.dart';

import '../colors.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  RoundedButton({
    required this.title,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all(Appcolors.greenColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width*0.25,
            vertical: MediaQuery.of(context).size.height*0.02
        )),
        shadowColor: MaterialStateProperty.all(Appcolors.greenColor),
        elevation: MaterialStateProperty.all(MediaQuery.of(context).size.height*0.006),
      ),
      // child: Text(title,style: TextStyle(fontSize: 17,fontFamily: 'SNS-M',color: Appcolors.whiteColor),),
      child: Text(title,style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.05,fontFamily: 'SNS-M',color: Appcolors.whiteColor),),
    );
  }
}
