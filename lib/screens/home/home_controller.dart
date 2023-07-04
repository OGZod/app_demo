import 'package:flutter/cupertino.dart';
import 'package:untitled/entities/user.dart';

import '../../global.dart';

class HomeController{
  final BuildContext context;
  HomeController({
   required this.context
});
  UserItem userProfile = Global.storageService.getUserProfile();
  void init(){

  }
}
