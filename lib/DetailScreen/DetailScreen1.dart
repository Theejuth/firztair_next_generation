import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:firztair_next_generation/constant.dart';

class DetailScreen1 extends StatefulWidget {
  const DetailScreen1({Key key}) : super(key: key);

  @override
  _DetailScreenState1 createState() => _DetailScreenState1();
}

class _DetailScreenState1 extends State<DetailScreen1> {
  int current_step = 0;
  FlutterTts flutterTts = FlutterTts();

  Widget buildStepper() {
    return Theme(
        data: ThemeData(accentColor: kTextColor),
        child: Stepper(
          currentStep: current_step,
          onStepCancel: () {
            setState(() {
              current_step -= 1;
            });
          },
          onStepContinue: () {
            setState(() {
              current_step += 1;
            });
          },
          onStepTapped: (int _currentStep) {
            setState(() {
              current_step = _currentStep;
            });
          },
          steps: <Step>[
            Step(
              state: current_step > 0 ? StepState.complete : StepState.indexed,
              isActive: current_step >= 0,
              title: Text(
                  "Step 1 : ให้ชำระล้างบาดแผลด้วยน้ำสบู่และน้ำสะอาด ถ้ามีเศษหิน ขี้ผง ทราย อยู่ในบาดแผลให้ใช้น้ำสะอาดล้างออกให้หมด",
                  style: GoogleFonts.prompt(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              content: Column(
                children: <Widget>[
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/512/2707/2707414.png',
                    scale: 2,
                    color: kTextColor,
                  )
                ],
              ),
            ),
            Step(
              state: current_step > 1 ? StepState.complete : StepState.indexed,
              isActive: current_step >= 1,
              title: Text(
                'Step 2 : ใช้ปากคีบสำลีชุบแอลกอฮอล์ 70% พอหมาดๆ เช็ดรอบๆ บาดแผลเพื่อฆ่าเชื้อโรครอบๆ',
                style: GoogleFonts.prompt(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              content: Column(
                children: <Widget>[
                  Text(
                    "ไม่ควรเช็ดลงบาดแผลโดยตรง เพราะจะทำให้ เจ็บแสบมาก เนื่องจากยังเป็นแผลสด",
                    style: GoogleFonts.prompt(fontSize: 18),
                  ),
                  Image.network(
                      "https://cdn-icons-png.flaticon.com/512/2916/2916964.png",
                      scale: 2,
                      color: kTextColor)
                ],
              ),
            ),
            Step(
              state: current_step > 2 ? StepState.complete : StepState.indexed,
              isActive: current_step >= 2,
              title: Text(
                "Step 3 : ใช้สำลีชุบเบตาดีนหรือโปรวิดี ไอโอดีน ใส่แผลสด ทาลงบาดแผล แล้วปล่อยทิ้งไว้โดยไม่ต้องปิดบาดแผล",
                style: GoogleFonts.prompt(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              content: Column(
                children: <Widget>[
                  Text(
                      "ยกเว้นบาดแผลที่เท้าซึ่งควรปิด ด้วยผ้าก๊อซสะอาด เพื่อป้องกันฝุ่นละออง",
                      style: GoogleFonts.prompt(fontSize: 18)),
                  Image.network(
                      "https://static.thenounproject.com/png/2427823-200.png",
                      color: kTextColor),
                ],
              ),
            ),
            Step(
              state: current_step > 3 ? StepState.complete : StepState.indexed,
              isActive: current_step >= 3,
              title: Text(
                "Step 4 : ระวังอย่าให้บาดแผลถูกน้ำ",
                style: GoogleFonts.prompt(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              content: Column(
                children: <Widget>[
                  Text(
                      "ไม่ควรแกะหรือเกาบาดแผลที่แห้งตกสะเก็ดแล้ว เพราะทำให้เลือดไหลอีก สะเก็ดแผลเหล่านั้นจะแห้งและหลุดออกเอง",
                      style: GoogleFonts.prompt(fontSize: 18)),
                  Image.network(
                    "https://cdn-icons-png.flaticon.com/512/588/588158.png",
                    scale: 3,
                    color: kTextColor,
                  )
                ],
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Stack(children: <Widget>[
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 300,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "บาดแผลถลอก",
                          style: GoogleFonts.prompt(
                            fontSize: 43,
                            color: kTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        IconButton(
                          onPressed: () async {
                            await flutterTts.setLanguage('th-TH');
                            await flutterTts.setSpeechRate(0.8);
                            await flutterTts.setVolume(1);
                            await flutterTts.setPitch(0.1);
                            flutterTts.speak(
                                "บาดแผลถลอกหมายถึงการเป็นบาดแผลที่เกิดจากการถูกขีดข่วนถูกถูหรือถูกครูดบาดแผลชนิดนี้จะตื้นเพียงแค่ผิวหนังชั้นนอกเท่านั้นและมีเลือดออกเล็กน้อยอันตรายของบาดแผลอยู่ที่การติดเชื้อบาดแผลถลอกที่พบได้เสมอคือการหกล้มเข่าถลอกดังนั้นเมื่อเกิดบาดแผลขึ้นต้องรีบปฐมพยาบาลเพื่อลดอาการเจ็บปวดและป้องกันไม่ให้แผลติดเชื้อ");
                          },
                          icon: Icon(Icons.volume_up_sharp),
                          iconSize: 50,
                          color: kTextColor,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "บาดแผลถลอกหมายถึงการเป็นบาดแผลที่เกิดจากการถูกขีดข่วนถูกถูหรือถูกครูดบาดแผลชนิดนี้จะตื้นเพียงแค่ผิวหนังชั้นนอกเท่านั้น และมีเลือดออกเล็กน้อย อันตรายของบาดแผลอยู่ที่การติดเชื้อ บาดแผลถลอกที่พบได้เสมอ คือ การหกล้ม เข่าถลอก ดังนั้นเมื่อเกิดบาดแผลขึ้นต้องรีบปฐมพยาบาล  เพื่อลดอาการเจ็บปวดและป้องกันไม่ให้แผลติดเชื้อ",
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.prompt(
                          fontSize: 20,
                          color: primaryTextColor,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Divider(
                      color: Colors.black38,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(
                  "Gallery",
                  style: GoogleFonts.prompt(
                      fontSize: 25,
                      color: kTextColor,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                height: 250,
                child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(
                              Images[index],
                              fit: BoxFit.cover,
                            ),
                          ));
                    }),
              ),
              buildStepper()
            ],
          ),
        ),
        Positioned(
            right: 30,
            top: 100,
            child: Image.network(
              "http://cdn.onlinewebfonts.com/svg/img_493081.png",
              color: Color.fromRGBO(0, 0, 0, 0.1),
              scale: 5,
            )),
        Positioned(
            top: 35,
            left: 30,
            child: Text(
              "3",
              style: TextStyle(
                  fontSize: 247,
                  color: Colors.grey.withOpacity(0.1),
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.left,
            )),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ]),
    ));
  }
}

List Images = [
  'https://media.istockphoto.com/photos/bruised-wound-injury-on-woman-knee-background-picture-id824815068?k=20&m=824815068&s=612x612&w=0&h=PaY_3O5N66xfBMTA3CyVU6EcEbO9_-BSqjpSToA9A6I=',
  'https://media.istockphoto.com/photos/wound-on-the-human-body-very-close-up-of-painful-wound-picture-id1207186762?k=20&m=1207186762&s=612x612&w=0&h=FDD_zy1S5LniuoVQUMfjEgEG12aEwmj1-f_UDky8Xbs=',
  'https://media.istockphoto.com/photos/bruised-wound-injury-on-woman-knee-background-picture-id646553472?k=20&m=646553472&s=170667a&w=0&h=sdMMn8rK5inu_3EB7oPI5vLMixMQDAhGPjOPulsbyz8=',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJP9oA0vp4i1hexl3IINF-TY_056J52g9i49nl2YvhrMtRM23Qr0SqYsgloJjLAOm6ORU&usqp=CAU',
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6c6IXvopIbBUsG1ONWZjoBx_5hsjaq7eUjIzMIXMfYUxVbuCu6w41lrP1j7ONWlqOUMU&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTR7MHssnb4G8-Ixi2XamD5X97ut3_Czh2x9p90COSyDygx6s6sB3aQ6RV9TZI2oYgEwFY&usqp=CAU"
];
