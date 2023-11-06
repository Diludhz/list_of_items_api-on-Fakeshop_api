import 'package:get/get.dart';
import 'package:list_of_items_api/model/datamodel.dart';
import 'package:list_of_items_api/service/dataservice.dart';

class DataController extends GetxController {
  // ignore: non_constant_identifier_names
  var DataList = <DataModel>[].obs;
  var isloading = false.obs;
  getData() async {
    isloading.value = true;
    var datas = await DataService().getmethod();

    try {
      if (datas != null) {
        DataList.value = datas;
        isloading.value = false;
      }
    } catch (e) {
      Get.snackbar("title", "$e");
      isloading.value = false;
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
