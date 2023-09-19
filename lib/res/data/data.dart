import 'package:lume_ox_app/res/data/statistics_model.dart';
import 'package:lume_ox_app/res/data/xrbundle_model.dart';
import 'dart:ui';

List imageList = [
  {
    'id': 1,
    'path':
        'https://img.freepik.com/free-vector/sale-banner-with-product-description_1361-1333.jpg?w=2000'
  },
  {
    'id': 2,
    'path':
        'https://static.vecteezy.com/system/resources/thumbnails/006/795/097/small/sale-banner-or-poster-with-realistic-podium-in-orange-and-blue-color-business-illustration-free-vector.jpg'
  },
  {
    'id': 3,
    'path':
        'https://static.vecteezy.com/system/resources/previews/003/692/287/original/big-sale-discount-promotion-banner-template-with-blank-product-podium-scene-graphic-free-vector.jpg'
  },
];

const kLightBlue = Color(0xffEBF6FF);
const kDarkBlue = Color(0xff369FFF);
const kGreen = Color(0xff8AC53E);
const kOrange = Color(0xffFF993A);
const kYellow = Color(0xffFFD143);

final List<XRBundle> course = [
  XRBundle(
      text: "France",
      lessons: "35 Lessons",
      imageUrl: "assets/images/pic/img1.png",
      percent: 75,
      backImage: "assets/images/box/box1.png",
      color: kDarkBlue),
  XRBundle(
      text: "Portuguese",
      lessons: "30 Lessons",
      imageUrl: "assets/images/pic/img2.png",
      percent: 50,
      backImage: "assets/images/box/box2.png",
      color: kOrange),
  XRBundle(
      text: "Italian",
      lessons: "20 Lessons",
      imageUrl: "assets/images/pic/img3.png",
      percent: 25,
      backImage: "assets/images/box/box3.png",
      color: kGreen),
  XRBundle(
      text: "German",
      lessons: "40 Lessons",
      imageUrl: "assets/images/pic/img4.png",
      percent: 75,
      backImage: "assets/images/box/box4.png",
      color: kYellow),
];

final List<Statistics> statistics = [
  Statistics(
    title: "Course Completed",
    number: "02",
  ),
  Statistics(
    title: "Total Points Gained",
    number: "250",
  ),
  Statistics(
    title: "Course In Progress ",
    number: "03",
  ),
  Statistics(
    title: "Tasks \nFinished",
    number: "05",
  )
];
