import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/custom_sizedBox.dart';



Widget buildCertificatedSection({required context ,required certificated,required Color color,required TextStyle style }) {
  if (certificated == null || certificated!.isEmpty) {
    return const Sized();
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: List.generate(certificated!.length,(index){
      var data = certificated![index];
      return Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.01),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.circle,color: color,size: 5,),
            Sized(width: 0.025,),
            Text(data.certificated, style:style )
          ],
        ),
      );
    }),
  );
}

Widget classicCertificatedSection({required context ,required certificated,required Color color,required TextStyle style }) {
  if (certificated == null || certificated!.isEmpty) {
    return const Sized();
  }
  return Wrap(
    crossAxisAlignment: WrapCrossAlignment.start,
    direction: Axis.horizontal, // Ensures horizontal wrapping
    spacing: MediaQuery.sizeOf(context).height * 0.01, // Adds spacing between items
    children: List.generate(certificated!.length,(index){
      var data = certificated![index];
      return Text(data.certificated, style:style );
    }),
  );
}


