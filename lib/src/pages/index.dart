import 'package:ds_master_detail/src/pages/notification/index_page.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
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
    return MaterialApp(
      title: 'Empresa',
      home: Scaffold(
        body: PageView(
          controller: PageViewController,
          children: [
            NotificationPage(),
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
      ),
    );
  }
}
