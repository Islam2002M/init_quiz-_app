import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
  
class _HomePageState extends State<HomePage> {
      int questionIndex=0;
      bool showResultMessage=false;
      List <Map<String,dynamic>> questionsWithAnswers=[
        {
          'question':'What is your favourate sport?',
          'answers':[
            'Football',
            'Tenni',
            'Basketball',
            'Vollyball',

          ],  
        },
          
          {
          'question':'What is your favourate color?',
          'answers':[
            'Red',
            'Green',
            'Blue',
            'Yellow',

          ],
        },
        {
          'question':'What is your favourate animal?',
          'answers':[
            'lion',
            'cat',
            'Dog',
            'Zebra',

          ],
        },
      ];
      void resetQuiz()
      {
        setState(() {
          questionIndex=0;
          showResultMessage=false;
        });
      }
      @override
      Widget build(BuildContext context){
        final questionsWithAnswer=questionsWithAnswers[questionIndex];
        return Scaffold(
          appBar:AppBar(
            title:Text("Home Page"),
            leading:Icon(Icons.menu),
          ),
          body:Center(
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if(showResultMessage==false) ...[
                    Text(questionsWithAnswer['question'],
                    style:TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )
                    ),
                      SizedBox(height: 16.0,),
                    for(int i=0;i<questionsWithAnswer['answers'].length;i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom:12.0),
                      child: SizedBox(
                        width:double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: (){
                              setState(() {
                                  if(questionIndex<questionsWithAnswers.length-1){
                                        questionIndex++;
                                  }
                                  else{
                                        showResultMessage=true;
                                      }
                                  });
                          }, 
                          child: Text(questionsWithAnswer['answers'][i]),
                          ),
                      ),
                    ),
                  ],
                  if(showResultMessage==true) ...[
                      Text("Congrutlation",style:TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ) ,
                      ),
                      SizedBox(height: 8.0,),
                      Text("your score is : ${questionIndex+1}/${questionsWithAnswers.length}",
                      style:TextStyle(
                        fontSize: 20,
                      ),
                      ),
                      TextButton(onPressed: resetQuiz
                      , child: Text('Reset quiz'),
                      ),
                  ],
                ],
                
              ),
            ),
          ),
        );
        
      }
      }