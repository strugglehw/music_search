import 'package:get/get.dart';
import 'package:music_search/model/results.dart';

///getx的状态管理类
class MusicSearchController extends GetxController {
  List<Results> _datas = [];
  var result = <Results>[].obs;
  var searchWord = "".obs;
  var sortWord = "Song Name".obs;
  MusicSearchController(List<Results> datas) {
    _datas = datas;
    _datas.sort((Results r1, Results r2) {
      //trackName collectionName
      var trackName1 = r1.trackName ?? "";
      var trackName2 = r2.trackName ?? "";
      return trackName1.compareTo(trackName2);
    });
    result(_datas);
  }
  void changeSearchWord(String word) {
    var searchResult = _datas.where((item) {
      var trackName = item.trackName ?? "";
      var collectionName = item.collectionName ?? "";
      return trackName.contains(word) || collectionName.contains(word);
    }).toList();
    result(searchResult);
    searchWord(word);
  }

  void changeSortWord(String word) {
    // "Song Name", "Album Name"
    bool sortBySn = word == "Song Name";
    result.sort((Results r1, Results r2) {
      //trackName collectionName
      if (sortBySn) {
        var trackName1 = r1.trackName ?? "";
        var trackName2 = r2.trackName ?? "";
        return trackName1.compareTo(trackName2);
      } else {
        var collectionName1 = r1.collectionName ?? "";
        var collectionName2 = r2.collectionName ?? "";
        return collectionName1.compareTo(collectionName2);
      }
    });
    sortWord(word);
  }
}
