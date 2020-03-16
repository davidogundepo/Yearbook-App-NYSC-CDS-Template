

import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/ExecutiveCDSCoordinators.dart';

class ExecutiveCDSCoordinatorsNotifier with ChangeNotifier {
  List<ExecutiveCDSCoordinators> _executiveCDSCoordinatorsList = [];
  ExecutiveCDSCoordinators _currentExecutiveCDSCoordinators;

  UnmodifiableListView<ExecutiveCDSCoordinators> get executiveCDSCoordinatorsList => UnmodifiableListView(_executiveCDSCoordinatorsList);

  ExecutiveCDSCoordinators get currentExecutiveCDSCoordinators => _currentExecutiveCDSCoordinators;

  set executiveCDSCoordinatorsList(List<ExecutiveCDSCoordinators> executiveCDSCoordinatorsList) {
    _executiveCDSCoordinatorsList = executiveCDSCoordinatorsList;
    notifyListeners();
  }

  set currentExecutiveCDSCoordinators(ExecutiveCDSCoordinators executiveCDSCoordinators) {
    _currentExecutiveCDSCoordinators = executiveCDSCoordinators;
    notifyListeners();
  }

}