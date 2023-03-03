import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AddFood extends StatefulWidget {


  @override
  State<AddFood> createState() => _AddFoodState();

  dynamic? map;
  AddFood(this.map);

  GlobalKey<FormState> formkey = GlobalKey();
  var name = new TextEditingController();
  var description = new TextEditingController();
  var price = new TextEditingController();
  var calaries = new TextEditingController();


}

class _AddFoodState extends State<AddFood> {
  void initState(){
    widget.name.text = widget.map==null?'':widget.map['name'];
    widget.description.text = widget.map==null?'':widget.map['description'].toString();
    widget.price.text = widget.map==null?'':widget.map['price'];
    widget.calaries.text = widget.map==null?'':widget.map['calaries'];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: TextFormField(
              controller: widget.name,
              decoration: InputDecoration(
                hintText: "Enter Food's name",
              ),
            ),
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Food's description",
              ),
              controller: widget.description,
            ),
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter food's price",
              ),
              controller: widget.price,
            ),
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter food's calaries",
              ),
              controller: widget.calaries,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () async {
                if(widget.map==null){
                  await addfood().then((value) => (value) {

                  });
                }
                else{
                  await editfood().then((value) => (value) {

                  });
                }

                Navigator.of(context).pop(true);

              }, child: Text("Submit",style: TextStyle(fontSize: 24),),
            ),
          )
        ],
      ),
    );
  }

  Future<void> addfood() async{
    var map ={};
    map['name']=widget.name.text;
    map['description']=widget.description.text;
    map['price']=widget.price.text;
    map['calaries']=widget.calaries.text;
    var response1 = http.post(Uri.parse("https://631059cd826b98071a3ecc19.mockapi.io/food",),body: map);
  }

  Future<void> editfood() async{
    var map ={};
    map['name']=widget.name.text;
    map['description']=widget.description.text;
    map['price']=widget.price.text;
    map['calaries']=widget.calaries.text;
    var response1 = http.put(Uri.parse("https://631059cd826b98071a3ecc19.mockapi.io/food"+widget.map['id'].toString(),),body: map);
  }
}
