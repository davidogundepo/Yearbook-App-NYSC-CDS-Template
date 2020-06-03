
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/BatchAStreamTwo.dart';
import '../notifier/batch_a_stream_two_notifier.dart';

getBatchAStreamTwo(BatchAStreamTwoNotifier batchAStreamTwoNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('BatchAStreamTwoCorpers').orderBy("name").getDocuments();

  List<BatchAStreamTwo> _batchAStreamTwoList = [];

  snapshot.documents.forEach((document) {
    BatchAStreamTwo batchAStreamTwo = BatchAStreamTwo.fromMap(document.data);
    _batchAStreamTwoList.add(batchAStreamTwo);
  });

  batchAStreamTwoNotifier.batchAStreamTwoList = _batchAStreamTwoList;
}