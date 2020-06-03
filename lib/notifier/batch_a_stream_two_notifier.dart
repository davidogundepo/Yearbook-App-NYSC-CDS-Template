
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/BatchAStreamTwo.dart';

class BatchAStreamTwoNotifier with ChangeNotifier {
  List<BatchAStreamTwo> _batchAStreamTwoList = [];
  BatchAStreamTwo _currentBatchAStreamTwo;

  UnmodifiableListView<BatchAStreamTwo> get batchAStreamTwoList => UnmodifiableListView(_batchAStreamTwoList);

  BatchAStreamTwo get currentBatchAStreamTwo => _currentBatchAStreamTwo;

  set batchAStreamTwoList(List<BatchAStreamTwo> batchAStreamTwoList) {
    _batchAStreamTwoList = batchAStreamTwoList;
    notifyListeners();
  }

  set currentBatchAStreamTwo(BatchAStreamTwo batchAStreamTwo) {
    _currentBatchAStreamTwo = batchAStreamTwo;
    notifyListeners();
  }

}