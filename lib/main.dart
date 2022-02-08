import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text("Tic-Tac-Toe"),),
          body: FirstScreen(),
        )
    );
  }

}

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstScreenState();
  }
}
class FirstScreenState extends State<FirstScreen> {
  List<String> value = ['', '', '', '', '', '', '', '', ''];
  int count_box_filled = 0;
  int x=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  //decoration: BoxDecoration(
                  //border: Border.symmetric(color: Colors.black)
                  width: 350.0,
                  height: 350.0,
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: List.generate(9, (index) {
                      return Center(
                        child: RaisedButton(
                          // elevation: 5.0,
                            onPressed: () {
                              action(index);
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                    value[index],
                                    style: TextStyle(
                                      fontSize: 40.0,
                                    )
                                ),
                              ),
                            )
                        ),
                      );
                    }),
                  ),
                )

            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                //width: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      elevation: 10.0,
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        reset_action();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }


  void reset_action() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        value[i] = '';
      }
    });
    count_box_filled = 0;
  }

  void action(index) {
    setState(() {
      if (x==0 && value[index]=='') {
        value[index] = 'O';
        count_box_filled++;
      }
      else if (x==1 && value[index]=='') {
        value[index]='X';
        count_box_filled++;
      }
      if (x==1) {
        x=0;
      }
      else if (x==0) {
        x=1;
      }
      check();
    });
  }

  void check() {
    //ROWS
    if(value[0]==value[1] && value[0]==value[2] && value[0]!='') {
      win(value[0]);
      reset_action();
    }
    if(value[3]==value[4] && value[3]==value[5] && value[3]!='') {
      win(value[3]);
      reset_action();
    }
    if(value[6]==value[7] && value[6]==value[8] && value[6]!='') {
      win(value[6]);
      reset_action();
    }
    //COLUMNS
    if(value[0]==value[3] && value[0]==value[6] && value[0]!='') {
      win(value[0]);
      reset_action();
    }
    if(value[1]==value[4] && value[1]==value[7] && value[1]!='') {
      win(value[1]);
      reset_action();
    }
    if(value[2]==value[5] && value[2]==value[8] && value[2]!='') {
      win(value[2]);
      reset_action();
    }
    //DIAGONALS
    if(value[0]==value[4] && value[0]==value[8] && value[0]!='') {
      win(value[0]);
      reset_action();
    }
    if(value[2]==value[4] && value[2]==value[6] && value[2]!='') {
      win(value[2]);
      reset_action();
    }
    else if(count_box_filled==9) {
      draw();
      reset_action();
    }
  }

  void win(String w) {
    var alert = AlertDialog(
      title: Text(
        "Player $w Wins!",
        style: TextStyle(
          fontSize: 40.0,
        ),
      ),
    );
    showDialog(context: context,
        builder: (BuildContext context) {
          return alert;
        }
    );
  }

  void draw() {
    var alert = AlertDialog(
        title: Text(
          "Draw!",
          style: TextStyle(
            fontSize: 40.0,
          ),
        )
    );
    showDialog(context: context,
        builder: (BuildContext context) {
          return alert;
        }
    );
  }
}