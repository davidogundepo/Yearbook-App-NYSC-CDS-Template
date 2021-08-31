
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/BatchBStreamOne.dart';
import '../notifier/batch_b_stream_one_notifier.dart';

getBatchBStreamOne(BatchBStreamOneNotifier batchBStreamOneNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('BatchBStreamOneCorpers').orderBy("name").get();

  List<BatchBStreamOne> _batchBStreamOneList = [];

  snapshot.docs.forEach((document) {
    BatchBStreamOne batchBStreamOne = BatchBStreamOne.fromMap(document.data());
    _batchBStreamOneList.add(batchBStreamOne);
  });

  batchBStreamOneNotifier.batchBStreamOneList = _batchBStreamOneList;
}