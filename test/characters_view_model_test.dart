import 'package:dragonball_project/characters_view_model.dart';
import 'package:dragonball_project/services/service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CharactersListPageViewModel viewModel;
  Service service;

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
  });

  test('Feed data', () async {
    viewModel.feedDataSource();
    await Future.delayed(Duration(seconds: 2)).then((value){
      expect(viewModel.dataSource.length, 1);
    });
  });
}