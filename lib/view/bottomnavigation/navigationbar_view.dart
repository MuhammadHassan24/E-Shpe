import 'package:animations/animations.dart';
import 'package:ecommerceapp/view/bottomnavigation/navigationbar_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NavigationBarView extends StatelessWidget {
  const NavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => NavigationBarModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: PageTransitionSwitcher(
              duration: const Duration(milliseconds: 350),
              reverse: viewModel.reverse,
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) {
                return SharedAxisTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.scaled,
                  child: child,
                );
              },
              child: PopScope(
                  canPop: viewModel.currentIndex == 0 ? true : false,
                  onPopInvokedWithResult: (didPop, result) {
                    if (viewModel.currentIndex != 0) {
                      viewModel.setIndex(0);
                    } else {
                      viewModel.setIndex(0);
                    }
                  },
                  child: viewModel.getView(viewModel.currentIndex)),
            ),
            bottomNavigationBar: Theme(
              data: ThemeData(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent),
              child: NavigationBar(
                height: 70,
                elevation: 0,
                indicatorColor: Colors.transparent,
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                selectedIndex: viewModel.currentIndex,
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home_rounded),
                      label: "Home"),
                  NavigationDestination(
                      selectedIcon: Icon(Icons.search_rounded),
                      icon: Icon(Icons.search_outlined),
                      label: "Search"),
                  NavigationDestination(
                      selectedIcon: Icon(Icons.favorite_rounded),
                      icon: Icon(Icons.favorite_border_outlined),
                      label: "Wishlist"),
                  NavigationDestination(
                      selectedIcon: Icon(Icons.person),
                      icon: Icon(Icons.person_outline),
                      label: "Account"),
                ],
                onDestinationSelected: (newIndex) {
                  viewModel.setIndex(newIndex);
                },
              ),
            ),
          );
        });
  }
}
