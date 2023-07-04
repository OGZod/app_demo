import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:untitled/values/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primary600,
        elevation: 0,
        child: Iconify(
          MaterialSymbols.add,
          color: white,
        ),
      ),
    );
  }
}
