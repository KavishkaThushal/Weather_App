import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';

class CategoryStyle extends StatelessWidget {
  const CategoryStyle({super.key, required this.title,required this.value,required this.icon});
  final String title;
  final String value;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: kCategoryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: 150.0,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: kSubCategoryStyle,),
          Text(
            '$value km',
            style: kMessageTextStyle,

          ),
          Text(icon,style: kMessageDescStyle,),
        ],
      ),
    );
  }
}