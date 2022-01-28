import 'package:integration_test/integration_test_driver.dart';

///Bu kod,integration_test_driverı  etkinleştirir
/// ve ardından testin çalışmasını bekler. Yanıt verileri,
///  testler çalıştırıldıktan sonra integration_response_data.json adlı bir dosyada saklanır.
Future<void> main() => integrationDriver();
