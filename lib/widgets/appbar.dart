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
          : SizedBox(),
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
            visibleConditions: [Condition.equals(name: DESKTOP)],
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => {},
                    child: Text('Home'),
                  ),
                  TextButton(
                    onPressed: () => {},
                    child: Text('About'),
                  ),
                  TextButton(
                    onPressed: () => {},
                    child: Text('Contact'),
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
          visibleConditions: [Condition.largerThan(name: TABLET)],
          child: Container(
            margin: EdgeInsets.only(right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () => {}, child: Text('Register')),
                ElevatedButton(
                  onPressed: () => {},
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      elevation: 0),
                ),
              ],
            ),
          ),
        ),
        ResponsiveVisibility(
          visible: false,
          visibleConditions: [Condition.smallerThan(name: DESKTOP)],
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Home'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.info),
                        title: Text('About'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.contact_mail),
                        title: Text('Contact'),
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
  Size get preferredSize => Size.fromHeight(80);
}
