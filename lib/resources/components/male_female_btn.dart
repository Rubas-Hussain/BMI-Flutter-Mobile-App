import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../colors.dart';
import '../textstyles.dart';

class MaleFemaleButton extends StatefulWidget {
  @override
  State<MaleFemaleButton> createState() => _MaleFemaleButtonState();
}

class _MaleFemaleButtonState extends State<MaleFemaleButton> {


  // switchingButtons[0,1]=[male,female]
  ValueNotifier<List<bool>> switchingButtons=ValueNotifier<List<bool>>([true,false]);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    switchingButtons.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final btnProvider=Provider.of<HomeProvider>(context);
    print("Whole widget builds");
    // Big Container
    return Container(
      decoration:  BoxDecoration(
          color:Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: Appcolors.greenColor,
              width: 2
          )
      ),
      clipBehavior: Clip.hardEdge, // Ensures child widgets are clipped to the border radius
      child: ValueListenableBuilder(
        valueListenable: switchingButtons,
        builder:(context,value,child){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Child Container 1
              Expanded(
                child: InkWell(
                  onTap:(){
                    switchingButtons.value[0]=true;
                    switchingButtons.value[1]=false;
                    switchingButtons.notifyListeners();

                  },
                  child: Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                      color:(switchingButtons.value[0]==true) ? Appcolors.greenColor : Colors.transparent,
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (switchingButtons.value[0]==true) ? Icon(Icons.male_outlined,size: 30,color: Appcolors.whiteColor,)
                        :  Icon(Icons.male_outlined,size: 30,color: Appcolors.greenColor,),
                        SizedBox(width: 2,),
                        (switchingButtons.value[0]==true) ? Center(child: Text('Male',style: AppTextStyles.mWhiteStyle17,))
                            :
                        Center(child: Text('Male',style: AppTextStyles.mGreenStyle17,)),

                      ],
                    )
                  ),
                ),
              ),
              // Child Container 2
              Expanded(
                child: InkWell(
                  onTap:(){
                    switchingButtons.value[1]=true;
                    switchingButtons.value[0]=false;
                    switchingButtons.notifyListeners();
                  },
                  child: Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                      color:(switchingButtons.value[1]==true) ? Appcolors.greenColor : Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (switchingButtons.value[1]==true) ? Icon(Icons.female_outlined,size: 30,color: Appcolors.whiteColor,)
                            :  Icon(Icons.female_outlined,size: 30,color: Appcolors.greenColor,),
                        SizedBox(width: 2,),
                        (switchingButtons.value[1]==true) ? Center(child: Text('Female',style: AppTextStyles.mWhiteStyle17,))
                            :
                        Center(child: Text('Female',style: AppTextStyles.mGreenStyle17,)),
                      ],
                    )
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
