class UserData {
  String? password;
  String? username;

  UserData({this.password, this.username});

  UserData.fromJson(Map<String, dynamic> json) {
    password = json['Password'];
    username = json['Username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Password'] = password;
    data['Username'] = username;
    return data;
  }
}
