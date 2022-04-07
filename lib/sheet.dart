// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_shortcuts/keyboard_shortcuts.dart';

typedef void MapCallback(Map val);
typedef void StringCallback(String val);

class SheetRow extends StatefulWidget {


int rowLength;
int length;
final MapCallback callback;

  List<double> widthValues ;
  List<String> titles ;
  List<List<String>> suggestions ;
TextStyle headTextStyle;
TextStyle cellTextStyle;
 SheetRow(
   {
 
    this.rowLength,
    this.length,
    this.widthValues,
    this.callback,
    this.titles,
    this.suggestions,
    this.headTextStyle,
    this.cellTextStyle,
   }
 );
   
  @override
  State<SheetRow> createState() => _SheetRowState();
}

class _SheetRowState extends State<SheetRow> {
  List<FocusNode> focusNodes = new List();
  List<TextEditingController> textEditingControllers = new List();
  List<bool> enableEditList = new List();
Map data={};
String key;
String value;





@override
  void initState() {
    // TODO: implement initState
    for(int i=0;i<widget.length;i++){
      focusNodes.add(FocusNode());
      textEditingControllers.add(TextEditingController());
      enableEditList.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  data[key]=value;
  data.remove(null);
  widget.callback(data);
    return Scaffold(


          body: SingleChildScrollView(
                      child: Column(
              children: [
                  Container(
  width:MediaQuery.of(context).size.width / 1,
  child:   InkWell(
   
        child: Align(
                alignment: Alignment.topCenter,
                      child: GridView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.rowLength,
                 gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: widget.rowLength,
                  crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: ((MediaQuery.of(context).size.height/180)),
),
                                        itemBuilder: (context, i) {
                    return Center(
                      child:                 Text('${(i-((i/widget.rowLength).floor()*(widget.rowLength))+1)}  ${widget.titles[(i-((i/widget.rowLength).floor()*(widget.rowLength)))-((((i-((i/widget.rowLength).floor()*(widget.rowLength)))/widget.rowLength).floor())*widget.rowLength)]}',style: widget.headTextStyle,
 
                    ));
                  }),
        ),
  ),
),
             


                Container(
  width:MediaQuery.of(context).size.width / 1,
  child:   InkWell(
   
        child: Align(
                alignment: Alignment.topCenter,
                      child: GridView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.length,
                 gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: widget.rowLength,
                  crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: ((MediaQuery.of(context).size.height/180)),
),
                                        itemBuilder: (context, i) {
                    return Center(
                      child: SheetCell(
 textEditingController: textEditingControllers[i],
                   focusNode: focusNodes[i],
                   editble: enableEditList,
                   rowLength: widget.rowLength,
                   length: widget.length,
                   focusNodes:focusNodes,
                   cellTextStyle:widget.cellTextStyle,
                   headTextStyle:widget.headTextStyle,
                   index:i,
                   suggestions: widget.suggestions[(i-((i/widget.rowLength).floor()*(widget.rowLength)))],
                   titles:widget.titles,
                   width: widget.widthValues[(i-((i/widget.rowLength).floor()*(widget.rowLength)))],
                   callbackkey:(val1) => setState(() => key = val1),
                   callbackValue:(val2) => setState(() => value = val2),
                  
                      ),
                    );
                  }),
        ),
  ),
),
              ],
            ),
          ),
    );
  }
}




class SheetCell extends StatefulWidget {



TextEditingController textEditingController;
FocusNode focusNode;
int rowLength;
double width;
int length;
int index;
List<FocusNode> focusNodes;
List<bool> editble;
List<String> titles;
List<String> suggestions;
final StringCallback callbackkey;
final StringCallback callbackValue;
TextStyle headTextStyle;
TextStyle cellTextStyle;

 SheetCell(
   {
    this.editble,
    this.textEditingController,
    this.focusNode,
    this.rowLength,
    this.width,
    this.focusNodes,
    this.index,
    this.headTextStyle,
    this.cellTextStyle,
    this.length,
    this.titles,    
    this.suggestions,
    this.callbackkey,
    this.callbackValue,
    
   }
      );




  @override
  State<SheetCell> createState() => _SheetCellState();
}

class _SheetCellState extends State<SheetCell> {
String hint;
 
