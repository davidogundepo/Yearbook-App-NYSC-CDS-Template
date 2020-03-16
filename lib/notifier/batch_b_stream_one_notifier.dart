

import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/BatchBStreamOne.dart';

class BatchBStreamOneNotifier with ChangeNotifier {
  List<BatchBStreamOne> _batchBStreamOneList = [];
  BatchBStreamOne _currentBatchBStreamOne;

  UnmodifiableListView<BatchBStreamOne> get batchBStreamOneList => UnmodifiableListView(_batchBStreamOneList);

  BatchBStreamOne get currentBatchBStreamOne => _currentBatchBStreamOne;

  set batchBStreamOneList(List<BatchBStreamOne> batchBStreamOneList) {
    _batchBStreamOneList = batchBStreamOneList;
    notifyListeners();
  }

  set currentBatchBStreamOne(BatchBStreamOne batchBStreamOne) {
    _currentBatchBStreamOne = batchBStreamOne;
    notifyListeners();
  }

}