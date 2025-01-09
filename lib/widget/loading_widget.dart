import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///加载中的widget
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Color(0xFFF1F3F4),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24.w,
              height: 24.w,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.grey[200]),
                strokeWidth: 3,
              ),
            ),
            Container(
              height: 4.h,
            ),
            Text(
              '加载中...',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
