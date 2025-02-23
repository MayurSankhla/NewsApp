import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NoInternetController extends GetxController{

  var isConnected = true.obs;
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    checkConnection();
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      checkConnection();
    });
  }

  Future<void> checkConnection() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    isConnected.value = connectivityResult != ConnectivityResult.none;
  }
}