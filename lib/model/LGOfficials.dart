class LGOfficials {

  String name;
  String nickname;
  String id;
  String hobbies;
  String phone;
  String twitter;
  String autobio;
  String d_o_b;
  String email;
  String image;
  String facebook;
  String philosophy;
  String state_of_origin;
  String inception_year;
  String position_enforcing;
  String academic_qualification;

  LGOfficials.fromMap(Map<String, dynamic> data) {
    academic_qualification = data['academic_qualification'];
    state_of_origin = data['state_of_origin'];
    id = data['id'];
    autobio = data['autobio'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    name = data['name'];
    nickname = data['nickname'];
    phone = data['phone'];
    twitter = data['twitter'];
    d_o_b = data['d_o_b'];
    hobbies = data['hobbies'];
    position_enforcing = data['position_enforcing'];
    inception_year = data['inception_year'];
    philosophy = data['philosophy'];
  }

}