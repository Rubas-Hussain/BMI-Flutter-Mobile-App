import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../resources/colors.dart';
import '../resources/components/rounded_button.dart';
import '../resources/textstyles.dart';
import '../utils/routes/routes_names.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    var currentWidth=MediaQuery.of(context).size.width;
    var currentheight=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Appcolors.screenBackColor,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.04),
          child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              // child: Icon(Icons.arrow_back,color: Appcolors.greenColor,size: 30,)
              child: Icon(Icons.arrow_back,color: Appcolors.greenColor,size: MediaQuery.of(context).size.height*0.04,)
          ),
        ),
        backgroundColor: Appcolors.screenBackColor,
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.04),
              child: InkWell(
              onTap: (){},
              // child: FaIcon(FontAwesomeIcons.barsStaggered,color: Appcolors.greenColor,size: 30,)
              child: FaIcon(FontAwesomeIcons.barsStaggered,color: Appcolors.greenColor,size: MediaQuery.of(context).size.height*0.04,)
          )
          ),
        ],
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.025),
                // child: Text('Calorie\nCalculator',style: AppTextStyles.mBlackStyle50 ),
                child: Text('Calorie\nCalculator',
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.14,fontFamily: 'SNS-M',color: Appcolors.blackColor) ),

              ),
              // Text('Accurately calculate daily calories required for weight loss and maintenance',style: AppTextStyles.lBlackStyle17, ),
              Text('Accurately calculate daily calories required for weight loss and maintenance',
                style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.05,fontFamily: 'SNS-L',color: Appcolors.blackColor), ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              // Center(child: Image.asset('assets/images/doctor.png',height: 300,width: 200,)),
              Center(child: Image.asset('assets/images/doctor.png',height: MediaQuery.of(context).size.height*0.4,
                width: MediaQuery.of(context).size.height*0.3,)),
              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              Padding(
                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.0005),
                child: Center(
                  child: RoundedButton(
                      title: 'Calculate Calorie',
                      onPress: (){
                        Navigator.pushNamed(context, RoutesNames.home);
                      }),
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Center(
      //   child: RoundedButton(
      //       title: 'Calculate Calorie',
      //       onPress: (){
      //         Navigator.pushNamed(context, RoutesNames.home);
      //       }),
      // ),
    );
  }
}
