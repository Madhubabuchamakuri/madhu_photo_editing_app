
import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatelessWidget {
  final Function onClicked;

  const FloatingButtonWidget({
    Key key,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>Container(
             
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                onPressed: onClicked,
                padding: EdgeInsets.all(10.0),
                color: Colors.purple,
                textColor: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                                            padding: EdgeInsets.all(10),

                      child: Icon(Icons.add, color: Colors.white)),
                    
                    Container(
                      child: Text("Add to frame",
                          style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ),
            );

  //  FloatingActionButton(
    
        // backgroundColor: Theme.of(context).primaryColor,
        // shape: RoundedRectangleBorder(
        //   side: BorderSide(width: 2, color: Theme.of(context).accentColor),
        //   borderRadius: BorderRadius.circular(16),
        // ),
        // child: Icon(Icons.add, color: Theme.of(context).accentColor),
        // onPressed: onClicked,
      // );
}
