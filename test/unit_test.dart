import 'package:dragonball_project/services/mockedService.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
  MockedServiceImpl service;
  List<dynamic> list = [];

  group("without setup", () {
    test('empty test', () {
      expect(service, null);
      expect(list, isEmpty);
    });
  });

  group("with setup", () {
    setUpAll(() {
      service = MockedServiceImpl();
      service.getAllCharacters().then((response) {
        for(var item in response["body"]) {
          list.add(item);
        }
      });
    });

  tearDown(() {
    service = null;
  });
    test('mocked list count test', () {
        expect(list.length, 5);
        expect(service.getBaseUrl(), isNotNull);
        expect(service.getBaseUrl().length, isPositive);
    });
  });
}