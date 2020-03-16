
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/BatchAStreamOne.dart';

class BatchAStreamOneNotifier with ChangeNotifier {
  List<BatchAStreamOne> _batchAStreamOneList = [];
  BatchAStreamOne _currentBatchAStreamOne;

  UnmodifiableListView<BatchAStreamOne> get batchAStreamOneList => UnmodifiableListView(_batchAStreamOneList);

  BatchAStreamOne get currentBatchAStreamOne => _currentBatchAStreamOne;

  set batchAStreamOneList(List<BatchAStreamOne> batchAStreamOneList) {
    _batchAStreamOneList = batchAStreamOneList;
    notifyListeners();
  }

  set currentBatchAStreamOne(BatchAStreamOne batchAStreamOne) {
    _currentBatchAStreamOne = batchAStreamOne;
    notifyListeners();
  }

}