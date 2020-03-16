

import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/BatchCStreamOne.dart';

class BatchCStreamOneNotifier with ChangeNotifier {
  List<BatchCStreamOne> _batchCStreamOneList = [];
  BatchCStreamOne _currentBatchCStreamOne;

  UnmodifiableListView<BatchCStreamOne> get batchCStreamOneList => UnmodifiableListView(_batchCStreamOneList);

  BatchCStreamOne get currentBatchCStreamOne => _currentBatchCStreamOne;

  set batchCStreamOneList(List<BatchCStreamOne> batchCStreamOneList) {
    _batchCStreamOneList = batchCStreamOneList;
    notifyListeners();
  }

  set currentBatchCStreamOne(BatchCStreamOne batchCStreamOne) {
    _currentBatchCStreamOne = batchCStreamOne;
    notifyListeners();
  }

}