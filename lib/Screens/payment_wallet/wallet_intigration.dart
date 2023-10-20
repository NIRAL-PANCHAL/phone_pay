// Import necessary packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Define events for the wallet
abstract class WalletEvent {}

class AddMoneyEvent extends WalletEvent {
  final double amount;

  AddMoneyEvent(this.amount);
}

class ViewBalanceEvent extends WalletEvent {}

class MakeTransactionEvent extends WalletEvent {
  final double amount;

  MakeTransactionEvent(this.amount);
}

// Define states for the wallet
abstract class WalletState {}

class InitialWalletState extends WalletState {}

class WalletLoadedState extends WalletState {
  final double balance;

  WalletLoadedState(this.balance);
}

class WalletErrorState extends WalletState {
  final String error;

  WalletErrorState(this.error);
}

// Define the wallet bloc
class WalletBloc extends Bloc<WalletEvent, WalletState> {
  double _balance = 0.0;

  WalletBloc(super.initialState);

  @override
  WalletState get initialState => InitialWalletState();

  @override
  Stream<WalletState> mapEventToState(WalletEvent event) async* {
    if (event is AddMoneyEvent) {
      yield* _mapAddMoneyToState(event.amount);
    } else if (event is ViewBalanceEvent) {
      yield WalletLoadedState(_balance);
    } else if (event is MakeTransactionEvent) {
      yield* _mapMakeTransactionToState(event.amount);
    }
  }

  Stream<WalletState> _mapAddMoneyToState(double amount) async* {
    try {
      // Integrate payment gateway logic here
      // For example, you might use an API to add money to the user's wallet

      // Simulate a successful transaction for demonstration purposes
      _balance += amount;

      yield WalletLoadedState(_balance);
    } catch (e) {
      yield WalletErrorState("Error adding money to the wallet");
    }
  }

  Stream<WalletState> _mapMakeTransactionToState(double amount) async* {
    try {
      _balance -= amount;
      yield WalletLoadedState(_balance);
    } catch (e) {
      yield WalletErrorState("Error making transaction");
    }
  }
}
