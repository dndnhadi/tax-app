import 'package:flutter/material.dart';

import 'component/component.dart';

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey _parentKey = GlobalKey();
  int countItems = 0;
  //late var textController;

  int fieldCount =0;
  var resalt = 0.0;
  var task = 0.0;
  var total = 0.0;

  List<TextEditingController> _controller = [];


  @override
  void initState() {
    super.initState();
   //  int i;
    for (int i = 0; i <= 20; i++) {
      _controller.add(TextEditingController());
    }
    // if (_controller.length < fieldCount) {
    //   for (i = _controller.length; i < fieldCount; i++) {
    //     _controller.add(TextEditingController());
    //   }
    // }
    // i=0;
    }




  @override
  Widget build(BuildContext context) {

    void showTextFields() {
      setState(() {
        countItems = countItems + 1;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Mama App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
             buildSizeBox(height: 20.0),

              buildSizeBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: showTextFields,
                        child: const Text('+')),
                  ),
                ],
              ),
              buildSizeBox(height: 5.0),
              (countItems > 0)
                  ? Flexible(
                child: ListView.separated(itemBuilder:
                    (context, index) =>
                    buildTextFormFild(
                      controller: _controller[index],
                      lable: 'Item ',),
                  separatorBuilder: (context, index) => SizedBox(height: 15.0,),
                  itemCount: countItems,
                  shrinkWrap: true,),
              )
                  : const SizedBox(),

              buildSizeBox(height: 10.0),

              buildButton(
                onPressed: () => handleCalclate(),
                buttonName: Text('Calculate', style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),),

              ),

              buildSizeBox(height: 10.0),
              buildCalcolateTextField(text: Text("Total Amount ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                resaltText: Text("${resalt.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              ),
              buildSizeBox(height: 10.0),
              buildCalcolateTextField(text: Text("Tax                   ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                resaltText: Text("${task.toStringAsFixed(2)}", style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold),),),

              buildSizeBox(height: 10.0),
              buildCalcolateTextField(text: Text("Total                ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                resaltText: Text("${total.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),),),

              buildSizeBox(height: 10.0),
              buildButton(buttonName: Text('Delete',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  onPressed: ()=>deleteCalclate(),
              ),


            ],
          ),
        ),
      ),
    );
  }


  int? handleCalclate() {
    setState(() {
      // for (TextEditingController item in _controller) {
      //   sumItems +=  item.text.isEmpty  ? 0 : double.parse(item.text )  ;
      // }


        resalt =0.0;
        _controller.forEach((item) {
          resalt += item.text.isEmpty ? 0 : double.parse(item.text);




        });

      resalt = resalt;




      print(resalt);
      task = resalt * 0.09;
      total = resalt + task;
    });
    //print(resalt.toStringAsFixed(2));
    // print(task.toStringAsFixed(2));
  }


void deleteCalclate(){
  setState(() {



    _controller.forEach((item) {

      item.text = '';
    });

    total =0;
    task =0 ;
    resalt = 0;
  });
}


      }

