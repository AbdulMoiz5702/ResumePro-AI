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
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (userModel.email != null)
            const Sized(
              height: 0.005,
            ),
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
          const Sized(
            height: 0.005,
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
                size: 10,
              ),
              const Sized(
                width: 0.01,
              ),
              Text(userModel.phoneNumber!, style: userDataStyle),
            ],
          ),
          if (userModel.address != null)
            Column(
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


Widget classicPersonalInfo(
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
          height: 0.005,
        ),
      Text(userModel.currentPosition!, style: currentPositionStyle),
      if (userModel.email != null)
        const Sized(
          height: 0.003,
        ),
      Row(
        children: [
          if (userModel.email != null)
          Text(userModel.email!, style: userDataStyle),
          Sized(width: 0.02,),
          if (userModel.phoneNumber != null)
          Text(userModel.phoneNumber!, style: userDataStyle),
          Sized(width: 0.02,),
          if (userModel.address != null)
            Text(userModel.address!, style: userDataStyle)
        ],
      ),
    ],
  );
}

// tempelate three

Widget classicPersonalThree(
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
      if (userModel.email != null)
        const Sized(
          height: 0.003,
        ),
      Row(
        children: [
          if (userModel.phoneNumber != null)
            Text(userModel.phoneNumber!, style: userDataStyle),
          Sized(width: 0.01,),
          Text('|', style: userDataStyle),
          Sized(width: 0.01,),
          if (userModel.email != null)
            Text(userModel.email!, style: userDataStyle),
          Sized(width: 0.01,),
          Text('|', style: userDataStyle),
          Sized(width: 0.01,),
          if (userModel.address != null)
            Text(userModel.address!, style: userDataStyle)
        ],
      ),
      if (userModel.currentPosition != null)
        const Sized(
          height: 0.005,
        ),
      Text(userModel.currentPosition!, style: currentPositionStyle),
    ],
  );
}

Widget buildPersonalClassicFour(
    {required context,
      required userModel,
      required TextStyle fullNameStyle,
      required TextStyle currentPositionStyle,
      required Color color,
      required TextStyle userDataStyle}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
     Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisSize: MainAxisSize.min,
       children: [
         Text(userModel.fullName, style: fullNameStyle),
         if (userModel.currentPosition != null)
           const Sized(
             height: 0.005,
           ),
         Text(userModel.currentPosition!, style: currentPositionStyle),
       ],
     ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (userModel.email != null)
            const Sized(
              height: 0.005,
            ),
          Row(
            children: [
              Icon(
                Icons.email,
                color: color,
                size: 10,
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
                size: 10,
              ),
              const Sized(
                width: 0.02,
              ),
              Text(userModel.phoneNumber!, style: userDataStyle),
            ],
          ),
          if (userModel.address != null)
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
                  width: 0.02,
                ),
                Text(userModel.address!, style: userDataStyle),
              ],
            )
        ],
      ),
    ],
  );
}

Widget buildPersonalClassicFive(
    {required context,
      required userModel,
      required TextStyle fullNameStyle,
      required TextStyle currentPositionStyle,
      required Color color,}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(userModel.fullName, style: fullNameStyle),
      if (userModel.currentPosition != null)
        const Sized(
          height: 0.005,
        ),
      Text(userModel.currentPosition!, style: currentPositionStyle),
    ],
  );
}

Widget buildPersonalClassicFiveSecond(
    {required context,
      required userModel,
      required TextStyle userDataStyle,required TextStyle userDataStyleSecond}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      if (userModel.phoneNumber != null)
        const Sized(
          height: 0.005,
        ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Phone:', style: userDataStyleSecond),
          Text(userModel.phoneNumber!, style: userDataStyle),
        ],
      ),
      if (userModel.email != null)
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email:', style: userDataStyleSecond),
          Text(userModel.email!, style: userDataStyle),
        ],
      ),
      if (userModel.address != null)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Address:', style: userDataStyleSecond),
            Text(userModel.address!, style: userDataStyle),
          ],
        )
    ],
  );
}

Widget classicPersonalSix(
    {required context,
      required userModel,
      required TextStyle fullNameStyle,
      required TextStyle currentPositionStyle,
      required Color color,
      required TextStyle userDataStyle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(userModel.fullName, style: fullNameStyle),
      if (userModel.currentPosition != null)
        const Sized(
          height: 0.005,
        ),
      Text(userModel.currentPosition!, style: currentPositionStyle),
      if (userModel.email != null)
        const Sized(
          height: 0.003,
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (userModel.phoneNumber != null)
            Text(userModel.phoneNumber!, style: userDataStyle),
          Sized(width: 0.01,),
          Text('|', style: userDataStyle),
          Sized(width: 0.01,),
          if (userModel.email != null)
            Text(userModel.email!, style: userDataStyle),
          Sized(width: 0.01,),
          Text('|', style: userDataStyle),
          Sized(width: 0.01,),
          if (userModel.address != null)
            Text(userModel.address!, style: userDataStyle)
        ],
      ),
    ],
  );
}
