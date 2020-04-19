class BatchAStreamOne {

  String academicQualification;
  String almaMater;
  String autoBio;
  String bestMoment;
  String courseOfStudy;
  String dob;
  String email;
  String facebook;
  String graduationYear;
  String hobbies;
  String id;
  String image;
  String instagram;
  String linkedIn;
  String myDropline;
  String name;
  String nickname;
  String philosophy;
  String phone;
  String ppaAssignment;
  String cdsExecutive;
  String cdsExecutivePosition;
  String ppaLocation;
  String ppaName;
  String stateOfOrigin;
  String twitter;
  String whatsNext;
  String whereYouLive;
  String worstMoment;

  BatchAStreamOne.fromMap(Map<String, dynamic> data) {
    academicQualification = data['academic_qualification'];
    almaMater = data['alma_mater'];
    courseOfStudy = data['course_of_study'];
    graduationYear = data['graduation_year'];
    linkedIn = data['linkedin'];
    ppaAssignment = data['ppa_assignment'];
    ppaLocation = data['ppa_location'];
    cdsExecutive = data['cds_executive'];
    cdsExecutivePosition = data['cds_executive_position'];
    ppaName = data['ppa_name'];
    stateOfOrigin = data['state_of_origin'];
    id = data['id'];
    autoBio = data['autobio'];
    bestMoment = data['best_moment'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    instagram = data['instagram'];
    name = data['name'];
    nickname = data['nickname'];
    phone = data['phone'];
    twitter = data['twitter'];
    dob = data['d_o_b'];
    whatsNext = data['whats_next'];
    whereYouLive = data['where_you_live'];
    hobbies = data['hobbies'];
    myDropline = data['my_dropline'];
    philosophy = data['philosophy'];
    worstMoment = data['worst_moment'];
  }

}