
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/BatchBStreamTwo.dart';
import '../notifier/batch_b_stream_two_notifier.dart';

getBatchBStreamTwo(BatchBStreamTwoNotifier batchBStreamTwoNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('BatchBStreamTwoCorpers').orderBy("name").getDocuments();

  List<BatchBStreamTwo> _batchBStreamTwoList = [];

  snapshot.documents.forEach((document) {
    BatchBStreamTwo batchBStreamTwo = BatchBStreamTwo.fromMap(document.data);
    _batchBStreamTwoList.add(batchBStreamTwo);
  });

  batchBStreamTwoNotifier.batchBStreamTwoList = _batchBStreamTwoList;
}