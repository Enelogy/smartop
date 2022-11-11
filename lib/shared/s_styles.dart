import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



Row RowItem(String title, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    mainAxisSize: MainAxisSize.max,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        textAlign: TextAlign.start,
      ),
      Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            textAlign: TextAlign.end,
          ))
    ],
  );
}
Row RowItemdua(String title, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    mainAxisSize: MainAxisSize.max,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.start,
      ),
      Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.end,
          ))
    ],
  );
}


