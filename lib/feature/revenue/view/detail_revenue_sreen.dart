
import 'package:flutter/material.dart';
import 'package:hune_webs_store/constants.dart';

class DetailRevenueScreen extends StatefulWidget {
  const DetailRevenueScreen({Key? key}) : super(key: key);

  @override
  State<DetailRevenueScreen> createState() => _RevenueScreenState();
}

class _RevenueScreenState extends State<DetailRevenueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text('Chi tiết'),
      ),
      body: Container(),
    );
  }
}
