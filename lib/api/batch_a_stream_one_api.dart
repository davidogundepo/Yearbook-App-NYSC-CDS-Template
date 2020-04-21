
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/BatchAStreamOne.dart';
import '../notifier/batch_a_stream_one_notifier.dart';

getBatchAStreamOne(BatchAStreamOneNotifier batchAStreamOneNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('BatchAStreamOneCorpers').orderBy("name").getDocuments();

  List<BatchAStreamOne> _batchAStreamOneList = [];

  snapshot.documents.forEach((document) {
    BatchAStreamOne batchAStreamOne = BatchAStreamOne.fromMap(document.data);
    _batchAStreamOneList.add(batchAStreamOne);
  });

  batchAStreamOneNotifier.batchAStreamOneList = _batchAStreamOneList;
}