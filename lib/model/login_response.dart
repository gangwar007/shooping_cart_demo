/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIsInVzZXIiOiJtb3JfMjMxNCIsImlhdCI6MTY3MjgxNDIzNn0.KrxeR7sRhaMFfHy8kDEx8QUMxw8tryV8-d_gN44ED5Q"

class LoginResponse {
  LoginResponse({
      this.token,});

  LoginResponse.fromJson(dynamic json) {
    token = json['token'];
  }
  String? token;
LoginResponse copyWith({  String? token,
}) => LoginResponse(  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }

}