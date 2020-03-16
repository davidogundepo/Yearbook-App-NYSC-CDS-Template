

import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/BatchBStreamTwo.dart';

class BatchBStreamTwoNotifier with ChangeNotifier {
  List<BatchBStreamTwo> _batchBStreamTwoList = [];
  BatchBStreamTwo _currentBatchBStreamTwo;

  UnmodifiableListView<BatchBStreamTwo> get batchBStreamTwoList => UnmodifiableListView(_batchBStreamTwoList);

  BatchBStreamTwo get currentBatchBStreamTwo => _currentBatchBStreamTwo;

  set batchBStreamTwoList(List<BatchBStreamTwo> batchBStreamTwoList) {
    _batchBStreamTwoList = batchBStreamTwoList;
    notifyListeners();
  }

  set currentBatchBStreamTwo(BatchBStreamTwo batchBStreamTwo) {
    _currentBatchBStreamTwo = batchBStreamTwo;
    notifyListeners();
  }

}