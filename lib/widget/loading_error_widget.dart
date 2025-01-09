import 'package:flutter/material.dart';

///错误提示的widget
class LoadingErrorWidget extends StatelessWidget {
  const LoadingErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Icon(Icons.warning), Text("请求出错")],
      ),
    );
  }
}
