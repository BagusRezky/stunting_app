import 'package:get/get.dart';
import 'package:stunting_app/configs/routes/route.dart';
import 'package:stunting_app/features/profile/models/user_model.dart';

class ArtikelController extends GetxController {
  // Simulated user data for this example
  var user =
      UserModel(name: 'John Doe', email: 'johndoe@example.com', age: 28).obs;

  void updateUser(UserModel newUser) {
    user.value = newUser;
  }

  void back(){
     Get.offNamed(Routes.mainRoute);
  }
}
