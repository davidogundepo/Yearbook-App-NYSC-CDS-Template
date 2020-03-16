
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/LGOfficials.dart';
import '../notifier/lg_officials_notifier.dart';

getLGOfficials(LGOfficialsNotifier lgOfficialsNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('LGOfficials').getDocuments();

  List<LGOfficials> _lGOfficials = [];

  snapshot.documents.forEach((document) {
    LGOfficials lgOfficials = LGOfficials.fromMap(document.data);
    _lGOfficials.add(lgOfficials);
  });

  lgOfficialsNotifier.lGOfficialsList = _lGOfficials;
}