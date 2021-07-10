import 'package:flutter/material.dart';
import 'package:qualif/views/pages/HomePage.dart';
import 'package:qualif/utils/globals.dart' as globals;

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }

}



class LoginPageState extends State<LoginPage>{
  var ctrlEmail = TextEditingController();
  var ctrlPass = TextEditingController();
  var _errorUsername= '', _errorPassword= '';

  void validate(BuildContext ctx){
    setState(() {
      if(ctrlEmail.text == ""){
        _errorUsername = 'Email Must not be empty';
      }else{
        if(ctrlEmail.text.length < 8){
          _errorUsername ='Email Must be >= 8 Characters';
        }else{
          if(!ctrlEmail.text.contains("@")){
            _errorUsername = 'Email Must Contain "@"';
          }else{
            _errorUsername = '';
          }
        }
      }
      if(ctrlPass.text == ""){
        _errorPassword = "Password Must Not Be Empty";
      }else{
        if(ctrlPass.text.length < 4){
          _errorPassword ='Password Must be >= 4 Characters';
        }else{
          _errorPassword = '';
        }
      }
      if(_errorPassword== "" && _errorUsername == ""){
        if(ctrlPass.text == "admin" && ctrlEmail.text == "admin@gmail.com"){
          // masuk ke page selanjutnya
          globals.email = ctrlEmail.text;
          Navigator.push(ctx, MaterialPageRoute(
                builder: (ctx) {
                  return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      theme: globals.darkTheme ?ThemeData.dark() : ThemeData.light(),
                      home: Scaffold(
                        body: HomePage(ctrlEmail.text),
                      ),
                    );
                }
            )
          );
        }else{
          _errorPassword = 'Username / Password Is Wrong';
        }
      }
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(40),
        padding: EdgeInsets.only(top: 50),
        width: 600,
        height: 600,
        child: Column(

          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 120,
                maxHeight: 120,
                minHeight: 80,
                minWidth: 80
              ),
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
              ),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Email'),
              controller: ctrlEmail,
            ),
            Text(_errorUsername,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
              controller: ctrlPass,
            ),
            Text(_errorPassword,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            ElevatedButton(onPressed: ()=>validate(context), child: Text("Login"))


          ],

        ),
      ),
    );
    
  }

}