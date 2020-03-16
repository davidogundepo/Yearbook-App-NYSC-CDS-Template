
class ExecutiveCDSCoordinators {
  String image;
  String name;
  String position_enforced;
  String nysc_batch;
  String id;

  ExecutiveCDSCoordinators.fromMap(Map<String, dynamic> data) {
    image = data['image'];
    name = data['name'];
    nysc_batch = data['nysc_batch'];
    position_enforced = data['position_enforced'];
    id = data['id'];
  }
}