import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimerRow extends StatelessWidget {
  const TimerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.timer, color: Colors.amber, size: 24.w),
        SizedBox(width: 8.w),
        Text(
          "01:26 / 02:00", 
          style: TextStyle(fontSize: 16.sp, color: Colors.amber),
        ),
      ],
    );
  }
}
