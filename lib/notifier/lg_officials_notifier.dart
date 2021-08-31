

import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/LGOfficials.dart';

class LGOfficialsNotifier with ChangeNotifier {
  List<LGOfficials> _lgOfficialsList = [];
  LGOfficials _currentLGOfficials;

  UnmodifiableListView<LGOfficials> get lgOfficialsList => UnmodifiableListView(_lgOfficialsList);

  LGOfficials get currentLGOfficials => _currentLGOfficials;

  set lgOfficialsList(List<LGOfficials> lgOfficialsList) {
    _lgOfficialsList = lgOfficialsList;
    notifyListeners();
  }

  set currentLGOfficials(LGOfficials lgOfficials) {
    _currentLGOfficials = lgOfficials;
    notifyListeners();
  }

}