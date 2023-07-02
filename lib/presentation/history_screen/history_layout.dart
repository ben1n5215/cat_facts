import 'package:cat_facts/presentation/history_screen/bloc/history_bloc.dart';
import 'package:cat_facts/presentation/history_screen/bloc/history_event.dart';
import 'package:cat_facts/presentation/history_screen/bloc/history_state.dart';
import 'package:cat_facts/presentation/widgets/cat_error_widget.dart';
import 'package:cat_facts/presentation/widgets/cat_fact_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryLayout extends StatefulWidget {
  const HistoryLayout({super.key});

  @override
  State<HistoryLayout> createState() => _HistoryLayoutState();
}

class _HistoryLayoutState extends State<HistoryLayout> {
  static const title = Text('History');
  static const loadingTxt = Text('Waiting');
  static const padding = EdgeInsets.all(8.0);

  @override
  void initState() {
    BlocProvider.of<CatHistoryBloc>(context).add(LoadingHistoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: Padding(
        padding: padding,
        child: BlocBuilder<CatHistoryBloc, HistoryState>(
          builder: (context, state) {
            if (state is CatHistoryInitial) {
              return const Center(child: loadingTxt);
            } else if (state is CatHistoryError) {
              return CatError(
                  textError: 'Something wrong with $state in HistoryLayout');
            } else if (state is CatHistoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CatHistoryLoaded) {
              return ListView.builder(
                itemCount: state.history.length,
                itemBuilder: (_, context) => CatImageFactWidget(
                  factsAndImages: state.history[context],
                ),
              );
            } else {
              throw Exception('unprocessed state $state in HistoryLayout');
            }
          },
        ),
      ),
    );
  }
}
