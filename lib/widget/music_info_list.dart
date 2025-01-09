import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';
import 'package:music_search/controller/music_search_controller.dart';
import 'package:music_search/model/fetch_response.dart';
import 'package:music_search/model/results.dart';
import 'package:music_search/utils/const.dart';
import 'package:music_search/widget/result_item_widget.dart';
import 'package:music_search/widget/music_header_widget.dart';

///音乐列表
class MusicInfoList extends StatefulWidget {
  List<Results> datas;
  MusicInfoList({super.key, required this.datas});

  @override
  State<MusicInfoList> createState() => _MusicInfoListState();
}

class _MusicInfoListState extends State<MusicInfoList> {
  bool hidenHeader = true;

  @override
  Widget build(BuildContext context) {
    var controller =
        Get.put(MusicSearchController(widget.datas), tag: GTSearchController);
    return Column(
      children: [
        const MusicHeaderWidget(),
        Expanded(child: Obx(
          () {
            return ListView.builder(
                itemCount: controller.result.length,
                itemBuilder: (BuildContext context, int index) {
                  Results data = controller.result[index];
                  return ResultItemWidget(
                    results: data,
                    searchWord: controller.searchWord.value,
                    sortedWord: controller.sortWord.value,
                  );
                });
          },
        )),
      ],
    );
  }
}
/**
 * Obx(() {
          bool offstage = controller.offstage.value;
          return Offstage(
            offstage: offstage,
            child: const SearchAndeFileterWidget(),
          );
        }),
  GetBuilder<HeaderOffStageController>(
            init: controller,
            builder: (controller) {
              bool offstage = controller.offstage.value;
              return Offstage(
                offstage: offstage,
                child: const SearchAndeFileterWidget(),
              );
            }) 
            */