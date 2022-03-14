import 'package:flutter/material.dart';
import './entries_bloc.dart';
export './entries_bloc.dart';

class EntriesProvider extends InheritedWidget {
  final EntriesBloc bloc;

  EntriesProvider({Key? key, required Widget child})
      : bloc = EntriesBloc(),
        super(key: key, child: child);

  // Whether the framework should notify widgets that inherit from this widget.
  @override
  bool updateShouldNotify(oldWidget) => true;

  // all widgets that calls this method will be notified when this widget changes.
  static EntriesBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<EntriesProvider>())!
        .bloc;
  }
}
