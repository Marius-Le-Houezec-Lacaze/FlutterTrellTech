import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:integration_test/integration_test.dart';
import 'package:trelltech/config/constant.dart';
import 'package:trelltech/main.dart' as app;
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


@GenerateMocks([http.Client])
void main(){
  group('first test', () {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Connect to trello", (WidgetTester tester) async {
    app.main();



    await tester.pumpAndSettle();
    final connectButton = find.byType(TextButton).first;

    await tester.tap(connectButton);
    await tester.pumpAndSettle();


  });
  });
}