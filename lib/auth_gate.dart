import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'main.dart';

class AuthGate extends StatelessWidget { const AuthGate({super.key});
 @override Widget build(BuildContext context){
  if(supabaseUrl.isEmpty||supabaseAnonKey.isEmpty) return const HomeShell();
  return StreamBuilder<AuthState>(stream:Supabase.instance.client.auth.onAuthStateChange,builder:(context,snap){
   if(Supabase.instance.client.auth.currentSession!=null) return const HomeShell();
   return const LoginPage();
  });
 }
}
class LoginPage extends StatefulWidget {const LoginPage({super.key});@override State<LoginPage> createState()=>_LoginPageState();}
class _LoginPageState extends State<LoginPage>{final email=TextEditingController(),pass=TextEditingController(),name=TextEditingController();bool signup=false,loading=false;String error='';
 Future<void> submit()async{setState(()=>loading=true);try{final a=Supabase.instance.client.auth;if(signup){await a.signUp(email:email.text.trim(),password:pass.text, data:{'display_name':name.text.trim().isEmpty?'Pikachu Athlete':name.text.trim()});}else{await a.signInWithPassword(email:email.text.trim(),password:pass.text);}}catch(e){setState(()=>error=e.toString());}finally{if(mounted)setState(()=>loading=false);}}
 @override Widget build(BuildContext c)=>Scaffold(backgroundColor:dark,body:SafeArea(child:Center(child:SingleChildScrollView(padding:const EdgeInsets.all(24),child:Column(children:[const CircleAvatar(radius:54,backgroundColor:orange,child:Text('P',style:TextStyle(fontSize:54,fontWeight:FontWeight.w900,color:Colors.white))),const SizedBox(height:20),const Text('PIKACHU WORKOUT',style:TextStyle(color:Colors.white,fontSize:30,fontWeight:FontWeight.w900)),const SizedBox(height:8),Text(signup?'Create your fitness account':'Train stronger. Every day.',style:const TextStyle(color:Colors.white70,fontSize:16)),const SizedBox(height:30),if(signup)TextField(controller:name,decoration:const InputDecoration(labelText:'Name',filled:true,fillColor:Colors.white,border:OutlineInputBorder())),if(signup)const SizedBox(height:12),TextField(controller:email,keyboardType:TextInputType.emailAddress,decoration:const InputDecoration(labelText:'Email',filled:true,fillColor:Colors.white,border:OutlineInputBorder())),const SizedBox(height:12),TextField(controller:pass,obscureText:true,decoration:const InputDecoration(labelText:'Password',filled:true,fillColor:Colors.white,border:OutlineInputBorder())),if(error.isNotEmpty)Padding(padding:const EdgeInsets.all(10),child:Text(error,style:const TextStyle(color:Colors.redAccent))),const SizedBox(height:14),SizedBox(width:double.infinity,height:54,child:FilledButton(onPressed:loading?null:submit,child:Text(loading?'PLEASE WAIT':signup?'CREATE ACCOUNT':'LOGIN'))),TextButton(onPressed:()=>setState(()=>signup=!signup),child:Text(signup?'Already have an account? Login':'New here? Create account',style:const TextStyle(color:Colors.white))) ]))));}
}
