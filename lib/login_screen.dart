import 'package:expense_app/home_screen.dart';
import 'package:expense_app/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Padding(
           padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(height: 100,),
               Image.asset('assets/image/MonetyLogo.png'),
               SizedBox(height: 24,),
               Text("Welcome back",
                 style: TextStyle(
                 color: Color(0XFF1C1B3A),
                 fontSize: 30,
                 fontWeight: FontWeight.w600,
               ),),
               SizedBox(
                 height: 4,
               ),
               Text("Login to continue managing your expense",
               style: TextStyle(
               color: Color(0XFF8E8EA6),

               ),
               ),
               SizedBox(height: 24,),
               Text("Email",
                 style: TextStyle(
                 color: Color(0XFF1C1B3A),
                 fontSize: 14,
                 fontWeight: FontWeight.w500,
               ),),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Color(0XFFF6F7FB),
                  border: Border.all(
                    color: Color(0XFFECECF4),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(
                      color: Color(0XFF8E8EA6),
                      fontSize: 16,
                    ),
                    prefixIcon: Icon(Icons.mail_outline,color: Color(0XFF9A9AB0),),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical:16,horizontal: 10),

                  ),
                ),
              ),
              SizedBox(height: 16,),
              Text("Password",
                style: TextStyle(
                  color: Color(0XFF1C1B3A),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
              ),),
              SizedBox(height: 16,),
              Container(
                 decoration: BoxDecoration(
                   color: Color(0XFFF6F7FB),
                   border: Border.all(
                     color: Color(0XFFECECF4),
                     width: 1,
                   ),
                   borderRadius: BorderRadius.circular(12),
                 ),
                 child: TextFormField(
                   controller: _passwordController,
                   obscureText: _obscure,
                   keyboardType: TextInputType.visiblePassword,
                   decoration: InputDecoration(
                     hintText: 'Enter your password',
                     hintStyle: TextStyle(
                       color: Color(0XFF8E8EA6),
                       fontSize: 16,
                     ),
                     prefixIcon: Icon(Icons.lock_outline,color: Color(0XFF9A9AB0),),
                     border: InputBorder.none,
                     contentPadding: EdgeInsets.symmetric(vertical:16,horizontal: 10),
                     suffixIcon: IconButton(onPressed:(){setState(() => _obscure = !_obscure);}, icon: Icon(_obscure ? Icons.visibility_outlined:Icons.visibility_off_outlined,color: Color(0XFF9A9AB0),))
                   ),
                 ),
               ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: ()async{
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLoggedIn',true);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homescreen()),);
              },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFFE2659B),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  minimumSize: Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                    
                  ),
                  child: Text("Login",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,

              ),)),
                  SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),),
                      SizedBox(width: 5,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen()),);
                        },
                        child: Text("Sign Up", style: TextStyle(
                          color: Color(0XFFE2659B),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),),
                      )
                    ],
                  )
               






             ],
           ),
         ),
    );
  }
}
