
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/ExecutiveCDSCoordinators.dart';
import '../notifier/executive_cds_coordinators_notifier.dart';

getExecutiveCDSCoordinators(ExecutiveCDSCoordinatorsNotifier executiveCDSCoordinatorsNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('ExecutiveCDSCoordinators').orderBy("id").get();

  List<ExecutiveCDSCoordinators> _executiveCDSCoordinators = [];

  snapshot.docs.forEach((document) {
    ExecutiveCDSCoordinators executiveCDSCoordinators = ExecutiveCDSCoordinators.fromMap(document.data());
    _executiveCDSCoordinators.add(executiveCDSCoordinators);
  });

  executiveCDSCoordinatorsNotifier.executiveCDSCoordinatorsList = _executiveCDSCoordinators;
}