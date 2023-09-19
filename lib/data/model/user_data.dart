import 'base_reponse.dart';

class UserData extends BaseResponse {
  int? userID;
  String? token;
  String? userName;
  int? loginTimeUTC;

  UserData({int? userID, String? token, String? userName, int? loginTimeUTC}) : super ("", "") {
    if (userID != null) {
      this.userID = userID;
    }
    if (token != null) {
      this.token = token;
    }
    if (userName != null) {
      this.userName = userName;
    }
    if (loginTimeUTC != null) {
      this.loginTimeUTC = loginTimeUTC;
    }
  }

  @override
  void fromJson(Map<String, dynamic> json)  {
    super.fromJson(json);
    userID = json['userID'];
    token = json['token'];
    userName = json['userName'];
    loginTimeUTC = json['loginTimeUTC'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['userID'] = userID;
    data['token'] = token;
    data['userName'] = userName;
    data['loginTimeUTC'] = loginTimeUTC;
    return data;
  }
}
