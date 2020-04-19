
class ExecutiveCDSCoordinators {
  String image;
  String name;
  String positionEnforced;
  String nyscBatch;
  String id;

  ExecutiveCDSCoordinators.fromMap(Map<String, dynamic> data) {
    image = data['image'];
    name = data['name'];
    nyscBatch = data['nysc_batch'];
    positionEnforced = data['position_enforced'];
    id = data['id'];
  }
}