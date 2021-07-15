import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:math_app/helpers/constants.dart';
import 'package:math_app/helpers/score_helper.dart';
import 'package:math_app/screens/second_grade/second_grade_sum_test.dart';
import 'package:math_app/screens/second_grade/second_grade_sum_test2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home.dart';
import 'second_grade_sub_test.dart';

class SecondGrade extends StatefulWidget {
  final int? score;
  final int? level;
  final String? method;
  const SecondGrade({Key? key, @required this.score, this.level, this.method})
      : super(key: key);
  @override
  _SecondGradeState createState() => _SecondGradeState();
}

class _SecondGradeState extends State<SecondGrade> {
  late int? _level = widget.level;
  late int? _score = widget.score;
  late String? _method = widget.method;
  late int _scoresuml1 = 0;
  late int _scoresuml2 = 0;
  late int _scoresubl1 = 0;
  Color scafbg = Color(0xff242b3e);
  Color btnprimary = Color(0xff30445c);
  Color appbar = Color(0xff2e435a);
  Color btntext = Color(0xffEFFFFA);
  Color apptext = Color(0xffF9F9F9);
  Future<void> saveScore() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    readScore();
    if (_method == Methods.sum) {
      if (_level == 2 && (_score! > _scoresuml2)) {
        await sharedPref.setInt('_scoresuml2', _score!);
        _scoresuml2 = _score!;
      }
      if (_level == 1 && (_score! > _scoresuml1)) {
        await sharedPref.setInt('_scoresuml1', _score!);
        _scoresuml1 = _score!;
      }
    }
    if (_method == Methods.sub && (_score! > _scoresubl1)) {
      await sharedPref.setInt('_scoresubl1', _score!);
      _scoresubl1 = _score!;
    }
  }

  Future<void> readScore() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    _scoresuml1 = await (sharedPref.getInt('_scoresuml1') ?? 0);
    _scoresuml2 = await (sharedPref.getInt('_scoresuml2') ?? 0);
    _scoresubl1 = await (sharedPref.getInt('_scoresubl1') ?? 0);
  }

  @override
  void initState() {
    super.initState();
    saveScore().whenComplete(() => setState(() {}));
    readScore().whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: appbar,
            foregroundColor: apptext,
            title: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "2",
                  style: TextStyle(
                      fontFamily: 'Trailer Park Girl',
                      color: Color(0xffe78230),
                      fontSize: 50),
                ),
                Center(child: Text("   İkinci Sınıf"))
              ],
            )),
          ),
          backgroundColor: scafbg,
          body: GridView.count(
              crossAxisCount: 2,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: btnprimary,
                        border: Border.all(color: btnprimary),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RatingBarIndicator(
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 3,
                          rating: scoreHelper(_scoresuml1),
                        ),
                        Text(
                          "${_scoresuml1}",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            "Seviye 1 Toplama",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondGradeSumTest(
                                          score: 0,
                                          wrong: 0,
                                        )));
                          },
                          child: Center(child: Text("Teste başla")),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffe78230),
                            textStyle: TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                        color: btnprimary,
                        border: Border.all(color: btnprimary),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RatingBarIndicator(
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 3,
                          rating: scoreHelper(_scoresuml2),
                        ),
                        Text(
                          "${_scoresuml2}",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            "Seviye 2 Toplama",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondGradeSumTest2(
                                          score: 0,
                                          wrong: 0,
                                        )));
                          },
                          child: Center(child: Text("Teste başla")),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffe78230),
                            textStyle: TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                        color: btnprimary,
                        border: Border.all(color: btnprimary),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RatingBarIndicator(
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 3,
                          rating: scoreHelper(_scoresubl1),
                        ),
                        Text(
                          "${_scoresubl1}",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            "Seviye 1 Çıkarma",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondGradeSubTest(
                                          score: 0,
                                          wrong: 0,
                                        )));
                          },
                          child: Center(child: Text("Teste başla")),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffe78230),
                            textStyle: TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    )),
              ]),
        ),
        onWillPop: _onWillPop);
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Ana menüye dön'),
            content: new Text('Sınıf seçme menüsüne yönlendirileceksiniz'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('Hayır'),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home())),
                child: new Text('Evet'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
