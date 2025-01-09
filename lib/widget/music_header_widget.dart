import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:music_search/widget/music_search_widget.dart';
import 'package:music_search/widget/music_sorting_widget.dart';

///音乐列表头部，包括搜索和排序
class MusicHeaderWidget extends StatefulWidget {
  const MusicHeaderWidget({super.key});

  @override
  State<MusicHeaderWidget> createState() => _MusicHeaderWidgetState();
}

class _MusicHeaderWidgetState extends State<MusicHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: 44,
      decoration: const BoxDecoration(
          color: Color.fromARGB(20, 125, 125, 125),
          boxShadow: [
            BoxShadow(
              blurRadius: 11.5,
              offset: Offset(0, 2),
              color: Color.fromARGB(40, 133, 133, 133),
            )
          ]),
      child: const Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Expanded(child: MusicSearchWidget()),
          SizedBox(
            width: 2,
          ),
          MusicSortingWidget(),
          SizedBox(
            width: 20,
          )
        ],
      ),
    ));
  }
}
