

import 'package:flutter/material.dart';


class SelectView extends StatelessWidget {
  const SelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Một chiều'),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                title: Text('Hai chiều'),
                onTap: () => Navigator.of(context).pop(),
              ),

            ],
          ),
        ));
  }
}
