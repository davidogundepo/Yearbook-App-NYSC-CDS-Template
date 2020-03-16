
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/BatchBStreamOne.dart';
import '../notifier/batch_b_stream_one_notifier.dart';

getBatchBStreamOne(BatchBStreamOneNotifier batchBStreamOneNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('BatchBStreamOneCorpers').getDocuments();

  List<BatchBStreamOne> _batchBStreamOneList = [];

  snapshot.documents.forEach((document) {
    BatchBStreamOne batchBStreamOne = BatchBStreamOne.fromMap(document.data);
    _batchBStreamOneList.add(batchBStreamOne);
  });

  batchBStreamOneNotifier.batchBStreamOneList = _batchBStreamOneList;
}