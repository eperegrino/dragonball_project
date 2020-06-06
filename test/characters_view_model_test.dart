import 'package:dragonball_project/characters_view_model.dart';
import 'package:dragonball_project/models/character.dart';
import 'package:dragonball_project/services/mockedService.dart';
import 'package:dragonball_project/services/service.dart';
import 'package:dragonball_project/widgets/characters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CharactersListPageViewModel viewModel;
  Service service;

  group("Without setup", () {
    setUpAll((){
      service = ServiceImpl();
      viewModel = CharactersListPageViewModel(service: service);
    });

    tearDownAll((){
      service = null;
      viewModel = null;
    });
    test('Empty state', (){
      expect(viewModel.dataSource.isEmpty, true);
      expect(viewModel.carregarListagem, null);
      expect(viewModel.service, service);
      expect(viewModel.navigationTitle, "Characters");
      expect(viewModel.imageBackground, "images/dbz.png");
    });
  });

  group("With setup", () {
    Service service;
    CharactersListPageViewModel viewModel;
    Function f = () {return -1;};
    setUpAll(() {
      service = MockedServiceImpl();
      viewModel = CharactersListPageViewModel(service: service);
      viewModel.carregarListagem = f;
      viewModel.feedDataSource();
    });

    tearDownAll((){
      service = null;
      viewModel = null;
    });

    test('Feed data', () async {
      // await Future.delayed(Duration(seconds: 2)).then((value){
        expect(viewModel.dataSource.isEmpty, false);
        expect(viewModel.dataSource.length, 5);
        expect(viewModel.carregarListagem(), -1);
        expect(viewModel.service, service);
        expect(viewModel.navigationTitle, "Characters");
        expect(viewModel.imageBackground, "images/dbz.png");
      // });
    });
  });
}