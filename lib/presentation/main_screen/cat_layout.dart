import 'package:cat_facts/presentation/history_screen/history_screen.dart';
import 'package:cat_facts/presentation/main_screen/bloc/cat_facts_bloc.dart';
import 'package:cat_facts/presentation/main_screen/bloc/cat_facts_event.dart';
import 'package:cat_facts/presentation/main_screen/bloc/cat_facts_state.dart';
import 'package:cat_facts/presentation/widgets/cat_error_widget.dart';
import 'package:cat_facts/presentation/widgets/cat_fact_image_widget.dart';
import 'package:cat_facts/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatLayout extends StatefulWidget {
  const CatLayout({super.key});

  @override
  State<CatLayout> createState() => _CatLayoutState();
}

class _CatLayoutState extends State<CatLayout> {
  static const itemCount = 1;

  static const black = Colors.black;
  static const blue = Colors.blueAccent;

  static const space = SizedBox(height: 15);
  static const padding = EdgeInsets.all(8.0);
  static const bigSpace = SizedBox(height: 40);

  static const historyButton = 'History';
  static const title = Text('Cat Facts');
  static const factButton = 'Another Fact!';
  static const loadingTxt = Text('Waiting');

  @override
  void initState() {
    context.read<CatFactsBloc>().add(LoadingCatEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: title,
      ),
      body: Padding(
        padding: padding,
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<CatFactsBloc, CatFactsState>(
                builder: (context, state) {
                  if (state is CatFactsInitial) {
                    return const Center(child: loadingTxt);
                  } else if (state is CatFactsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CatFactsError) {
                    return CatError(
                        textError: 'Something wrong with $state in CatLayout');
                  } else if (state is CatFactsLoaded) {
                    return ListView.builder(
                        itemBuilder: (_, index) => CatImageFactWidget(
                              factsAndImages: state.factsAndImages,
                            ),
                        itemCount: itemCount);
                  } else {
                    throw Exception('unprocessed state $state in CatLayout');
                  }
                },
              ),
            ),
            bigSpace,
            CustomButton(
                text: factButton,
                onPressed: () {
                  context.read<CatFactsBloc>().add(LoadingCatEvent());
                },
                buttonColor: blue,
                textButtonColor: black),
            space,
            CustomButton(
                text: historyButton,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HistoryScreen(),
                    ),
                  );
                },
                buttonColor: blue,
                textButtonColor: black),
            space,
          ],
        ),
      ),
    );
  }
}
