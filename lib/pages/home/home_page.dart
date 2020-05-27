import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:izwebacademy_app/pages/index.dart';
import 'package:izwebacademy_app/support/colors/app_colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController;
  int pageIndex = 1;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 1,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          MyCoursesPage(),
          BrowseCoursesPage(),
          SearchCoursePage(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: AppColors.bgColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_books,
            ),
            title: Text('My Learning'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            title: Text('Browse Courses'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            title: Text('Search'),
          ),
        ],
      ),
    );
  }
}
