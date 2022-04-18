import 'package:flutter/material.dart';

String regHtmlNoSpace(html) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  String parsedstring = html.replaceAll(exp, '');

  return parsedstring;
}

String regHtmlWithSpace(html) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  String parsedstring = html.replaceAll(exp, ' ');

  return replaceNbsp(parsedstring);
}

String replaceNbsp(str) {
  String cleanText = str.replaceAll('&nbsp;', ' ');
  return cleanText;
}
