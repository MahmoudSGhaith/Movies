import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/assets_manger.dart';
import 'package:movies/core/colors_manger.dart';
import 'package:movies/core/constants_manager.dart';
import 'package:movies/main_layout/browse/browse.dart';
import 'package:movies/main_layout/home/home.dart';
import 'package:movies/main_layout/profile/profile.dart';
import 'package:movies/main_layout/search/search.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  int genreIndex = 0;
  List<Widget> get tabs => [
    Home(genreIndex: genreIndex),
    const Search(),
    const Browse(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[currentIndex],
        bottomNavigationBar: buildBottomNavBar());
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: ColorsManger.grey,
      selectedItemColor: ColorsManger.yellow,
      unselectedItemColor: ColorsManger.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (newIndex) {
        currentIndex = newIndex;
        if (currentIndex == 0) {
          genreIndex = ((genreIndex +1) % ConstantsManager.categories.length);
        }
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(SvgIcons.unselectedHome),
          activeIcon: SvgPicture.asset(SvgIcons.selectedHome),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(SvgIcons.unselectedSearch),
          activeIcon: SvgPicture.asset(SvgIcons.selectedSearch),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(SvgIcons.unselectedBrowse),
          activeIcon: SvgPicture.asset(SvgIcons.selectedBrowse),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(SvgIcons.unselectedProfile),
          activeIcon: SvgPicture.asset(SvgIcons.selectedProfile),
          label: ""
        ),
      ],
    );
  }
}
