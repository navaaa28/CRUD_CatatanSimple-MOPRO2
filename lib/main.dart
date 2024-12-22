import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabaseeuy/halaman_catatan.dart';

void main() async {
  await Supabase.initialize(
    url: "https://iwufkmwqecoglnkxootq.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml3dWZrbXdxZWNvZ2xua3hvb3RxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQzMTIyNDUsImV4cCI6MjA0OTg4ODI0NX0.RZAHUd81XZjzVK-XnBuFhhABHVqj8jdmg3LzSb_lbHA", 
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanCatatan(),
    );
  }
}