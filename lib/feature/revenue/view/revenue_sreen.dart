
import 'package:flutter/material.dart';
import 'package:hune_webs_store/constants.dart';
import 'package:hune_webs_store/routes.dart';

class RevenueScreen extends StatefulWidget {
  const RevenueScreen({Key? key}) : super(key: key);

  @override
  State<RevenueScreen> createState() => _RevenueScreenState();
}

class _RevenueScreenState extends State<RevenueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text('Doanh thu'),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () { Navigator.of(context).pushNamed(Routes.DETAIL_REVENUE); },
            child:Text('Chi tiết') ,
          ),
        ),
      ),
    );
  }
}
