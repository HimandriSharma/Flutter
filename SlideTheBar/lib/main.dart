


import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SlideAndChange(),
  ));
}
class SlideAndChange extends StatefulWidget {
  @override
  _SlideAndChangeState createState() => _SlideAndChangeState();
}

class _SlideAndChangeState extends State<SlideAndChange> {
  var rating = 0.0;
  var mood = 'SAD';
  var emoticon = Icons.sentiment_very_dissatisfied;
  var here = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Slider Record'),
        backgroundColor: Colors.pinkAccent[100],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 30.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Mood',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 28.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Icon(emoticon,size: 100.0,color: here,),
                Slider(
                  value: rating,
                  max: 5.0,
                  min: 0.0,
                  divisions: 10,
                  onChanged: (newValue){
                    setState(() {
                      rating=newValue;
                      print(newValue);
                      if(newValue<=2 && newValue>0){
                        mood = 'SAD';
                        emoticon = Icons.sentiment_dissatisfied;
                        here = Colors.grey;
                      }
                      if(newValue<=4 && newValue>=2){
                        mood = 'NORMAL';
                        emoticon = Icons.sentiment_satisfied;
                        here = Colors.orange;
                      }
                      if(newValue<5 && newValue>=4){
                        mood = 'HAPPY';
                        emoticon = Icons.sentiment_very_satisfied;
                        here = Colors.green;
                      }
                      if(newValue==5){
                        mood = 'I LOVE YOU';
                        emoticon = Icons.favorite;
                        here = Colors.red;
                      }
                    });

                  },

                ),
                Text(mood,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

