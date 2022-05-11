import 'package:change_finance/Cubit/exchange_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ExchangePage extends StatelessWidget {
  const ExchangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exchangeCubit=context.read<ExchangeCubit>();
    final _controller =TextEditingController();
     String res="0.0";

    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: const Text('Exchange'),
      ) ,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: _controller,
               keyboardType: TextInputType.number,
                style:const  TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
                decoration:const InputDecoration(
                  labelText: "Montant en Euro",
                ),
              ),
             const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        exchangeCubit.emit(double.parse(_controller.text));
                        exchangeCubit.toMAD();
                        res = exchangeCubit.state.toStringAsFixed(2)+" DH";
                      },
                      child:const Text('MAD',
                        style: TextStyle(
                        fontSize: 20
                      ),)),
                  ElevatedButton(
                      onPressed: (){
                        exchangeCubit.emit(double.parse(_controller.text));
                        exchangeCubit.toUSD();
                        res = exchangeCubit.state.toStringAsFixed(2)+" \$";
                      },
                      child:const Text('USD',
                        style: TextStyle(
                            fontSize: 20
                        ),)),
                  ElevatedButton(
                      onPressed: (){
                        exchangeCubit.emit(double.parse(_controller.text));
                        exchangeCubit.toFCFA();
                        res = exchangeCubit.state.toStringAsFixed(2)+" FCFA";
                      },
                      child:const Text('FCFA  ',
                        style: TextStyle(
                            fontSize: 20
                        ),))
                ],
              ),
              const SizedBox(height: 30,),
             BlocBuilder<ExchangeCubit,double>(builder: (context,state){
               return Text(res,
                 style:const TextStyle(fontSize: 30,color: Colors.red) ,);
             })
            ],
          ),
        ),
      ),
    );
  }
}
