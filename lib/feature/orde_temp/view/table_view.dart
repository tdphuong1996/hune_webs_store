import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TableView extends StatefulWidget {
  const TableView({Key? key}) : super(key: key);

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Đơn hàng online',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          },
          childCount: 1,
        )),
        SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bàn số ${index + 1}'),
                    const Text('100.000')
                  ],
                ),
              );
            }, childCount: 5),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0)),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Đơn hàng offline',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 4, bottom: 4, left: 10, right: 10),
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.filter),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Tất cả',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  )
                ],
              ),
            );
          },
          childCount: 1,
        )),
        SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bàn số ${index + 1}'),
                    const Text('100.000')
                  ],
                ),
              );
            }, childCount: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0)),
      ],
    );
  }
}
