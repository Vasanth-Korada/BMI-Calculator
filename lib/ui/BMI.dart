import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  Future TipsScreen(BuildContext context) {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new Screen2();
    }));
  }

  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();

  double weight = 0.0;
  double age = 0.0;
  double height = 0.0;
  double result;
  String advice = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton.extended(
        onPressed: () {
          TipsScreen(context);
        },
        elevation: 40.0,
        tooltip: "Tips For a Perfect BMI",
        backgroundColor: Colors.deepOrange,
        icon: Icon(Icons.wb_sunny),
        label: new Text("Tips"),
      ),
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        title: new Text(
          "BMI Calculator",
          style: new TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        elevation: 30.0,
        titleSpacing: 8.0,
        centerTitle: true,
      ),
      body: new Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                child: Image.asset(
                  'images/bmilogo.png',
                  fit: BoxFit.cover,
                ),
              ),
              new TextField(
                textInputAction: TextInputAction.next,
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Age",
                  icon: new Icon(Icons.person),
                  hintText: "E.G:32",
                ),
              ),
              new TextField(
                textInputAction: TextInputAction.next,
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Weight",
                  icon: new Icon(Icons.line_weight),
                  hintText: "IN KG'S",
                ),
              ),
              new TextField(
                textInputAction: TextInputAction.done,
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Height",
                  icon: new Icon(Icons.assessment),
                  hintText: "IN FEET",
                ),
              ),
              Padding(
                padding: new EdgeInsets.all(15.0),
                child: new Container(
                  height: 50.0,
                  width: 150.0,
                  child: new RaisedButton(
                    onPressed: () {
                      setState(() {
                        weight = double.parse(weightController.text);
                        age = double.parse(ageController.text);
                        height = double.parse(heightController.text);
                        if (weightController.text.isNotEmpty ||
                            weight > 0 && heightController.text.isNotEmpty ||
                            height > 0 && ageController.text.isNotEmpty ||
                            age > 0) {
                          result = calculateBmi(weight, height);
                        } else {}
                        adviceFun();
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.deepOrange,
                    textColor: Colors.white,
                    child: Text("Submit",
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.only(top: 0.0), child: new Divider()),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  "Your BMI is $result",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Padding(padding: const EdgeInsets.all(2.0), child: new Divider()),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  "$advice",
                  style: new TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              Padding(padding: const EdgeInsets.only(bottom: 8.0), child: new Divider()),
            ],
          ),
        ),
      ),
    );
  }

  double calculateBmi(double weight, double height) {
    setState(() {
      height = height * 0.3048;
      result = weight / (height * height);
    });
    return (double.parse(result.toStringAsFixed(2)));
  }

  void adviceFun() {
    if (result < 18.5) {
      advice = "UnderWeight";
    } else if (result >= 18.5 && result <= 24.9) {
      advice = "Normal";
    } else if (result >= 25.0 && result <= 29.9) {
      advice = "OverWeight";
    } else {
      advice = "Obese";
    }
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: Text(
          "Tips For Perfect BMI",
          style: new TextStyle(
              fontSize: 21.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Center(
        child: new ListView(
          padding: const EdgeInsets.only(left: 2.0),
          children: <Widget>[
            new Divider(
              height: 3.4,
              color: Colors.black12,
            ),
            new ListTile(
              title: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "•Exercise",
                  style: titleTile(),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Regular physical activity burns calories and builds muscle — both of which help you look and feel good and keep weight off. "
                    "Walking the family dog, cycling to school, "
                    "and doing other things that increase your daily level of "
                    "activity can all make a difference. "),
              ),
            ),
            new Divider(
              height: 3.4,
              color: Colors.black12,
            ),
            new ListTile(
              title: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "•Reduce screen time",
                  style: titleTile(),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "People who spend a lot of time in front of screens are more likely to be overweight."
                    " Set reasonable limits on the amount of time you spend watching TV, playing video games,"
                    " and using computers, phones, and tablets not related to school work."
                    " Be sure to set aside enough time to exercise every day and get enough sleep."),
              ),
            ),
            new Divider(
              height: 3.4,
              color: Colors.black12,
            ),
            new ListTile(
              title: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "•Watch out for portion distortion",
                  style: titleTile(),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Big portions pile on extra calories that cause weight gain. Sugary beverages, such as sodas, juice drinks, and sports drinks, "
                    "are empty calories that also contribute to obesity. "
                    "So choose smaller portions (or share restaurant portions) and go for water or low-fat milk instead of soda."),
              ),
            ),
            new Divider(
              height: 3.4,
              color: Colors.black12,
            ),
            new ListTile(
              title: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "•Avoid random snacking",
                  style: titleTile(),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Random snacking throughout the day, or grazing, is a major culprit for weight gain. "
                    "Limit eating to set mealtimes, and control portion sizes. "
                    "It helps to eliminate snack foods from your home so that the temptation isn’t there."),
              ),
            ),
            new Divider(
              height: 3.4,
              color: Colors.black12,
            ),
            new ListTile(
              title: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "•Don't skip breakfast",
                  style: titleTile(),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Breakfast kickstarts your metabolism, burning calories from the get-go and giving you energy to do more during the day. "
                    "People who skip breakfast often feel so hungry that they eat more later on. "
                    "So they get more calories than they would have if they ate breakfast. "
                    "In fact, people who skip breakfast tend to have higher BMIs than people who eat breakfast."),
              ),
            ),
            new Divider(
              height: 3.4,
              color: Colors.black12,
            ),
            new ListTile(
              title: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "•Eat healthy",
                  style: titleTile(),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Eating healthy food and cutting out junk sounds hard, but there are many"
                    " recipes out there that allow you to eat healthily without any hassle. "
                    "Increase fruit and vegetable intake, decrease harmful fats, "
                    "and you’ll be able to maintain your BMI while also enjoying more energy and better organ function."),
              ),
            ),
            new Divider(
              height: 3.4,
              color: Colors.black12,
            ),
            new ListTile(
              title: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "•Get—and stay—active",
                  style: titleTile(),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Exercise sounds unpleasant, but it’s a crucial part of maintaining a healthy BMI. "
                    "It doesn’t necessarily have to be miserable either."
                    " If you can find a sport or vigorous outdoor activity you enjoy doing,"
                    " it will be much easier to keep your body mass down."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle titleTile() {
  return new TextStyle(
      fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black);
}
