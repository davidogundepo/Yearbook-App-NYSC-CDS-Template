
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/BatchCStreamOne.dart';
import '../notifier/batch_c_stream_one_notifier.dart';

getBatchCStreamOne(BatchCStreamOneNotifier batchCStreamOneNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('BatchCStreamOneCorpers').orderBy("name").get();

  List<BatchCStreamOne> _batchCStreamOneList = [];

  snapshot.docs.forEach((document) {
    BatchCStreamOne batchCStreamOne = BatchCStreamOne.fromMap(document.data());
    _batchCStreamOneList.add(batchCStreamOne);
  });

  batchCStreamOneNotifier.batchCStreamOneList = _batchCStreamOneList;
}