import 'package:agri/models/appstate.dart';
import 'package:agri/services/service_imp.dart';
import 'package:agri/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class Changes extends StatelessWidget {
  const Changes({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<MyModel, Appstate>(
      create: (c) => MyModel(),
      child: child,
    );
  }
}

class MyModel extends StateNotifier<Appstate> with LocatorMixin {
  MyModel() : super(Appstate());
  Future<void> gethistory() async {
    Services obj = ServiceImp();
    final a = await obj.getHistory();
    state = state.rebuild((p0) => p0.orders = a?.toBuilder());
  }

  Future<void> gethistory1() async {
    Services obj = ServiceImp();
    final a = await obj.getHistory1();
    state = state.rebuild((p0) => p0.accepted = a?.toBuilder());
  }
}
