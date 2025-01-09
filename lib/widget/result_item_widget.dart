import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:music_search/model/results.dart';
import 'package:music_search/widget/loading_widget.dart';

///每一条数据显示的widget
class ResultItemWidget extends StatelessWidget {
  Results results;
  String? searchWord;
  String? sortedWord;
  ResultItemWidget(
      {super.key, required this.results, this.searchWord, this.sortedWord});

  @override
  Widget build(BuildContext context) {
    String imageUrl = results.artworkUrl100 ?? "";
    String trackName = results.trackName ?? "未知曲目";
    String albumName = results.collectionName ?? "未知专辑";
    bool showExternal = searchWord != null || sortedWord != null;
    String externalStr = "";
    if (showExternal) {
      if (searchWord != null && searchWord!.isNotEmpty) {
        externalStr = "搜索:$searchWord";
      }
      if (sortedWord != null && sortedWord!.isNotEmpty) {
        externalStr += " 排序:$sortedWord";
      }
    }
    return Container(
      width: double.infinity,
      height: 114.w,
      decoration: const BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Color.fromARGB(20, 0, 0, 0), width: 2.0))),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100.w,
            height: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8))),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, imageUrl) {
                return const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Icon(Icons.image_sharp));
              },
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const SizedBox(height: 8),
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.left,
                  trackName,
                  softWrap: true,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.left,
                  "专辑 $albumName",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const Spacer(),
                Offstage(
                  offstage: !showExternal,
                  child: Text(
                    externalStr.trim(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 153, 153, 153)),
                  ),
                )
              ]))
        ],
      ),
    );
  }
}
