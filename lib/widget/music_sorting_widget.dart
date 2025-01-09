import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:music_search/controller/music_search_controller.dart';
import 'package:music_search/utils/const.dart';

///排序的widget
class MusicSortingWidget extends StatefulWidget {
  const MusicSortingWidget({super.key});

  @override
  State<MusicSortingWidget> createState() => _MusicSortingWidgetState();
}

class _MusicSortingWidgetState extends State<MusicSortingWidget> {
  String _currentItemSelected = "Song Name";

  MusicSearchController getxController =
      Get.find<MusicSearchController>(tag: GTSearchController);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 118,
      height: double.infinity,
      child: Row(
        children: [
          const Text(
            "排序:",
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const Spacer(),
          PopupMenuButton(
              itemBuilder: (BuildContext context) => _buildMenuList(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(_currentItemSelected,
                      style:
                          const TextStyle(fontSize: 11, color: Colors.black)),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
              onSelected: (v) {
                setState(() {
                  _currentItemSelected = v;
                  getxController.changeSortWord(v);
                });
              })
        ],
      ),
    );
  }

  List<PopupMenuItem> _buildMenuList() {
    var data = ["Song Name", "Album Name"];
    return data.map((String value) {
      return PopupMenuItem(
        value: value,
        child: Text(
          value,
          style: const TextStyle(fontSize: 11),
        ),
      );
    }).toList();
  }
}
