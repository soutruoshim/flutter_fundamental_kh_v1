import 'package:flutter/material.dart';
import 'package:flutter_v2_v1_kh/page_detail_listview.dart';

import 'list_view_builder.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  late List<Widget> _pageList;

  final HomeScreen _homeScreen = HomeScreen();
  final PersonScreen _personScreen = PersonScreen();
  final MenuScreen _menuScreen = MenuScreen();

  @override
  void initState() {
    super.initState();
    _pageList = [_homeScreen, _personScreen, _menuScreen];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiple page"),
        actions: [
          IconButton(
              onPressed: () {
                menuScreenKey.currentState?.gotTop();
              },
              icon: Icon(Icons.keyboard_arrow_up))
        ],
      ),
      body: _buildBody,
      bottomNavigationBar: _buildBottomNavigationBar,
    );
  }

  PageController _scroller = PageController();
  int _currentIndex = 0;

  get _buildBody {
    return Container(
      alignment: Alignment.center,
      child: PageView(
        controller: _scroller,
        physics: NeverScrollableScrollPhysics(),
        children: _pageList,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget get _buildBottomNavigationBar {
    return BottomNavigationBar(
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.indigo,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _scroller.animateToPage(index,
                duration: Duration(microseconds: 200), curve: Curves.easeInOut);
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person,), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
        ]);
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.yellow,
        child: Text(
          "This is home screen",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.yellow,
        child: Text(
          "This is person screen",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

var menuScreenKey = GlobalKey<_MenuScreenState>();

class MenuScreen extends StatefulWidget {
  //const MenuScreen({super.key});
  final Key key = menuScreenKey;
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listView(),
    );
  }

  ScrollController _scrollController = ScrollController();
  Widget _listView() {
    return ListView.builder(
        controller: _scrollController,
        itemCount: 100,
        itemBuilder: (context, index) {
            return ListTile(
               leading: Icon(Icons.face),
               title: Text("Item #$index"),
            );
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  gotTop() {
    _scrollController.animateTo(0,
        duration: Duration(microseconds: 200), curve: Curves.easeInOut);
  }
}
