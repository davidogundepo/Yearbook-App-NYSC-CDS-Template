
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/BatchCStreamOne.dart';
import '../notifier/batch_c_stream_one_notifier.dart';

getBatchCStreamOne(BatchCStreamOneNotifier batchCStreamOneNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('BatchCStreamOneCorpers').orderBy("name").getDocuments();

  List<BatchCStreamOne> _batchCStreamOneList = [];

  snapshot.documents.forEach((document) {
    BatchCStreamOne batchCStreamOne = BatchCStreamOne.fromMap(document.data);
    _batchCStreamOneList.add(batchCStreamOne);
  });

  batchCStreamOneNotifier.batchCStreamOneList = _batchCStreamOneList;
}