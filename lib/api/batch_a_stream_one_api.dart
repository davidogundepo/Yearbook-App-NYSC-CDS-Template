
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/BatchAStreamOne.dart';
import '../notifier/batch_a_stream_one_notifier.dart';

getBatchAStreamOne(BatchAStreamOneNotifier batchAStreamOneNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('BatchAStreamOneCorpers').orderBy("name").get();

  List<BatchAStreamOne> _batchAStreamOneList = [];

  snapshot.docs.forEach((document) {
    BatchAStreamOne batchAStreamOne = BatchAStreamOne.fromMap(document.data());
    _batchAStreamOneList.add(batchAStreamOne);
  });

  batchAStreamOneNotifier.batchAStreamOneList = _batchAStreamOneList;
}