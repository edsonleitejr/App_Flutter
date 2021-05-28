import 'package:ds_master_detail/src/pages/product_detail_page.dart';
import 'package:ds_master_detail/src/pages/product_list_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Empresa',
      home: MyStatefulWidget(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: ProductListPage.routeName,
      routes: {
        ProductListPage.routeName: (context) => ProductListPage(),
        ProductDetailPage.routeName: (context) => ProductDetailPage(),
      },
    );
  }
}

/// Este é o widget com monitoração de estado que o aplicativo principal instancia.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// Esta é a classe privada State que acompanha MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final PageViewController = PageController();

  @override
  void dispose() {
    super.dispose();
    PageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //title: const Text('Edson'),
      //  ),
      body: PageView(
        controller: PageViewController,
        children: [
          ProductListPage(),
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: PageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: PageViewController?.page?.round() ?? 0,
              onTap: (index) {
                PageViewController.jumpToPage(index);
              },
              unselectedItemColor: Colors.blue,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.feedback),
                  label: 'Avisos',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'Vez',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_shipping),
                  label: 'Viagens',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.card_travel),
                  label: 'Minhas viagens',
                ),
              ],
              selectedItemColor: Colors.blue,
            );
          }),
    );
  }
}
