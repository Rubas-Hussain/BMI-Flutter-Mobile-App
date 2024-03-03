import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:testing2/resources/textstyles.dart';
import 'package:testing2/view_model/home_provider.dart';

import '../resources/colors.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiProvider=Provider.of<HomeProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Appcolors.screenBackColor,
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Appcolors.greenColor,size: 30,)),
        backgroundColor: Appcolors.screenBackColor,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 13.0), child: InkWell(
              onTap: (){},
              child: FaIcon(FontAwesomeIcons.barsStaggered,color: Appcolors.greenColor,size: 30,)
            // child: FaIcon(FontAwesomeIcons.gear,color: Appcolors.greenColor,size: 35,)
          )
          ),
        ],
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Your BMI is',style: AppTextStyles.mBlackStyle30,),
                    Spacer(),
                    Icon(Icons.share,color: Appcolors.greenColor,size: 30,),
                    SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                    // SizedBox(width: 10,),
                    Consumer<HomeProvider>(builder: (context,valuees,child){
                      return InkWell(
                          onTap: (){
                            valuees.toggleSaveIcon();
                          },
                          child:(valuees.saveIcon) ? Icon(Icons.bookmark_border_outlined,color: Appcolors.greenColor,size: 30,)
                      :
                          Icon(Icons.bookmark,color: Appcolors.greenColor,size: 30,)
                      );
                    },),
                    SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                    // SizedBox(width: 10,),
                    Icon(Icons.error_outline,color: Appcolors.greenColor,size: 30,),
                  ],
                ),
                Consumer<HomeProvider>(builder: (context,valuees,child){
                  // final double bmiValue=valuees.bmi.toStringAsFixed(1);
                  // return Text(bmiProvider.bmi.toStringAsFixed(2),style: AppTextStyles.mGreenStyle110,);
                  final double bmiValue=valuees.bmi;
                  print('consumer Working');
                  TextStyle textStyle;
                  if(bmiValue<18.5){
                    textStyle=AppTextStyles.mBlueStyle110;
                  }else if(bmiValue>24.9){
                    textStyle=AppTextStyles.mBrickStyle110;
                  }else{
                    textStyle=AppTextStyles.mGreenStyle110;
                  }
                  return Text(bmiValue.toStringAsFixed(1).toString(),style: textStyle,);
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('-18.5',style: AppTextStyles.mGreyStyle17,),
                    Text('18.5',style: AppTextStyles.mGreyStyle17,),
                    Text('24.9',style: AppTextStyles.mGreyStyle17,),
                    Text('30+',style: AppTextStyles.mGreyStyle17,),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.005,),
                Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    children: [
                      //Child Container 2
                      Expanded(
                        child: Container(color: Appcolors.blueColor,),),
                      Expanded(
                        child: Container(color: Appcolors.greenColor,),),
                      Expanded(
                        child: Container(color: Appcolors.brickColor),),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.005,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Underweight',style: AppTextStyles.mBlueStyle17,),
                    Text('Healthy',style: AppTextStyles.mGreenStyle17,),
                    Text('Obesity',style: AppTextStyles.mBrickStyle17,),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                Card(
                  elevation: 0.0,
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text("Your BMI is 20.7, indicating that your weight lies in the Normal category for adults of your height.\n\n"
                        "For your height, a normal weight range could be from 53.5 to 72 Kilograms.\n\n"
                        "Maintaining a healthy weight may reduce the risk of chronic disease associated with overweight and obesity.",
                      style: AppTextStyles.lBlackStyle17,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
