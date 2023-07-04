class SyncMessageRequestEntity{
  int? msgId;
  SyncMessageRequestEntity({
   this.msgId,
});

  Map<String, dynamic> toJson() =>{
    "msgId": msgId,
  };
}

class CallRequestEntity{
  String? call_type;//voice or video
  String? to_token;
  String? to_name;
  String? to_avatar;
  String? to_id;

  CallRequestEntity({
   this.call_type,
   this.to_avatar,
   this.to_token,
   this.to_name,
   this.to_id
});
}