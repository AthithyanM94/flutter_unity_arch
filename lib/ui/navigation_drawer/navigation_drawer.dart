import 'package:flutter/material.dart';
import '../../res/app_context_extension.dart';
import '../../ui/navigation_drawer/navigation_action.dart';

class LumeOXNavigationDrawer extends StatelessWidget {
  final Function(NavigationAction) countryMenuClick;

  const LumeOXNavigationDrawer({required this.countryMenuClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                _createDrawerHeader(context),
                _createDrawerBodyItem(context,
                    icon: Icons.note_alt_outlined,
                    text: context.resources.strings!.shareQuoteNavItem,
                    onTap: countryMenuClick,
                    action: NavigationAction.shareQuote),
                // _createDrawerBodyItem(context,
                //     icon: Icons.language,
                //     text: context.resources.strings!.changeLanguageNavItem,
                //     onTap: countryMenuClick,
                //     action: NavigationAction.switchLanguage),
                _createDrawerBodyItem(context,
                    icon: Icons.logout,
                    text: context.resources.strings!.logoutNavItem,
                    onTap: countryMenuClick,
                    action: NavigationAction.logout),
                _expendedLanguageDrawerBody(context, onTap: countryMenuClick),
              ],
            ),
          ),
          const Divider(color: Colors.grey),
          //Drawer bottom view
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    child: ImageIcon(
                        AssetImage(context.resources.drawable.icMedium)),
                    onTap: () {
                      countryMenuClick(NavigationAction.medium);
                    },
                  ),
                  GestureDetector(
                    child: ImageIcon(
                        AssetImage(context.resources.drawable.icLinkedIn)),
                    onTap: () {
                      countryMenuClick(NavigationAction.linkedIn);
                    },
                  ),
                  GestureDetector(
                    child: ImageIcon(
                        AssetImage(context.resources.drawable.icGithub)),
                    onTap: () {
                      countryMenuClick(NavigationAction.github);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerHeader(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image:
                    AssetImage(context.resources.drawable.imgBgDrawerHeader))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: context.resources.color.colorAccent.withOpacity(0.75),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        context.resources.dimension.defaultMargin,
                        context.resources.dimension.verySmallMargin,
                        context.resources.dimension.verySmallMargin,
                        context.resources.dimension.verySmallMargin),
                    child: Text(
                      "nvhungkhtn@gmail.coms",
                      style: context.resources.style.drawerHeadingStyle,
                    ),
                  ))),
        ]));
  }

  Widget _createDrawerBodyItem(BuildContext context,
      {required IconData icon,
      required String text,
      required Function(NavigationAction) onTap,
      required NavigationAction action}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding:
                EdgeInsets.only(left: context.resources.dimension.smallMargin),
            child: Text(
              text,
              style: context.resources.style.drawerTextStyle,
            ),
          )
        ],
      ),
      onTap: () => onTap(action),
    );
  }

  Widget _expendedLanguageDrawerBody(BuildContext context, {required Function(NavigationAction) onTap}) {
    return ExpansionTile(
      //Transform used to remove space between title & icon
      title: Transform(
        transform: Matrix4.translationValues(-24, 0.0, 0.0),
        child: Text(context.resources.strings!.language, style: context.resources.style.drawerTextStyle,),
      ),
      leading: const Icon(Icons.list_rounded), //add icon
      childrenPadding: const EdgeInsets.only(left:34), //children padding
      children: [
        _createExpandDrawerChildBodyItem(context, text: context.resources.strings!.langEnglish, onTap: countryMenuClick, action: NavigationAction.englishLang),
        _createExpandDrawerChildBodyItem(context, text: context.resources.strings!.langHindi, onTap: countryMenuClick, action: NavigationAction.hindiLang),
      ],
    );
  }

  Widget _createExpandDrawerChildBodyItem(BuildContext context, {required String text, required Function(NavigationAction) onTap, required NavigationAction action}) {
    return ListTile(
      title: Text(text),
      onTap: () => onTap(action),
    );
  }
}
