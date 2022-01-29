import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:firztair_next_generation/constant.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
          title: Text("Step 1 : ใช้สำลีเช็ดเลือด และกดห้ามเลือด",
              style: GoogleFonts.prompt(
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          content: Column(
            children: <Widget>[
              Image.network(
                'https://static.thenounproject.com/png/2427724-200.png',
                color: const Color.fromRGBO(110, 138, 250, 1),
              )
            ],
          ),
        ),
        Step(
          state: current_step > 1 ? StepState.complete : StepState.indexed,
          isActive: current_step >= 1,
          title: Text(
            'Step 2 : ใช้แอลกอฮอล์เช็ดทำความสะอาดรอบๆ แผล',
            style:
                GoogleFonts.prompt(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            children: <Widget>[
              Image.network(
                  "https://static.thenounproject.com/png/2427817-200.png",
                  color: const Color.fromRGBO(110, 138, 250, 1))
            ],
          ),
        ),
        Step(
            state: current_step > 2 ? StepState.complete : StepState.indexed,
            isActive: current_step >= 2,
            title: Text(
              "Step 3 : ใช้สำลีชุบเบตาดีน หรือ โปรวิดี ไอโอดีนใส่แผลสดทารอบๆ แผล",
              style:
                  GoogleFonts.prompt(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            content: Column(
              children: <Widget>[
                Image.network(
                    "https://static.thenounproject.com/png/2427823-200.png",
                    color: const Color.fromRGBO(110, 138, 250, 1))
              ],
            )),
        Step(
          state: current_step > 3 ? StepState.complete : StepState.indexed,
          isActive: current_step >= 3,
          title: Text(
            "Step 4 : ใช้ผ้าพันแผล หรือพลาสเตอร์ปิดแผล",
            style:
                GoogleFonts.prompt(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            children: <Widget>[
              Image.network(
                  "https://static.thenounproject.com/png/2427749-200.png",
                  color: const Color.fromRGBO(110, 138, 250, 1)),
            ],
          ),
        ),
        Step(
            state: current_step > 4 ? StepState.complete : StepState.indexed,
            isActive: current_step >= 4,
            title: Text(
              "Step 5 : รีบน้ำผู้ป่วยส่งโรงพยาบาลในกรณีบาดแผลรุนแรง",
              style:
                  GoogleFonts.prompt(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            content: Column(
              children: <Widget>[
                Image.network(
                  "https://cdn.iconscout.com/icon/free/png-256/ambulance-2080900-1757005.png",
                  color: Color.fromRGBO(110, 138, 250, 1),
                )
              ],
            ))
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
                            "บาดแผลตัด",
                            style: GoogleFonts.prompt(
                              textStyle: TextStyle(
                                fontSize: 48,
                                color: kTextColor,
                                fontWeight: FontWeight.w900,
                              ),
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
                                  "บาดแผลแยกหรือบาดแผลเปิดเป็นบาดแผลที่เกิดจากการฉีกขาดของผิวหนังหรือเนื้อเยื่อจากการถูกของมีคมบาดแทงกรีดหรือถูกวัตถุกระแทกแรงจนเกิดบาดแผลมองเห็นมีเลือดไหลออกมา");
                            },
                            icon: const Icon(Icons.volume_up_sharp),
                            color: kTextColor,
                            iconSize: 50,
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
                          "บาดแผลแยก หรือ บาดแผลเปิดเป็นบาดแผลที่เกิดจากการฉีกขาดของผิวหนังหรือเนื้อเยื่อจากการถูกของมีคมบาด แทง กรีด หรือถูกวัตถุกระแทกแรงจนเกิดบาดแผล  มองเห็นมีเลือดไหลออกมา   ",
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.prompt(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w500),
                          )),
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
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "อุปกรณ์",
                        style: GoogleFonts.prompt(
                            textStyle: TextStyle(
                                fontSize: 48, fontWeight: FontWeight.w900),
                            color: kTextColor),
                        textAlign: TextAlign.left,
                      ),
                      Divider(
                        color: Colors.black38,
                      ),
                      Text(
                        "ชุดทำแผล ได้แก่ ปากคีบ ถ้วยใส่สารละลาย สำลี ผ้าก๊อส และพลาสเตอร์ปิดแผล\n สารละลาย ได้แก่ น้ำยาฆ่าเชื้อ และ น้ำเกลือล้างแผล\n แอลกอฮอล์ 70%\n เบตาดีน หรือ โปรวิดี ไอโอดีน\n",
                        style: GoogleFonts.prompt(
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black38,
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
                      itemCount: 4,
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
                Divider(color: Colors.black38),
                buildStepper(),
              ],
            ),
          ),
          Positioned(
              right: 20,
              top: 20,
              child: Image.network(
                "https://image.flaticon.com/icons/png/512/31/31605.png",
                fit: BoxFit.cover,
                color: const Color.fromRGBO(255, 255, 255, 0.1),
                colorBlendMode: BlendMode.modulate,
                scale: 1.5,
              )),
          Positioned(
              top: 60,
              left: 32,
              child: Text(
                "1",
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
      ),
    );
  }
}

List Images = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiBcEQDLHYD8aZL6uBGjarzZoFffSSzJYtFfRViIAx1p6__Y71Uu-g0FA5wGDdFDEJ91U&usqp=CAU",
  "https://media.istockphoto.com/photos/hip-replacement-surgery-scar-picture-id168249627?k=20&m=168249627&s=170667a&w=0&h=jFJDe8DoiMJuv_8QUaSBc0gL76b_QlbDgrCQzZKA1iw=",
  "https://cdn.shopify.com/s/files/1/0315/1131/4570/files/scar-from-cut_1024x1024.jpg?v=1600929233",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnsz2ct4eGnW-MMVyFBOKs8WvT9zSMOiHJV7qNTZXXqDGEJ1oxD_DzcJTsiqlnrNI4270&usqp=CAU",
];
