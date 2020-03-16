
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/ExecutiveCDSCoordinators.dart';
import '../notifier/executive_cds_coordinators_notifier.dart';

getExecutiveCDSCoordinators(ExecutiveCDSCoordinatorsNotifier executiveCDSCoordinatorsNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('ExecutiveCDSCoordinators').getDocuments();

  List<ExecutiveCDSCoordinators> _executiveCDSCoordinators = [];

  snapshot.documents.forEach((document) {
    ExecutiveCDSCoordinators executiveCDSCoordinators = ExecutiveCDSCoordinators.fromMap(document.data);
    _executiveCDSCoordinators.add(executiveCDSCoordinators);
  });

  executiveCDSCoordinatorsNotifier.executiveCDSCoordinatorsList = _executiveCDSCoordinators;
}