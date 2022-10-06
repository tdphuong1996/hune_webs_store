import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hune_webs_store/feature/setting/view/branch_screen.dart';
import 'package:hune_webs_store/feature/setting/category/category_screen.dart';
import 'package:hune_webs_store/feature/setting/view/employee_screen.dart';
import 'components/side_menu.dart';
import 'constants.dart';
import 'feature/orde_temp/view/order_temp_sreen.dart';
import 'feature/revenue/view/detail_revenue_sreen.dart';
import 'feature/revenue/view/revenue_sreen.dart';
import 'feature/setting/view/menu_screen.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hune Store',
      routes: {
        Routes.DETAIL_REVENUE: (context) => const DetailRevenueScreen(),
        Routes.ORDER_TEMP: (context) => const OrderTempScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: const MyHomePage(title: 'Hune'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _widgetPage = const RevenueScreen();

  late int _indexSelect = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(child: SideMenu(_itemClick, _itemSetting)),
            Expanded(flex: 5, child: _widgetPage)
          ],
        ),
      ),
    );
  }

  void _itemClick(int index) {
    if (_indexSelect == index) return;
    if (index == 1) {
      Navigator.of(context).pushNamed(Routes.ORDER_TEMP);
      return;
    }
    setState(() {
      _indexSelect = index;
    });
  }

  void _itemSetting(SettingType settingType) {
    setState(() {
      switch (settingType) {
        case SettingType.CATEGORY:
          _widgetPage =  CategoryScreen();

          break;
        case SettingType.MENU:
          _widgetPage = const MenuScreen();

          break;
        case SettingType.EMPLOYEE:
          _widgetPage = const EmployeeScreen();

          break;
        case SettingType.BRANCH:
          _widgetPage = const BranchScreen();

          break;
      }
    });
  }
}
