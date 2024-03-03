import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:testing2/utils/routes/routes_names.dart';
import 'package:testing2/view_model/home_provider.dart';
import '../resources/colors.dart';
import '../resources/components/age_button.dart';
import '../resources/components/male_female_btn.dart';
import '../resources/components/range_slider.dart';
import '../resources/components/rounded_button.dart';
import '../resources/textstyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final ValueNotifier<bool> colorFlag=ValueNotifier<bool>(true);

class _HomeScreenState extends State<HomeScreen> {
  // final colorProvider=Provider.of<HomeProvider>(context);
  @override
  Widget build(BuildContext context) {

    print('Whole Widget build');
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Calorie\nCalculator',style: AppTextStyles.mBlackStyle30,),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: MaleFemaleButton(),
              ),
              SizedBox(height: 15,),
              Text('Age',style: AppTextStyles.mBlackStyle17,),
              SizedBox(height: 10,),
              AgeButton(),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Height',style: AppTextStyles.mBlackStyle17,),
                  Text('Meters',style: AppTextStyles.mGreenStyle17,),
                ],
              ),
              SizedBox(height: 10,),
              HeightRangeSlider(),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Weight',style: AppTextStyles.mBlackStyle17,),
                  Text('Kg',style: AppTextStyles.mGreenStyle17,),
                ],
              ),
              SizedBox(height: 10,),
              WeightRangeSlider(),
              SizedBox(height: 20,),
              // Text('Exercise level',style: AppTextStyles.mBlackStyle17,),
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04),
                // child: Center(child: RoundedButton(title: 'Calculate BMI', onPress: (){})),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 100,
          child: Center(
              child: RoundedButton(
                  title: 'Calculate BMI',
                  onPress: (){
                    final bmiProvider=Provider.of<HomeProvider>(context,listen: false);
                    bmiProvider.calculateBmi();
                    Navigator.pushNamed(context, RoutesNames.result);
                  })
          )
      ),
    );
  }
}
