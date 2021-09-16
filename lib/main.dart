import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final isLightThemeProvider = StateProvider((ref) => true);

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isLightTheme = ref.watch(isLightThemeProvider).state;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: _isLightTheme ? ThemeData.light() : ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Theme'),
        actions: [
          IconButton(onPressed: (){
            ref.read(isLightThemeProvider).state =
            !ref.read(isLightThemeProvider).state;
          }, icon: Icon(Icons.change_circle))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'headline1',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'headline2',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'headline3',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'headline4',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'headline5',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'headline6',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'bodyText1',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'bodyText2',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              'subTitle1',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              'subTitle2',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              'overline',
              style: Theme.of(context).textTheme.overline,
            ),
            Text(
              'caption',
              style: Theme.of(context).textTheme.caption,
            ),
            TextButton(onPressed: () {}, child: Text('TextButton')),
            ElevatedButton(onPressed: () {}, child: Text('ElevatedButton')),
            OutlinedButton(onPressed: () {}, child: Text('OutlinedButton')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
