class BaseResponse {
  String? status;
  String? message;

  BaseResponse(this.status, this.message);

  void fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
