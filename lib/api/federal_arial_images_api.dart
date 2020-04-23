
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/FederalArial.dart';
import '../notifier/federal_arial_notifier.dart';

getFederalArial(FederalArialNotifier federalArialNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('FederalArialViews').getDocuments();

  List<FederalArial> _federalArialList = [];

  snapshot.documents.forEach((document) {
    FederalArial federalArial = FederalArial.fromMap(document.data);
    _federalArialList.add(federalArial);
  });

  federalArialNotifier.federalArialList = _federalArialList;
}