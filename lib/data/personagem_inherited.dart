import 'package:flutter/material.dart';


 PersonagemInhrited extends InheritedWidget {
  const PersonagemInhrited({
    super.key,
    required Widget child,
  }) : super(child: child);

  static PersonagemInhrited of(BuildContext context) {
    final PersonagemInhrited? result =
        context.dependOnInheritedWidgetOfExactType<PersonagemInhrited>();
    assert(result != null, 'No PersonagemInhrited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(PersonagemInhrited old) {
    return ;
  }
}
