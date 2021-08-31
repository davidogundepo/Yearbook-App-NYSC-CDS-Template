
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/LGOfficials.dart';
import '../notifier/lg_officials_notifier.dart';

getLGOfficials(LGOfficialsNotifier lgOfficialsNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('LGOfficials').orderBy("id").get();

  List<LGOfficials> _lgOfficials = [];

  snapshot.docs.forEach((document) {
    LGOfficials lgOfficials = LGOfficials.fromMap(document.data());
    _lgOfficials.add(lgOfficials);
  });

  lgOfficialsNotifier.lgOfficialsList = _lgOfficials;
}