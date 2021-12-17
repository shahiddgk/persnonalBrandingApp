import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioButtons extends StatefulWidget {

  Function radioButtonValue;
  List<String>RadioValue = [];
  String selectedValue;

  RadioButtons({required this.radioButtonValue,required this.RadioValue,required this.selectedValue});

  @override
  _RadioButtonsState createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomRadioButton(
            elevation: 0,
            unSelectedColor:
            Theme.of(context)
                .canvasColor,
            buttonLables: widget.RadioValue,
            enableShape: true,
            buttonValues: widget.RadioValue,
            buttonTextStyle:
            const ButtonTextStyle(
                selectedColor:
                Colors.white,
                unSelectedColor:
                Colors.black,
                textStyle: TextStyle(
                    fontSize: 12)),
            radioButtonValue: widget.radioButtonValue(),
            defaultSelected: widget.selectedValue,
            selectedColor:
            Theme.of(context)
                .accentColor,
      ),
    );
  }
}
