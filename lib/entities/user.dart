class LoginRequestEntity{
  int? type;
  int? online;
  String? name;
  String? description;
  String? email;
  String? phone;
  String? avatar;
  String? open_id;

  LoginRequestEntity({
    this.name,
    this.type,
    this.email,
    this.avatar,
    this.description,
    this.online,
    this.open_id,
    this.phone,
});

  Map<String,dynamic> toJson() =>{
    "type":type,
    "description":description,
    "open_id":open_id,
    "avatar":avatar,
    "phone":phone,
    "email":email,
    "name":name,
    "online":online,
  };
}
class UserLoginResponseEntity {
  String? msg;
  int? code;
  UserItem? data;

  UserLoginResponseEntity({
    this.data,
    this.msg,
    this.code

  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: UserItem.fromJson(json["data"]),

      );
}
class UserItem{
  String? access_token;
  String? token;
  String? name;
  String? email;
  String? description;
  String? avatar;
  int? online;
  int? type;

  UserItem({
    this.access_token,
    this.token,
    this.name,
    this.email,
    this.description,
    this.avatar,
    this.online,
    this.type,
});

  factory UserItem.fromJson(Map<String, dynamic> json) =>
      UserItem(
        access_token:json["access_token"],
        token:json["token"],
        name:json["name"],
        email:json["email"],
        description:json["description"],
        avatar:json["avatar"],
        online:json["online"],
        type:json["type"],
      );

      Map<String, dynamic> toJson() =>{
        "access_token" : access_token,
        "token" : token,
        "name" : name,
        "email" : email,
        "description" : description,
        "avatar" : avatar,
        "online" : online,
        "type" : type,

  };
}

