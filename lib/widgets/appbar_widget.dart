import 'package:flutter/material.dart';
import 'package:election_tracker/util/constants.dart';
import 'package:ionicons/ionicons.dart';

AppBar loginAppBar({String? title, context}) {
  return AppBar(
    backgroundColor: Constants.kPrimaryColor.withOpacity(.02),
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: IconButton(
        icon: const Icon(
          Icons.close,
          size: 30,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        color: Constants.kPrimaryColor.withOpacity(0.8),
      ),
    ),
    title: Text(
      title!,
      style: const TextStyle(
          fontFamily: " ", color: Colors.black54, fontSize: 18.0),
    ),
  );
}

Widget navIcon(
    {BuildContext? context,
    IconData? icon,
    Color? color,
    Color? textColor,
    Function()? route}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Container(
      color: color,
      width: 40,
      height: 40,
      child: Center(
        child: GestureDetector(
          child: Icon(
            icon!,
            color: textColor,
          ),
          onTap: route,
        ),
      ),
    ),
  );
}

listTile({String? label, String? title}) {
  return Column(
    children: <Widget>[
      Column(
        children: [
          Container(
              height: 60.0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          Text(
                            label!,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Color.fromRGBO(97, 90, 90, 10),
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Flexible(
                            child: Text(
                              title!,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Color.fromRGBO(97, 90, 90, 30),
                                fontFamily: 'raleway',
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
      const Divider(
        height: 1.0,
      ),
    ],
  );
}

listTileWithIcon({IconData? icon, String? title}) {
  return Column(
    children: <Widget>[
      Column(
        children: [
          Container(
              height: 60.0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            icon ?? Ionicons.file_tray,
                            size: 25,
                            color: Colors.black54,
                          ),
                          const SizedBox(width: 30.0),
                          Flexible(
                            child: Text(
                              title!,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Color.fromRGBO(97, 90, 90, 30),
                                fontFamily: 'raleway',
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
      const Divider(
        height: 1.0,
      ),
    ],
  );
}
