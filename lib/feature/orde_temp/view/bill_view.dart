import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BillView extends StatefulWidget {
  const BillView({Key? key}) : super(key: key);

  @override
  State<BillView> createState() => _BillViewState();
}

class _BillViewState extends State<BillView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Thêm món')),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                             child: IconButton(icon: Icon(FontAwesomeIcons.trash), onPressed: () {  },),
                            ),
                            const SizedBox(width: 8,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text('Cafe',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                      color: Colors.amber
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.minus)),
                                      Text('10',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                      IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.plus)),

                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const Spacer(),
                            Text('100.000đ',style: TextStyle(fontSize: 16)),
                          ],
                        ),

                        const Divider()
                      ],
                    );
                  },
                ),
              ),
            ],
          )),
          const TextField(decoration: InputDecoration(label: Text('Ghi chú'))),
          Row(
            children: [
              Text('Tạm tính'),Spacer(),Text('10.000đ'),
            ],
          ),
          Row(
            children: [
              Text('Tạm tính'),Spacer(),Text('10.000đ'),
            ],
          ),
          Row(
            children: [
              Text('Tạm tính'),Spacer(),Text('10.000đ'),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Tổng cộng:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 4,
              ),
              const Text(
                '100.000đ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 16,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text('Thanh toán',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))
            ],
          )
        ],
      ),
    );
  }
}
