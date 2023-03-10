import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:wealthaccrue/models/holdings_model.dart';
import 'package:wealthaccrue/models/investor.dart';
import 'package:wealthaccrue/routers/router.gr.dart';
import '../providers/global_providers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BasicAccountPage extends ConsumerWidget {
  const BasicAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstName = ref.watch(firstNameStateProvider);
    final lastName = ref.watch(lastNameStateProvider);
    final userName = firstName + ' ' + lastName;

    return AutoTabsScaffold(
      routes: [
        AccountRouter(),
        CompareRouter(),
        CasesRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).colorScheme.background,
              blurRadius: 10,
            ),
          ],
        ),
        child: SalomonBottomBar(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              selectedColor: Colors.amberAccent,
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
              title: const Text('Home'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.blue[200],
              icon: const Icon(
                Icons.compare_arrows,
                size: 30,
              ),
              title: const Text('Compare'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.pinkAccent[100],
              icon: const Icon(
                Icons.cases_outlined,
                size: 30,
              ),
              title: const Text('Cases'),
            ),
          ],
        ),
      ),
    );
  }
}
