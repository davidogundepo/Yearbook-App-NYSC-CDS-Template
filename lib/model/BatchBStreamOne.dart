class BatchBStreamOne {

  String academic_qualification;
  String alma_mater;
  String autobio;
  String bestmoment;
  String course_of_study;
  String d_o_b;
  String email;
  String facebook;
  String graduation_year;
  String hobbies;
  String id;
  String image;
  String instagram;
  String linkedin;
  String my_dropline;
  String name;
  String nickname;
  String philosophy;
  String phone;
  String ppa_assignment;
  String cds_executive;
  String cds_executive_position;
  String ppa_location;
  String ppa_name;
  String state_of_origin;
  String twitter;
  String whats_next;
  String where_you_live;
  String worst_moment;

  BatchBStreamOne.fromMap(Map<String, dynamic> data) {
    academic_qualification = data['academic_qualification'];
    alma_mater = data['alma_mater'];
    course_of_study = data['course_of_study'];
    graduation_year = data['graduation_year'];
    linkedin = data['linkedin'];
    ppa_assignment = data['ppa_assignment'];
    ppa_location = data['ppa_location'];
    cds_executive = data['cds_executive'];
    cds_executive_position = data['cds_executive_position'];
    ppa_name = data['ppa_name'];
    state_of_origin = data['state_of_origin'];
    id = data['id'];
    autobio = data['autobio'];
    bestmoment = data['best_moment'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    instagram = data['instagram'];
    name = data['name'];
    nickname = data['nickname'];
    phone = data['phone'];
    twitter = data['twitter'];
    d_o_b = data['d_o_b'];
    whats_next = data['whats_next'];
    where_you_live = data['where_you_live'];
    hobbies = data['hobbies'];
    my_dropline = data['my_dropline'];
    philosophy = data['philosophy'];
    worst_moment = data['worst_moment'];
  }

}