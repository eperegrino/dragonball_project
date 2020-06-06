// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dragonball_project/characters_view_model.dart';
import 'package:dragonball_project/services/service.dart';
import 'package:dragonball_project/widgets/planets.dart';
import 'package:dragonball_project/widgets/characters.dart';
import 'package:dragonball_project/services/mockedService.dart';
import 'package:dragonball_project/widgets/tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dragonball_project/main.dart';

void main() {
  testWidgets('initial smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    var dragonball = DragonBall();
    await tester.pumpWidget(dragonball);

    expect(find.text(''), findsOneWidget);
    expect(find.text('Oi, eu sou o Goku!'), findsNothing);
    expect(find.text('Vamos começar!'), findsNothing);
    // expect(find.byWidget(DecorationImage(image: null)), findsOneWidget);
    // expect(find.byWidget(CupertinoButton()), findsNothing);

    var element = find.byKey(Key("onboarding_page_view"));
    await tester.drag(element, Offset(-500, 0));
    await tester.pumpAndSettle();
    
    expect(find.text('Oi, eu sou o Goku!'), findsOneWidget);
    expect(find.text(''), findsNothing);
    expect(find.text('Vamos começar!'), findsOneWidget);
    // expect(find.byWidget(DecorationImage()), findsOneWidget);
    // expect(find.byWidget(CupertinoButton()), findsOneWidget);
  });

  testWidgets('Onboarding to list test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    var dragonball = DragonBall();
    await tester.pumpWidget(dragonball);

    var element = find.byKey(Key("onboarding_page_view"));
    await tester.drag(element, Offset(-500, 0));
    await tester.pumpAndSettle();

    var button = find.byKey(Key("onboarding_button"));
    await tester.tap(button);
    // await tester.pumpWidget(dragonball);
    // await tester.pumpAndSettle();

    // expect(find.text("Characters"), findsWidgets);
    // expect(find.text("Planets"), findsOneWidget);
  });

  group("group tab view test", () {
    var tabView;
    Service service;
    CharactersListPageViewModel viewModel;
    CharactersListPage listPage;
    Function f = () {};
    var listView;
    var gridView;
    setUpAll(() {
      // tabView = CupertinoApp(home: TabIOS());
      service = MockedServiceImpl();
      viewModel = CharactersListPageViewModel(service: service);
      viewModel.carregarListagem = f;
      viewModel.feedDataSource();
      listPage = CharactersListPage(viewModel: viewModel,);
      listView = CupertinoApp(home: listPage);
      // gridView = CupertinoApp(home: PlanetsGrid());
    });

    testWidgets('tab view test', (WidgetTester tester) async {
      await tester.pumpWidget(tabView);
      await tester.pumpAndSettle();

      expect(find.text("Characters"), findsWidgets);
      // expect(find.text("Planets"), findsOneWidget);
    });

    testWidgets('tab - list view test', (WidgetTester tester) async {
      await tester.pumpWidget(listView);
      await tester.pumpAndSettle();

      // // await Future.delayed(Duration(seconds: 2)).then((value) {
        expect(find.text("Vegeta"), findsOneWidget);
        expect(find.text("Saiyan"), findsWidgets);
        expect(find.byWidget(listPage), findsOneWidget);
      // // });
    });

    // testWidgets('tab - grid view test', (WidgetTester tester) async {
    //   await tester.pumpWidget(gridView);

    //   expect(find.text("PLANETS"), findsOneWidget);
    // });
  });
}
