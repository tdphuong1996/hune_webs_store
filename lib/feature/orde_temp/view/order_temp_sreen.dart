import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hune_webs_store/constants.dart';
import 'package:hune_webs_store/feature/orde_temp/view/table_view.dart';
import 'package:hune_webs_store/routes.dart';

import 'bill_view.dart';

class OrderTempScreen extends StatefulWidget {
  const OrderTempScreen({Key? key}) : super(key: key);

  @override
  State<OrderTempScreen> createState() => _OrderTempScreenState();
}

class _OrderTempScreenState extends State<OrderTempScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạm tính'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child:Row(
          children: [
            Expanded(child:TableView() ,flex: 7,),
            VerticalDivider(thickness: 2,),
            Expanded(child:BillView() ,flex:3 ,)
          ],
        ),
      ),
    );
  }
}
