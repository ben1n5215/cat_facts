import 'package:cat_facts/data/repository/repository.dart';
import 'package:cat_facts/presentation/main_screen/bloc/cat_facts_bloc.dart';
import 'package:cat_facts/presentation/main_screen/cat_layout.dart';
import 'package:cat_facts/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CatFactsBloc(getIt<Repository>()),
      child:   const CatLayout(),
    );
  }
}
