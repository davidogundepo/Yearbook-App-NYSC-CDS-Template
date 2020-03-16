

import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/LGOfficials.dart';

class LGOfficialsNotifier with ChangeNotifier {
  List<LGOfficials> _lGOfficialsList = [];
  LGOfficials _currentLGOfficials;

  UnmodifiableListView<LGOfficials> get lGOfficialsList => UnmodifiableListView(_lGOfficialsList);

  LGOfficials get currentLGOfficials => _currentLGOfficials;

  set lGOfficialsList(List<LGOfficials> lGOfficialsList) {
    _lGOfficialsList = lGOfficialsList;
    notifyListeners();
  }

  set currentLGOfficials(LGOfficials lGOfficials) {
    _currentLGOfficials = lGOfficials;
    notifyListeners();
  }

}