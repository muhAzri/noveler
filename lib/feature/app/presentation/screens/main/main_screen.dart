import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:noveler/feature/app/bloc/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:noveler/feature/bookmark/bloc/bloc/bookmark_bloc.dart';
import 'package:noveler/feature/bookmark/presentation/screens/bookmark_screen.dart';
import 'package:noveler/feature/discover/presentation/screens/discover_screen.dart';
import 'package:noveler/feature/profile/presentation/screens/profile_screen.dart';
import 'package:noveler/utils/styles.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final BottomNavBarCubit _bottomNavBarCubit =
      GetIt.instance<BottomNavBarCubit>();

  @override
  void initState() {
    super.initState();
    _bottomNavBarCubit.stream.listen((state) {
      setState(() {
        _currentIndex = state.index;
      });
    });
  }

  int _currentIndex = 0;

  void _setIndex(int index) {
    _bottomNavBarCubit.setIndex(index);
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const DiscoverScreen();
      case 1:
        return BlocProvider(
          create: (context) => BookmarkBloc(),
          child: const BookmarkScreen(),
        );
      case 2:
        return const ProfileScreen();
      default:
        return const DiscoverScreen();
    }
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: redColor,
      unselectedItemColor: blackColor,
      showUnselectedLabels: false,
      currentIndex: _bottomNavBarCubit.state.index,
      onTap: _setIndex,
      items: _bottomNavigationBarItems(),
    );
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.explore_rounded),
        label: 'Discover',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bookmark_rounded),
        label: 'Bookmarks',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_rounded),
        label: 'Profile',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      body: _buildBody(),
    );
  }
}
