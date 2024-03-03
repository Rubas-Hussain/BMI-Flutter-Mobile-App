import 'package:flutter/material.dart';

import '../textstyles.dart';

class AgeButton extends StatelessWidget {
  const AgeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          )),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 60,vertical: 17)),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey; // Color for the text when button is disabled
              }
              return Colors.white; // Default color for the text
            },
          ),
        ),
        child: Text('15-80',style: AppTextStyles.lWhiteStyle17,));
  }
}
