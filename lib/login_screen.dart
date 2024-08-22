import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailContral = TextEditingController();
  TextEditingController userNameContral = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login Screen"),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: Container(
              margin: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    controller: emailContral,
                    decoration: InputDecoration(
                        // fillColor: Colors.grey,
                        // label: Text("email" ,style: TextStyle(fontSize: 20),),
                        labelText: "Enter your email ",
                        hintText: "example@gmail.com",
                        // filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Colors.green,
                                width: 5,
                                style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Colors.orange,
                                width: 5,
                                style: BorderStyle.solid)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 5,
                                style: BorderStyle.solid)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Colors.green,
                                width: 5,
                                style: BorderStyle.solid))),
                    onChanged: (String value) {
                      print("show $value");
                    },
                    onSubmitted: (String value) {},
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    controller:userNameContral ,
                    decoration: InputDecoration(
                        // fillColor: Colors.grey,
                        // label: Text("email" ,style: TextStyle(fontSize: 20),),
                        labelText: "Enter your Use name  ",
                        hintText: "shaimaa",
                        // filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Colors.green,
                                width: 5,
                                style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Colors.orange,
                                width: 5,
                                style: BorderStyle.solid)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 5,
                                style: BorderStyle.solid)),
                        errorText:  "errorrrrrrrrrrrrr",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Colors.green,
                                width: 5,
                                style: BorderStyle.solid))),
                    onChanged: (String value) {
                      print("show $value");
                    },
                    validator: (String? value) {
                      return value == null ? "enter your data" : "";
                    },
                    onSaved: (String? value) {},
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 50),
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: ()  async{
                            // if(_formKey.currentState!.validate()) {
                              final SharedPreferences prefs = await SharedPreferences.getInstance();
                          /// insert
                              /// {"email" :"value" }
                             bool saved =         await  prefs.setString("email",emailContral.text );
                              bool saved2 =        await  prefs.setString("userName",userNameContral.text );
                             print("$saved  $saved2");
                             // }

                          }, child: Text("Login "))) ,
                  SizedBox(height: 30,),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () async{
                      /// read
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      dynamic email  =     prefs.get("email") ;
                          print( email) ;
                      String? myUsrName=     prefs.getString("userName");
                      print(myUsrName);

                    }, child: Text("read data")),
                  ),
                  SizedBox(height: 30,),

                  Container(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () async{
                      /// update
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                       prefs.setString("email", "my update email");

                    }, child: Text("update data")),
                  ),

                  SizedBox(height: 30,),

                  Container(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () async{
                      /// remove
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                       prefs.remove("email");
                       prefs.clear();
                    }, child: Text("remove data")),
                  ),
                ],
              ))),
    );
  }
}
