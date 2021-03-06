import 'package:flutter/material.dart';
import 'package:margin_calculator/calculator.dart';
import 'package:margin_calculator/calculator_model.dart';
import 'package:margin_calculator/style.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;
// // Enable to slow animations.
// timeDilation = 5.0;

// TODO: Sentry integration.
// <https://github.com/flutter/sentry>

void main() {
  runApp(
    ChangeNotifierProvider<CalculatorModel>(
      builder: (BuildContext context) {
        final calculator = CalculatorModel();
        calculator.defaultCurrenciesRates();
        calculator.fetchCurrenciesRates();
        return calculator;
      },
      child: _App(),
    ),
  );
}

class _App extends StatelessWidget {
  const _App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = CalculatorModel.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Margin Calculator',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade200,
        appBarTheme: AppBarTheme(
          elevation: 0,
          textTheme: TextTheme(
            title: TextStyle(
              fontSize: MediumTextSize,
              fontFamily: DefaultFontFamily,
            ),
          ),
        ),
        textTheme: TextTheme(
          body1: TextStyle(
            fontSize: BodyTextSize,
            fontFamily: DefaultFontFamily,
          ),
        ),
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Calculator(model),
      },
    );
  }
}
