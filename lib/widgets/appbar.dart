import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final bool? init;

  const Navbar({this.init = false, super.key});

  @override
  Widget build(BuildContext context) {
    Widget appBar = AppBar(
      scrolledUnderElevation: 25,
      toolbarHeight: 80,
      backgroundColor: Colors.white,
      leading: ResponsiveBreakpoints.of(context).between(PHONE, TABLET)
          ? null
          : const SizedBox(),
      leadingWidth:
          ResponsiveBreakpoints.of(context).between(PHONE, TABLET) ? 0 : 25,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Destinasi Pariwisata',
            style: TextStyle(
                fontSize: ResponsiveBreakpoints.of(context).smallerThan(MOBILE)
                    ? 14
                    : 20),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleConditions: const [Condition.equals(name: DESKTOP)],
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => {},
                    child: const Text('Home'),
                  ),
                  TextButton(
                    onPressed: () => {},
                    child: const Text('About'),
                  ),
                  TextButton(
                    onPressed: () => {},
                    child: const Text('Contact'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        ResponsiveVisibility(
          visible: false,
          visibleConditions: const [Condition.largerThan(name: TABLET)],
          child: Container(
            margin: const EdgeInsets.only(right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () => {}, child: const Text('Register')),
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      elevation: 0),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
        ResponsiveVisibility(
          visible: false,
          visibleConditions: const [Condition.smallerThan(name: DESKTOP)],
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.home),
                        title: const Text('Home'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.info),
                        title: const Text('About'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.contact_mail),
                        title: const Text('Contact'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );

    return init!
        ? appBar.animate().slideY(
              duration: 500.ms,
              curve: Curves.easeIn,
              begin: -1,
            )
        : appBar;
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
