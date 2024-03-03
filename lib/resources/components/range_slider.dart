import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:testing2/view_model/home_provider.dart';

import '../colors.dart';

class HeightRangeSlider extends StatefulWidget {
  HeightRangeSlider({super.key});

  @override
  State<HeightRangeSlider> createState() => _HeightRangeSliderState();
}

class _HeightRangeSliderState extends State<HeightRangeSlider> {
  // double currentValue = 1.2;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context,valuess,child){
        return Center(
          child: Container(
            width: 400,
            child: SfSlider(
              min: 1.2,
              max: 2.0,
              value: valuess.currentHeightValue,
              interval: 0.2,
              showTicks: true,
              // tickShape: ,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              activeColor: Appcolors.greenColor,
              onChanged: (value){
                valuess.setHeightValue(value);
              },
            ),
          ),
        );
      }
    );
  }
}

class WeightRangeSlider extends StatefulWidget {
  const WeightRangeSlider({super.key});

  @override
  State<WeightRangeSlider> createState() => _WeightRangeSliderState();
}

class _WeightRangeSliderState extends State<WeightRangeSlider> {
  // double currentValue=20.0;
  @override
  Widget build(BuildContext context) {
    print('Whole Widget builds2');
    return Consumer<HomeProvider>(
      builder: (context,valuess,child){
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: SfSlider(
              min: 20,
              max: 120,
              value: valuess.currentWeightValue,
              interval: 20,
              showTicks: true,
              showLabels: true,
              labelPlacement: LabelPlacement.onTicks,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              activeColor: Appcolors.greenColor,
              onChanged: (value){
                print(valuess.currentWeightValue);
                valuess.setWeightValue(value);
              },
            ),
          ),
        );
      },
    );
  }
}


