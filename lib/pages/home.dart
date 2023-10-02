import 'package:cocktail_db/blocs/home_bloc.dart';
import 'package:cocktail_db/constants/strings.dart';
import 'package:cocktail_db/pages/category_page.dart';
import 'package:cocktail_db/pages/cocktail_page.dart';
import 'package:cocktail_db/pages/favourite_page.dart';
import 'package:cocktail_db/pages/ingredients_page.dart';
import 'package:cocktail_db/pages/playground_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
      child: Consumer<HomeBloc>(
        builder: (context, bloc, child) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: PageView(
              controller: bloc.pageController,
              allowImplicitScrolling: false,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                CocktailPage(),
                FavouritePage(),
                // PlaygroundPage(),
                IngredientsPage(),
                CategoryPage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: bloc.selectedIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              onTap: (value) {
                bloc.changeIndex(value);
              },
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.wine_bar,
                    ),
                    label: COCKTAILS),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: FAVOURITE),
                BottomNavigationBarItem(
                    icon: Icon(Icons.icecream), label: INGREDIENTS),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: CATEGORY),
              ]),
        ),
      ),
    );
  }
}
