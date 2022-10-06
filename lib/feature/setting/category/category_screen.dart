import 'package:flutter/material.dart';
import 'package:hune_webs_store/constants.dart';
import 'package:hune_webs_store/core/bloc/base_bloc.dart';
import 'package:hune_webs_store/core/bloc/state.dart';
import 'package:hune_webs_store/core/widget/base_widget.dart';

import 'bloc/category_bloc.dart';

class CategoryScreen extends BaseViewStateless {
  @override
  Widget buildView(BuildContext context, BaseState state) {
   return Scaffold(
      appBar: AppBar(title: Text('Quản lý danh mục'),backgroundColor: bgColor,),
      body: Row(
        children: const [
          Expanded(flex: 1, child: ListCategoryView()),
          VerticalDivider(),
          Expanded(flex: 1, child: AddCategoryView()),
        ],
      ),
    );
  }

  @override
  BaseBloc createBloc() {
    return CategoryBloc();
  }

}

class ListCategoryView extends StatelessWidget {
  const ListCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Danh sách danh mục',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const TextField(decoration: InputDecoration(
            label: Text('Tìm kiếm')
          )),
          Expanded(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      const Text('Cafe'),
                      const Spacer(),
                      Switch(value: true, onChanged: (bo) => {})
                    ],
                  ),
                  const Divider()
                ],
              );
            },
          ))
        ],
      ),
    );
  }
}

class AddCategoryView extends StatefulWidget {
  const AddCategoryView({Key? key}) : super(key: key);

  @override
  State<AddCategoryView> createState() => _AddCategoryViewState();
}

class _AddCategoryViewState extends State<AddCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Thêm danh mục',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextField(
            decoration: InputDecoration(label: Text('Tên danh mục')),
          ),
          SizedBox(height: 16,),
          ElevatedButton(onPressed: () {}, child: Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10,left: 16,right: 16),
            child: const Text('Thêm',style: TextStyle(fontSize: 16),),
          ))
        ],
      ),
    );
  }
}
