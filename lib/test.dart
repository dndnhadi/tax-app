import 'package:flutter/material.dart';

import 'component/component.dart';

class MyTest extends StatefulWidget {
  MyTest({
    this.initialCount = 2});


  @override
  State<MyTest> createState() => _MyTestState();
  final int initialCount;

}

class _MyTestState extends State<MyTest> {

  var resalt = 0.0;
  var task = 0.0;
  var total = 0.0;

  int fieldCount = 0;
  int nextIndex = 0;

   List<TextEditingController> controllers = <TextEditingController>[];

  List<Widget> _buildList() {
        int i;
       if (controllers.length < fieldCount) {
      for (i = controllers.length; i < fieldCount; i++) {
        controllers.add(TextEditingController());
      }
    }
    i = 0;

    return controllers.map<Widget>((TextEditingController controller) {
      int displayNumber = i + 1;
      i++;

      return Column(
        children: [
         SizedBox(height: 8.0,),
          TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          maxLength: 10,
          decoration: InputDecoration(
            border:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            labelText: "Item $displayNumber",
            counterText: "",
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  fieldCount--;
                  controllers.remove(controller);
                });
              },
            ),
          ),
          ),
        ],
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    final List<Widget> children = _buildList();
    children.add(
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed:(){
                    setState(() {
                      fieldCount++;
                    });
                  },
                  child: Text(
                    '+',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        backgroundColor: Colors.blue
                    ),

                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                fieldCount++;
              });
            },
            child:   Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               // FloatingActionButton(
               //    onPressed:(){
               //      setState(() {
               //        fieldCount++;
               //      });
               //    },
               //    child: Text(
               //      'add ',
               //      style: TextStyle(
               //          fontSize: 20,
               //          color: Colors.white,
               //          backgroundColor: Colors.blue
               //      ),
               //
               //    ),
               //  ),
              ],
            ),
          ),
          Padding(
    padding: const EdgeInsets.all(5.0),
    child:Column(
    children: [


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
        ],
      ),
    );
    return ListView(
      padding: EdgeInsets.all(10.0),
      shrinkWrap: true,
      children: children,
    );
  }

  @override
  void initState() {
    super.initState();
    fieldCount = widget.initialCount;
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  // @override
  // void didUpdateWidget(MyTest oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  int? handleCalclate() {
    setState(() {
      resalt =0.0;
      controllers.forEach((item) {
        resalt += item.text.isEmpty ? 0 : double.parse(item.text);
      });
      resalt = resalt;
      task = resalt * 0.09;
      total = resalt + task;
    });
    }


  void deleteCalclate(){
    setState(() {
      controllers.forEach((item) {
        item.text = '';
      });
      total =0;
      task =0 ;
      resalt = 0;
    });
  }


}


