import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/prime.dart';
import 'package:untitled/values/colors.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ListView.builder(
          itemBuilder: (_,index){
            return Card(
              color: white,
              margin: const EdgeInsets.symmetric(vertical: 1),
              child: ListTile(
                title: Container(
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PostActions(icon: Prime.comment, index: 11,),
                    PostActions(icon: AntDesign.like, index: 11,),
                    PostActions(icon: Bx.repost, index: 11,),
                    PostActions(icon: Bx.share, index: 11,),
                ],),
                leading: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                      fit: BoxFit.scaleDown,
                        image: AssetImage('assets/images/img.png'))

                  ),
                ),
                //trailing: Icon(),
              ),
            );
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {},
          backgroundColor: primary600,
          elevation: 0,
          child: Iconify(MaterialSymbols.add,color: white,)),
    );
  }
}

class PostActions extends StatelessWidget {
  const PostActions({
    super.key,
    required this.icon,
    required this.index,
  });
  final String icon;
  final int index;
  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Iconify(icon,size:20.sp ,),
        Text(index.toString(),style: TextStyle(fontSize: 12.sp),)
      ],
    );
  }
}
