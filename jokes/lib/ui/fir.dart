import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jokes/ui/jeis.dart';

class Fir extends StatefulWidget {
  const Fir({super.key});

  @override
  State<Fir> createState() => _FirState();
}

class _FirState extends State<Fir> {
  String? text;
getImagae() async {
      final Dio dio = Dio();
      final one = await dio.get('https://api.chucknorris.io/jokes/random');
      final two = JokeModel.fromJson(one.data);
      text = two.value;
      setState(() {});
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(colors:[Colors.blue, Colors.red, ],),),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text ?? 'sorry there was an error', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
              const SizedBox(height: 150,),
              SizedBox(
                height: 60,
                width: 300,
                child: ElevatedButton(
                  onPressed: getImagae,
                  child: const Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
