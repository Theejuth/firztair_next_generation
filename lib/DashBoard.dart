import 'package:firztair_next_generation/DetailScreen/Drawer.dart/NavigationDrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DetailScreen/DetailScreen.dart';
import 'DetailScreen/DetailScreen0.dart';
import 'DetailScreen/DetailScreen1.dart';
import 'constant.dart';

const kShadowColor = Color(0xFFE6E6E6);
const kBlueLightColor = Color(0xFFC7B8F5);

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(50, 75, 205, 0.9),
              image: DecorationImage(
                alignment: Alignment.bottomLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 70,
                      decoration: BoxDecoration(),
                    ),
                  ),
                  Text("ยินดีต้อนรับเข้าสู่ \nFirztAir",
                      style: GoogleFonts.mitr(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "บาดแผลตัด",
                          Src:
                              "https://cdn0.iconfinder.com/data/icons/medical-healthcare-vol-2-1/512/injury_wound_medical_care-512.png",
                          Colored_begin: 0xFFFFCC80,
                          Colored_end: 0xFFE65100,
                          scale: 1,
                          red: 255,
                          green: 242,
                          blue: 0,
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const DetailScreen();
                            }));
                          },
                        ),
                        CategoryCard(
                          title: "บาดแผลพุพอง",
                          Src:
                              "https://cdn-icons-png.flaticon.com/512/130/130162.png",
                          Colored_begin: 0xFF4DB6AC,
                          Colored_end: 0xFF004D40,
                          scale: 1,
                          red: 166,
                          green: 255,
                          blue: 158,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const DetailScreen0();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "บาดแผลถลอก",
                          Src:
                              "http://cdn.onlinewebfonts.com/svg/img_493081.png",
                          Colored_begin: 0xFF9FA8DA,
                          Colored_end: 0xFF1A237E,
                          scale: 10,
                          red: 158,
                          green: 198,
                          blue: 255,
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const DetailScreen1();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "การพยุงชีพ",
                          Src:
                              "http://cdn.onlinewebfonts.com/svg/img_492288.png",
                          Colored_begin: 0xFFF06292,
                          Colored_end: 0xFF880E4F,
                          scale: 8,
                          red: 223,
                          green: 135,
                          blue: 255,
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String Src;
  final String title;
  final Function press;
  final int Colored_begin;
  final int Colored_end;
  final int red;
  final int green;
  final int blue;
  final double scale;
  const CategoryCard({
    Key key,
    this.Src,
    this.title,
    this.press,
    this.Colored_begin,
    this.Colored_end,
    this.red,
    this.green,
    this.blue,
    this.scale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [Color(Colored_begin), Color(Colored_end)]),
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Image.network(
                    Src,
                    color: Color.fromRGBO(red, green, blue, 0.5),
                    scale: scale,
                  ),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.prompt(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text("Meditation", style: GoogleFonts.prompt(fontSize: 15)),
                    SizedBox(height: 10),
                    Text(
                      "3-10 MIN Course",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "Live happier and healthier by learning the fundamentals of meditation and mindfulness",
                      ),
                    ),
                    SizedBox(
                      width: size.width * .5, // it just take the 50% width
                      child: SearchBar(),
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SeassionCard(
                          seassionNum: 1,
                          isDone: true,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 2,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 3,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 4,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 5,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 6,
                          press: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Meditation",
                      style: GoogleFonts.prompt(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/icons/Meditation_women_small.svg",
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Basic 2", style: GoogleFonts.prompt()),
                                Text("Start your deepen you practice")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icons/Lock.svg"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29.5),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          icon: SvgPicture.asset("assets/icons/search.svg"),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;
  const SeassionCard({
    Key key,
    this.seassionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Session $seassionNum",
                      style: GoogleFonts.prompt(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
