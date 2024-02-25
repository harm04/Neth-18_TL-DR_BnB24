

import 'package:agro_chain/frontend/onBoarding/page1.dart';

import 'signUp.dart';
import '../resources/authMethods.dart';
import '../utils/snackbar.dart';
import '../widgets.dart/custom_buttons.dart';
import '../widgets.dart/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  
  bool isLoading=false;

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading?const Center(
      child: CircularProgressIndicator()
    ) :GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
       
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70,),
               
                const Text(
                  'Agro Chain',
                  style: TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomTextfield(
                  hinttext: 'enter your email',
                  controller: emailcontroller,
                  isobscureText: false,
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  hinttext: 'enter your password',
                  controller: passwordcontroller,
                  isobscureText: true,
                  icon: Icons.password,
                ),
                const SizedBox(
                  height: 10,
                ),
               
                Row(
                  children: [
                    Text('Not an user?'),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                    }, child: Text('Sign up'))
                  ],
                ),
               
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: ()async{
                    setState(() {
                      isLoading=true;
                    });
                   String res =await AuthMethods().login(email: emailcontroller.text, password: passwordcontroller.text, context: context);
                    setState(() {
                      isLoading=false;
                    });
                    if(res=='success'){
                      
                        
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return const Page1();
                    }
                    ));
                    } else{
                      showSnackbar(res, context);
                    }
                  },
                  child: const CustomButton(
                      height: 50, width: double.infinity, text: 'Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}