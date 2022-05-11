import 'package:bloc/bloc.dart';
import 'package:change_finance/repositories/exchange_data.dart';

class ExchangeCubit extends Cubit<double>{
  ExchangeCubit() : super(0.0);

  final rate = Rate();

  void toUSD(){
    emit(state*rate.rates['MAD']!);
  }
  void toMAD(){
    emit(state*rate.rates['USD']!);
  }
  void toFCFA(){
    emit(state*rate.rates['FCFA']!);
  }

}