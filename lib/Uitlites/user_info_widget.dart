import 'package:flutter/material.dart';

import '../widgets/custom_sizedBox.dart';

// 1 modern

Widget buildPersonalInfo(
    {required context,
    required userModel,
    required TextStyle fullNameStyle,
    required TextStyle currentPositionStyle,
    required Color color,
    required TextStyle userDataStyle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(userModel.fullName, style: fullNameStyle),
      if (userModel.currentPosition != null)
        const Sized(
          height: 0.01,
        ),
      Text(userModel.currentPosition!, style: currentPositionStyle),
      if (userModel.email != null)
        const Sized(
          height: 0.005,
        ),
      Row(
        children: [
          Icon(
            Icons.email,
            color: color,
            size: 20,
          ),
          const Sized(
            width: 0.02,
          ),
          Text(userModel.email!, style: userDataStyle),
        ],
      ),
      if (userModel.phoneNumber != null)
        const Sized(
          height: 0.005,
        ),
      Row(
        children: [
          Icon(
            Icons.phone,
            color: color,
            size: 20,
          ),
          const Sized(
            width: 0.02,
          ),
          Text(userModel.phoneNumber!, style: userDataStyle),
        ],
      ),
      if (userModel.address != null)
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Sized(
              height: 0.005,
            ),
            Row(
              children: [
                Icon(
                  Icons.fmd_good,
                  color: color,
                  size: 20,
                ),
                const Sized(
                  width: 0.02,
                ),
                Text(userModel.address!, style: userDataStyle),
              ],
            ),
          ],
        )
    ],
  );
}

// 2 modern

Widget buildPersonalInfoModernTwo(
    {required context,
      required userModel,
      required TextStyle fullNameStyle,
      required TextStyle currentPositionStyle,
      required Color color,
      required TextStyle userDataStyle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(userModel.fullName, style: fullNameStyle),
      if (userModel.currentPosition != null)
        const Sized(
          height: 0.01,
        ),
      Text(userModel.currentPosition!, style: currentPositionStyle),
      if (userModel.email != null)
        const Sized(
          height: 0.005,
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.email,
                color: color,
                size: 10,
              ),
              const Sized(
                width: 0.01,
              ),
              Text(userModel.email!, style: userDataStyle),
            ],
          ),
          const Sized(width: 0.05,),
          Row(
            children: [
              Icon(
                Icons.phone,
                color: color,
                size: 10,
              ),
              const Sized(
                width: 0.01,
              ),
              Text(userModel.phoneNumber!, style: userDataStyle),
            ],
          ),
        ],
      ),
      if (userModel.address != null)
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Sized(
              height: 0.005,
            ),
            Row(
              children: [
                Icon(
                  Icons.fmd_good,
                  color: color,
                  size: 10,
                ),
                const Sized(
                  width: 0.01,
                ),
                Text(userModel.address!, style: userDataStyle),
              ],
            ),
          ],
        )
    ],
  );
}