  @override
  Widget build(BuildContext context) {
    // if(widget.focusNode.hasFocus){
    // print(widget.focusNode.hasFocus);
    // FocusScope.of(context).requestFocus(focusNodeChild);
    
    // }
    // print('${widget.focusNode.hasFocus} aa ${widget.index} ${widget.isFinish}');

    return Container(
      // color: Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: (){
           if(hint!=null){
              widget.textEditingController.text=hint;
  widget.callbackkey("${widget.titles[widget.index-(((widget.index/widget.rowLength).floor())*widget.rowLength)]}-${(widget.index/widget.rowLength).floor()}");
  widget.callbackValue("${widget.textEditingController.text}");
  hint=null;
           }
           else{
              setState(() {
                if(hint==null){
            widget.editble[widget.index]=!widget.editble[widget.index];
                }
            });
           }
          },
                child: Container(
                  color:widget.editble[widget.index]?Colors.greenAccent[100]:Colors.grey[200] ,
            width: widget.width,
            height: MediaQuery.of(context).size.height/20,
            child:KeyBoardShortcuts(


                  keysToPress: {LogicalKeyboardKey.arrowDown},

                  onKeysPressed: () {

           try{
                if( widget.focusNode.hasFocus&&!(widget.editble[widget.index])){
                  FocusScope.of(context).requestFocus(widget.focusNodes[widget.index+widget.rowLength]);

                  setState(() {
                  
                });
                }
                  }
                  catch(e){}
          } ,
          
                        child:KeyBoardShortcuts(


                    keysToPress: {LogicalKeyboardKey.arrowUp},

                    onKeysPressed: () {

           try{
                  if( widget.focusNode.hasFocus&&!(widget.editble[widget.index])){
                  FocusScope.of(context).requestFocus(widget.focusNodes[widget.index-widget.rowLength]);

                    setState(() {
                    
                  });
                  }
                    }
                    catch(e){}
          } ,
          
                          child: KeyBoardShortcuts(


                    keysToPress: {LogicalKeyboardKey.arrowUp},

                    onKeysPressed: () {

           try{
                  if( widget.focusNode.hasFocus&&!(widget.editble[widget.index])){
                  FocusScope.of(context).requestFocus(widget.focusNodes[widget.index-widget.rowLength]);

                    setState(() {
                    
                  });
                  }
                    }
                    catch(e){}
          } ,
          
                            child: KeyBoardShortcuts(


                      keysToPress: {LogicalKeyboardKey.arrowLeft},

                      onKeysPressed: () {

           try{
                    if( widget.focusNode.hasFocus&&!(widget.editble[widget.index])){
                    FocusScope.of(context).requestFocus(widget.focusNodes[widget.index-1]);

                      setState(() {
                      
                    });
                    }
                      }
                      catch(e){}
          } ,
          
                            child: KeyBoardShortcuts(


                      keysToPress: {LogicalKeyboardKey.arrowRight},

                      onKeysPressed: () {

           try{
                    if( widget.focusNode.hasFocus&&!(widget.editble[widget.index])){
                    FocusScope.of(context).requestFocus(widget.focusNodes[widget.index+1]);

                      setState(() {
                      
                    });
                    }
                      }
                      catch(e){}
          } ,
          
          child:  Stack(
                          children: [

                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                child: Text(hint!=null?hint:'',style: TextStyle(fontSize: MediaQuery.of(context).size.height /
                                            55,color: Colors.grey),))),
              TextField(

                    onChanged: (text){
                      if(text==''){
                        setState(() {
                      hint=null;
                          
                        });

                      }
                      else{
                      hint=null;
                          //  text
                                // print('${widget.index} aa ${widget.rowLength} ${(widget.index/widget.rowLength)} ${(widget.index/widget.rowLength).floor()}');
  for(int i=0;i<widget.suggestions.length;i++){
    if(widget.suggestions[i].toString()=='$text'){
   hint=null;

    }
    else if(widget.suggestions[i].toString().toLowerCase().contains('$text')){
      hint=widget.suggestions[i];
    }
  }
  widget.callbackkey("${widget.titles[widget.index-(((widget.index/widget.rowLength).floor())*widget.rowLength)]}-${(widget.index/widget.rowLength).floor()}");
  widget.callbackValue("$text");
                      }
                      
                    // });
                    },
 decoration: const InputDecoration(
 border: OutlineInputBorder(),
errorBorder: OutlineInputBorder(
 borderSide: BorderSide(color: Colors.red, width: 5))),
 controller: widget.textEditingController,
 focusNode: widget.focusNode,
 style: widget.cellTextStyle,
//  textDirection: TextDirection.rtl,
              ),
            ],
          ),
  ),
                ),
              ),
            ),
          ),
        ),
      ),),
    );
  }
}
