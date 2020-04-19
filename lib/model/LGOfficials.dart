class LGOfficials {

  String name;
  String nickname;
  String id;
  String hobbies;
  String phone;
  String twitter;
  String autoBio;
  String dob;
  String email;
  String image;
  String facebook;
  String philosophy;
  String stateOfOrigin;
  String inceptionYear;
  String positionEnforcing;
  String academicQualification;

  LGOfficials.fromMap(Map<String, dynamic> data) {
    academicQualification = data['academic_qualification'];
    stateOfOrigin = data['state_of_origin'];
    id = data['id'];
    autoBio = data['autobio'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    name = data['name'];
    nickname = data['nickname'];
    phone = data['phone'];
    twitter = data['twitter'];
    dob = data['d_o_b'];
    hobbies = data['hobbies'];
    positionEnforcing = data['position_enforcing'];
    inceptionYear = data['inception_year'];
    philosophy = data['philosophy'];
  }

}