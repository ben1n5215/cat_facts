import 'package:cat_facts/data/repository/repository.dart';
import 'package:cat_facts/presentation/history_screen/bloc/history_bloc.dart';
import 'package:cat_facts/presentation/history_screen/history_layout.dart';
import 'package:cat_facts/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatHistoryBloc>(
      create: (context) => CatHistoryBloc(getIt<Repository>()),
      child: const HistoryLayout(),
    );
  }
}
