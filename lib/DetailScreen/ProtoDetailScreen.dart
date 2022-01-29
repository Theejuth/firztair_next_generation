import 'package:flutter/material.dart';
import 'package:firztair_next_generation/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DetailScreen.dart';
import 'DetailScreen0.dart';
import 'DetailScreen1.dart';

class ProtDetail extends StatefulWidget {
  const ProtDetail({Key key}) : super(key: key);

  @override
  _ProtDetailState createState() => _ProtDetailState();
}

class _ProtDetailState extends State<ProtDetail> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Material(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios))),
          LessonContent(
            number: 1,
            position: "https://image.flaticon.com/icons/png/512/31/31605.png",
            title: "บาดแผลตัด",
            Colored: kBlueColor,
            location: DetailScreen(),
            Red: 110,
            Green: 138,
            Blue: 250,
          ),
          LessonContent(
              number: 2,
              position: "https://cdn-icons-png.flaticon.com/512/130/130162.png",
              title: "บาดแผลพุพอง",
              Colored: gradientStartColor,
              location: DetailScreen0(),
              Red: 0,
              Green: 80,
              Blue: 172),
          LessonContent(
            number: 3,
            position: "http://cdn.onlinewebfonts.com/svg/img_493081.png",
            title: "บาดแผลถลอก",
            Colored: kTextColor,
            location: DetailScreen1(),
            Red: 13,
            Green: 19,
            Blue: 51,
          ),
        ],
      ),
    );
  }
}

class LessonContent extends StatelessWidget {
  final int number;
  final int Red;
  final int Green;
  final int Blue;
  final String position;
  final String title;
  final Color Colored;
  final bool isDone;
  final Widget location;

  LessonContent(
      {Key key,
      this.number,
      this.position,
      this.title,
      this.Colored,
      this.location,
      this.isDone = false,
      this.Red,
      this.Green,
      this.Blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
        child: GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => location));
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 70),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 2,
            ),
            height: 160,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  height: 136,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colored,
                      boxShadow: [kDefaultShadow]),
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22)),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    height: 160,
                    width: 200,
                    child: Image.network(
                      position,
                      fit: BoxFit.cover,
                      color: Color.fromRGBO(Red, Green, Blue, 1),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                    height: 136,
                    width: size.width - 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Spacer(),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: Text(
                              title,
                              style: GoogleFonts.prompt(
                                  fontSize: 18, color: Colors.black),
                            )),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5,
                            vertical: kDefaultPadding / 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade400.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                            ),
                          ),
                          child: Text(
                            "$number",
                            style: Theme.of(context).textTheme.button,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
