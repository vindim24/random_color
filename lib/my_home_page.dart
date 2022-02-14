import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int r = 255;
  int g =255;
  int b = 255;
  double opacity = 1.0;

  TextEditingController rController = TextEditingController();
  TextEditingController gController = TextEditingController();
  TextEditingController bController = TextEditingController();

  @override
  void dispose(){
    rController.dispose();
    gController.dispose();
    bController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0)
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
        title: Text(
          "Exam",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromRGBO(r, g, b, opacity),
            fontWeight: FontWeight.w700,
            fontFamily: "Nunito"
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(r, g, b, opacity),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width/3,
              child: FloatingActionButton(
                child: const Text(
                    "Tap on me",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Nunito"
                ),
                ),
                onPressed: () => setRandomColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(color: Colors.white, width: 1),
                ),
              ),
            ),
            const SizedBox(height: 25,),
            Text(
              "R: $r, G: $g, B: $b",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "Nunito"
              ),
            ),
            SizedBox(height: 25,),
            SizedBox(
              width: MediaQuery.of(context).size.width/1.3,
              height: 40,
              child: TextField(
                onChanged: (r) {setState(() {int r = int.parse(rController.text);});},
                controller: rController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "R:",
                    hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w400,
                        fontFamily: "Nunito"
                    ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    )
                  )
                ),
              ),
            ),
            const SizedBox(height: 8,),
            SizedBox(
              width: MediaQuery.of(context).size.width/1.3,
              height: 40,
              child: TextField(
                controller: gController,
                decoration: InputDecoration(
                    hintText: "G:",
                    hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w400,
                        fontFamily: "Nunito"
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        )
                    )
                ),
              ),
            ),
            const SizedBox(height: 8,),
            SizedBox(
              width: MediaQuery.of(context).size.width/1.3,
              height: 40,
              child: TextField(
                controller: bController,
                decoration: InputDecoration(
                  hintText: "B:",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w400,
                    fontFamily: "Nunito"
                  ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        )
                    )
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width/4,
              height: 45,
              child: FloatingActionButton(
                child: const Text(
                  "Set",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Nunito"
                  ),
                ),
                onPressed: () => setColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(color: Colors.white, width: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

void setColor(){
    setState(() {
      if(int.parse(rController.text)<=255 && int.parse(rController.text)>=0 &&
         int.parse(gController.text)<=255 && int.parse(gController.text)>=0 &&
         int.parse(bController.text)<=255 && int.parse(bController.text)>=0){
        r = int.parse(rController.text);
        g = int.parse(gController.text);
        b = int.parse(bController.text);
      } else if (int.parse(rController.text)>255 || int.parse(rController.text)<0 ||
          int.parse(gController.text)>255 || int.parse(gController.text)<0 ||
          int.parse(bController.text)>255 || int.parse(bController.text)<0 ||
          rController.text.isEmpty || gController.text.isEmpty || bController.text == ""){
        rController.text = "255";
        gController.text = "255";
        bController.text = "255";
        r = 255;
        g = 255;
        b = 255;
      } else null;
    });
}

void setRandomColor(){
    setState(() {
      Random random = Random();
      r = random.nextInt(256);
      g = random.nextInt(256);
      b = random.nextInt(256);
    });
}
}
