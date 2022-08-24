import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_telegram_second_try/svgpic.dart';
import 'text.dart';
import 'colors.dart';
import 'svgpic.dart';

class Settings extends StatelessWidget {
  Set<MenuRowData> menuRow = {
    MenuRowData(savedPic, 'Saved Messages'),
    MenuRowData(recentcallPic, 'Recent Calls'),
    MenuRowData(stickersPic, 'Stickers'),
  };
  Set<MenuRowData> menuRowTwo = {
    MenuRowData(notificationPic, 'Notifications and Sounds'),
    MenuRowData(privacyPic, 'Privacy and Security'),
    MenuRowData(dataPic, 'Data and Storage'),
    MenuRowData(appearancePic, 'Appearance'),
  };
  Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: unselectedColor,
        selectedItemColor: addAccount,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        selectedFontSize: 12,
        items: [
          BottomNavigationBarItem(icon: bottomContacts, label: 'Contacts'),
          BottomNavigationBarItem(icon: bottomCalls, label: 'Calls'),
          BottomNavigationBarItem(icon: bottomChats, label: 'Chats'),
          BottomNavigationBarItem(icon: bottomSettings, label: 'Settings'),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            const UserField(),
            Container(height: 35, color: backgroundScaff),
            const AccountMenu(),
            Container(height: 35, color: backgroundScaff),
            MenuWidget(menuRow: menuRow),
            Container(height: 35, color: backgroundScaff),
            MenuWidget(menuRow: menuRowTwo),
          ],
        ),
      ),
    );
  }
}

class MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;
  final Image? notif;

  const MenuWidgetRow({Key? key, required this.data, this.notif})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: borderColor))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
        child: Row(
          children: [
            data.image,
            const SizedBox(width: 15),
            Text(data.text, style: const TextStyle(fontSize: 17)),
            const Spacer(),
            Icon(Icons.chevron_right, color: number)
          ],
        ),
      ),
    );
  }
}

class MenuRowData {
  final SvgPicture image;
  final String text;

  MenuRowData(this.image, this.text);
}

class MenuWidget extends StatelessWidget {
  final Set<MenuRowData> menuRow;
  const MenuWidget({Key? key, required this.menuRow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: menuRow.map((e) => MenuWidgetRow(data: e)).toList(),
      ),
    );
  }
}

class AccountMenu extends StatelessWidget {
  const AccountMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: borderColor))),
            child: Row(
              children: [
                Image.asset("assets/images/Rectangle.png"),
                const SizedBox(width: 16),
                const Text('Jacob Design', style: TextStyle(fontSize: 17)),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: borderColor))),
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 13),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/plus.svg'),
                const SizedBox(width: 21.5),
                const Text('Add Account', style: TextStyle(fontSize: 17))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserField extends StatelessWidget {
  const UserField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: borderColor))),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/oval.png', width: 66, height: 66),
          const SizedBox(width: 13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyWidget(
                text: name,
                style: const TextStyle(fontSize: 19),
              ),
              MyWidget(
                text: userNumber,
                style: TextStyle(fontSize: 15, color: number),
              ),
              MyWidget(
                text: userName,
                style: TextStyle(fontSize: 15, color: number),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Icon(Icons.chevron_right, color: number),
          )
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final IconData? icon;
  const MyWidget({Key? key, required this.text, required this.style, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: style,
        ),
        Icon(
          icon,
          color: number,
        )
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35),
      width: 375,
      height: 142,
      child: Stack(
        children: [
          Positioned(
            top: 54,
            right: 154,
            child: Text(
              settings,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: 54,
            right: 16,
            child: Text(
              edit,
              style: TextStyle(fontSize: 17, color: editColor),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            width: 355,
            height: 36,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: searcContainercolor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/search.svg',
                      color: searcIconText),
                  const SizedBox(width: 7),
                  Text(search,
                      style: TextStyle(color: searcIconText, fontSize: 17))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
