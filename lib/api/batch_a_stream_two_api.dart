
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/BatchAStreamTwo.dart';
import '../notifier/batch_a_stream_two_notifier.dart';

getBatchAStreamTwo(BatchAStreamTwoNotifier batchAStreamTwoNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('BatchAStreamTwoCorpers').orderBy("name").get();

  List<BatchAStreamTwo> _batchAStreamTwoList = [];

  snapshot.docs.forEach((document) {
    BatchAStreamTwo batchAStreamTwo = BatchAStreamTwo.fromMap(document.data());
    _batchAStreamTwoList.add(batchAStreamTwo);
  });

  batchAStreamTwoNotifier.batchAStreamTwoList = _batchAStreamTwoList;
}