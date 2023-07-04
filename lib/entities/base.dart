class BaseResponseEntity{
  int? code;
  String? msg;
  String? data;

  BaseResponseEntity({
    this.code,
    this.data,
    this.msg,
});
  factory BaseResponseEntity.fromJson(Map<String,dynamic> json) =>
  BaseResponseEntity(
      code: json["code"],
      data: json["data"],
      msg: json["msg"]
      );

  Map<String, dynamic> toJson() => {
    "counts": code,
    "msg": msg,
    "data": data,
  };
}