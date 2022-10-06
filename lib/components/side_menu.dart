import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SettingType {
  CATEGORY,MENU,EMPLOYEE,BRANCH
}
class SideMenu extends StatelessWidget {
  final Function(int) itemClick;
  final Function(SettingType) itemClickSetting;

   const SideMenu(this.itemClick,this.itemClickSetting);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: const Text('Hune'),
          ),
          DrawerListTile(
              title: 'Doanh thu',
              iconData: Icons.list,
              press: () {
                itemClick.call(0);
              }),
          DrawerListTile(
              title: 'Tạm tính',
              iconData: Icons.temple_hindu,
              press: () {
                itemClick.call(1);
              }),
          DrawerListTile(
              title: 'Khuyến mãi',
              iconData: Icons.gif,
              press: () {
                itemClick.call(2);
              }),
          ExpansionTile(
              leading: const Icon(FontAwesomeIcons.gear),
              title: const Text('Cài đặt'),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: TextButton(
                        onPressed: () {
                          itemClickSetting.call(SettingType.CATEGORY);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [Text('Quản lý danh mục')],
                        ),
                      ),
                    ),
                    ListTile(
                      title: TextButton(
                        onPressed: () {
                          itemClickSetting.call(SettingType.MENU);

                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Quản lý menu'),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      title: TextButton(
                        onPressed: () {
                          itemClickSetting.call(SettingType.EMPLOYEE);

                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Quản lý nhân viên'),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      title: TextButton(
                        onPressed: () {
                          itemClickSetting.call(SettingType.BRANCH);

                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Quản lý chi nhánh'),
                          ],
                        ),
                      ),
                    ),

                  ],
                )
              ]),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.iconData,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
