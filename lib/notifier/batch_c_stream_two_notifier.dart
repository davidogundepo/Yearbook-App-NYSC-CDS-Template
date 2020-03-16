

import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/BatchCStreamTwo.dart';

class BatchCStreamTwoNotifier with ChangeNotifier {
  List<BatchCStreamTwo> _batchCStreamTwoList = [];
  BatchCStreamTwo _currentBatchCStreamTwo;

  UnmodifiableListView<BatchCStreamTwo> get batchCStreamTwoList => UnmodifiableListView(_batchCStreamTwoList);

  BatchCStreamTwo get currentBatchCStreamTwo => _currentBatchCStreamTwo;

  set batchCStreamTwoList(List<BatchCStreamTwo> batchCStreamTwoList) {
    _batchCStreamTwoList = batchCStreamTwoList;
    notifyListeners();
  }

  set currentBatchCStreamTwo(BatchCStreamTwo batchCStreamTwo) {
    _currentBatchCStreamTwo = batchCStreamTwo;
    notifyListeners();
  }

}