import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const.dart';

Widget sharedTextField(
        {required textEditingController,
        required Function(String) validation,
        required String lable,
        required bool obsecure,
        Function()? sufIconFun,
        required IconData prefIcon}) =>
    TextFormField(
      controller: textEditingController,
      validator: (String) => validation(String!),
      obscureText: obsecure,
      decoration: InputDecoration(
        label: Text(lable),
        suffixIcon: IconButton(
            onPressed: () => sufIconFun!(),
            icon: Icon(obsecure ? Icons.visibility_off : Icons.visibility)),
        prefixIcon: Icon(prefIcon),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndRemove({context, widget}) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

void myToast({required var state, required toastState toastState}) =>
    Fluttertoast.showToast(
        msg: '$state',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 10,
        backgroundColor: toastColor(toastState),
        textColor: Colors.white,
        fontSize: 16.0);

enum toastState { Success, Warning, Error }

Color toastColor(toastState state) {
  Color? color;
  if (state == toastState.Success) {
    color = Colors.green;
  } else if (state == toastState.Warning) {
    color = Colors.amber;
  } else {
    color = Colors.red;
  }
  return color;
}

void showSnachBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}

Widget builtMyMessage(
        {required Color backgroundColor,
        required String msg,
        required String time,
        required String year,
        required}) =>
    Column(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding:
                const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 15),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32)),
            ),
            child: Text(
              msg,
              style: GoogleFonts.aBeeZee(
                fontSize: 15,
              ),
            ),
          ),
        ),
        Row(
mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        Text(time),
                        Text(year),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.access_time,
                  size: 19,
                )),
            Text(
              time,
              style: GoogleFonts.aBeeZee(
                fontSize: 13,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );

Widget builtFriendsMessage({
  required Color backgroundColor,
  required String msg,
  required String time,
  required String year,
}) =>
    Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding:
                const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 15),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32)),
            ),
            child: Text(
              msg,
              style: GoogleFonts.aBeeZee(
                fontSize: 15,
              ),
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        Text(time),
                        Text(year),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.access_time,
                  size: 19,
                )),
            Text(
              time,
              style: GoogleFonts.aBeeZee(
                fontSize: 13,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );

void scrollToObject(ScrollController scrollController) {
  scrollController.animateTo(
    0,
    curve: Curves.easeIn,
    duration: const Duration(milliseconds: 500),
  );
}
