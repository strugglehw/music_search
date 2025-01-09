import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:music_search/controller/music_search_controller.dart';
import 'package:music_search/utils/const.dart';
import 'package:music_search/widget/music_info_list.dart';

///搜索的widget
class MusicSearchWidget extends StatefulWidget {
  const MusicSearchWidget({super.key});

  @override
  State<MusicSearchWidget> createState() => _MusicSearchWidgetState();
}

class _MusicSearchWidgetState extends State<MusicSearchWidget> {
  var _showPrefix = true;
  TextEditingController _controller = TextEditingController();
  FocusNode _node = FocusNode();

  MusicSearchController getxController =
      Get.find<MusicSearchController>(tag: GTSearchController);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: TextFormField(
        controller: _controller,
        focusNode: _node,
        onTapOutside: (event) {
          _node.unfocus();
          log("onTapOutside");

          setState(() {
            _showPrefix = true;
          });
        },
        onTap: () {
          setState(() {
            _showPrefix = false;
          });
        },
        onChanged: (value) {
          log("value::$value");
          getxController.changeSearchWord(value);
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 4),
            counterText: "",
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
            prefixIcon: _showPrefix ? const Icon(Icons.search) : null,
            border: const OutlineInputBorder()),
      ),
    );
  }
}
