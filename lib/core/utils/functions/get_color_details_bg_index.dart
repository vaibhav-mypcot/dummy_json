import 'package:flutter/material.dart';

LinearGradient getColorDetailsBgByIndex(int index) {
  final imgUrls = [
    const LinearGradient(
        colors: [Color(0xffDB6885), Color(0xff972239)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight),
    const LinearGradient(
        colors: [Color(0xffCC29C5), Color(0xffDB5555)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight),
    const LinearGradient(
        colors: [Color(0xff2991CC), Color(0xff2991CC)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight),
    const LinearGradient(
        colors: [Color(0xffCC9429), Color(0xffDB5555)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight),
    const LinearGradient(
        colors: [Color(0xff17749B), Color(0xff1BBA3E)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight),
    // 'assets/images/upcoming_contest_details/red_bg_details.png',
    // 'assets/images/upcoming_contest_details/pink_bg_details.png',
    // 'assets/images/upcoming_contest_details/blue_bg_details.png',
    // 'assets/images/upcoming_contest_details/orange_bg_details.png',
    // 'assets/images/upcoming_contest_details/green_bg_details.png',
  ];

  final imgIndex = index % imgUrls.length;

  return imgUrls[imgIndex];
}
