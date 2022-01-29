import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:firztair_next_generation/constant.dart';

class DetailScreen0 extends StatefulWidget {
  const DetailScreen0({Key key}) : super(key: key);

  @override
  _DetailScreen0State createState() => _DetailScreen0State();
}

class _DetailScreen0State extends State<DetailScreen0> {
  int current_step = 0;
  FlutterTts flutterTts = FlutterTts();
  Widget buildStepper() {
    return Stepper(
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
          title: Text("Step 1 : ใช้สารละลายล้างแผล",
              style: GoogleFonts.prompt(
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          content: Column(
            children: <Widget>[
              Image.network(
                'https://cdn0.iconfinder.com/data/icons/coronavirus-glyph-2/60/013_-_Use_Sanitiser-hand-sanitizer-gel-anti-bacterial-coronavirus-512.png',
                scale: 3,
                color: gradientStartColor,
              )
            ],
          ),
        ),
        Step(
          state: current_step > 1 ? StepState.complete : StepState.indexed,
          isActive: current_step >= 1,
          title: Text(
            'Step 2 : ทายาแก้ไฟไหม้หรือน้ำร้อนลวกให้ทั่วบาดแผล',
            style:
                GoogleFonts.prompt(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            children: <Widget>[
              Image.network(
                  "https://image.flaticon.com/icons/png/512/139/139594.png",
                  scale: 3,
                  color: gradientStartColor)
            ],
          ),
        ),
        Step(
            state: current_step > 2 ? StepState.complete : StepState.indexed,
            isActive: current_step >= 2,
            title: Text(
              "Step 3 : ปิดบาดแผลด้วยผ้ากอซเพื่อป้องกันฝุ่นละออง",
              style:
                  GoogleFonts.prompt(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            content: Column(
              children: <Widget>[
                Image.network(
                    "https://cdn-icons-png.flaticon.com/512/2755/2755095.png",
                    scale: 3,
                    color: gradientStartColor)
              ],
            )),
        Step(
          state: current_step > 3 ? StepState.complete : StepState.indexed,
          isActive: current_step >= 3,
          title: Text(
            "Step 4 : ติดพลาสเตอร์ทับให้เรียบร้อย",
            style:
                GoogleFonts.prompt(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            children: <Widget>[
              Image.network("http://cdn.onlinewebfonts.com/svg/img_493081.png",
                  scale: 5, color: gradientStartColor)
            ],
          ),
        ),
        Step(
          title: Text(
            "Step 5 : รีบน้ำผู้ป่วยส่งโรงพยาบาลในกรณีบาดแผลรุนแรง",
            style:
                GoogleFonts.prompt(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            children: <Widget>[
              Image.network(
                "https://cdn.iconscout.com/icon/free/png-256/ambulance-2080900-1757005.png",
                color: gradientStartColor,
              )
            ],
          ),
        ),
      ],
    );
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
                          "บาดแผลพุพอง",
                          style: GoogleFonts.prompt(
                            fontSize: 56,
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
                                "บาดแผลไฟไหม้น้ำร้อนลวกคือการบาดเจ็บบริเวณผิวหนังซึ่งส่วนใหญ่เกิดจากความร้อนทั้งความร้อนแห้งคือเปลวไฟวัสดุร้อนเช่นเตารีดเป็นต้นหรือความร้อนเปียกเช่นน้ำร้อนกาแฟร้อนเป็นต้นสาเหตุอื่นที่ทำให้บาดเจ็บบริเวณผิวหนังได้อีกเช่นสารเคมีกระแสไฟฟ้าและกัมมันตรังสีเป็นต้น");
                          },
                          icon: Icon(Icons.volume_up_sharp),
                          iconSize: 50,
                          color: kTextColor,
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "บาดแผลไฟไหม้น้ำร้อนลวก คือ การบาดเจ็บบริเวณผิวหนัง ซึ่งส่วนใหญ่เกิดจากความร้อน ทั้งความร้อนแห้งคือเปลวไฟ วัสดุร้อน เช่น เตารีด เป็นต้น หรือความร้อนเปียก เช่น น้ำร้อน กาแฟร้อน เป็นต้น สาเหตุอื่นที่ทำให้บาดเจ็บบริเวณผิวหนังได้อีก เช่น สารเคมี กระแสไฟฟ้า และกัมมันตรังสี เป็นต้น ",
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
                    ),
                    Text("อุปกรณ์",
                        style: GoogleFonts.prompt(
                            fontSize: 56,
                            color: kTextColor,
                            fontWeight: FontWeight.w900)),
                    Divider(
                      color: Colors.black38,
                    ),
                    SizedBox(height: 32),
                    Text(
                      "ชุดทำแผล ได้แก่ ปากคีบ ถ้วยใส่สารละลาย สำลี ผ้าก๊อส และพลาสเตอร์ปิดแผล\n สารละลาย ได้แก่ น้ำยาฆ่าเชื้อ และ น้ำเกลือล้างแผล\n แอลกอฮอล์ 70%\n เบตาดีน หรือ โปรวิดี ไอโอดีน\n",
                      style: GoogleFonts.prompt(
                          fontSize: 20,
                          color: primaryTextColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Divider(
                      color: Colors.black38,
                    ),
                    buildStepper()
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            right: 8,
            top: 20,
            child: Image.network(
              "https://cdn-icons-png.flaticon.com/512/130/130162.png",
              color: Color.fromRGBO(0, 0, 0, 0.5),
              scale: 2,
            )),
        Positioned(
            top: 60,
            left: 32,
            child: Text(
              "2",
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
            icon: Icon(Icons.arrow_back_ios))
      ]),
    ));
  }
}
