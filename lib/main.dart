import 'package:change_finance/Cubit/exchange_cubit.dart';
import 'package:change_finance/Screens/exchange_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context){
            return ExchangeCubit();
          })
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Exchange",
          home: ExchangePage(),
        ));
  }
}


