import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:music_search/model/fetch_response.dart';
import 'package:music_search/model/results.dart';
import 'package:music_search/utils/const.dart';
import 'package:music_search/utils/http_utils.dart';
import 'package:music_search/widget/loading_error_widget.dart';
import 'package:music_search/widget/loading_widget.dart';
import 'package:music_search/widget/music_info_list.dart';

///入口页面
class MainPagePage extends StatefulWidget {
  const MainPagePage({super.key});

  @override
  State<MainPagePage> createState() => _MainPagePageState();
}

class _MainPagePageState extends State<MainPagePage> {
  late Box<Results> box;

  Future<List<Results>> fetchData() async {
    var box = await Hive.openBox<Results>(HBKMusicSearch);
    var list = box.values.toList();
    if (list.isNotEmpty) {
      log("++++++++++++ read data from cache");
      return list;
    } else {
      FetchResponse? response = await HttpUtils.instance().fetchData();
      log("------------- read data from network");
      if (response?.results != null && response!.results!.isNotEmpty) {
        box.addAll(response.results!);
        box.flush();
        return response.results!;
      } else {
        return [];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot<List<Results>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            return MusicInfoList(
              datas: snapshot.data!,
            );
          } else {
            return const LoadingErrorWidget();
          }
        } else {
          return const LoadingWidget();
        }
      },
    ));
  }
}
