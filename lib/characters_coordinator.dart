import 'package:flutter/material.dart';

import './widgets/characters.dart';
import './characters_view_model.dart';
import './services/service.dart';

abstract class BaseCoordinator{
  Widget widget();
}

class CharactersCoordinator implements BaseCoordinator{
  @override
  Widget widget() {
    var viewModel = CharactersListPageViewModel(service: ServiceImpl());
    return CharactersListPage(viewModel: viewModel,);
  }

}