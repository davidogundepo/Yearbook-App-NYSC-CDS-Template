
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/BatchCStreamTwo.dart';
import '../notifier/batch_c_stream_two_notifier.dart';

getBatchCStreamTwo(BatchCStreamTwoNotifier batchCStreamTwoNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('BatchCStreamTwoCorpers').orderBy("name").get();

  List<BatchCStreamTwo> _batchCStreamTwoList = [];

  snapshot.docs.forEach((document) {
    BatchCStreamTwo batchCStreamTwo = BatchCStreamTwo.fromMap(document.data());
    _batchCStreamTwoList.add(batchCStreamTwo);
  });

  batchCStreamTwoNotifier.batchCStreamTwoList = _batchCStreamTwoList;
}