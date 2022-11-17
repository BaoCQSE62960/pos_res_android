import 'package:pos_res_android/repos/models/momo.dart';
import 'package:pos_res_android/repos/repository/cashier/momo_repository.dart';

class MomoService {
  MomoRepository repos = MomoRepository();
  Future<List<Momo>> getMomoListItem() async {
    return repos.getMomoItem();
  }

  Future<List<Momo>> getMomoItem() async {
    return repos.getMomoItem();
  }

  Future<String> getPayment(String amount) {
    return repos.getMomoPayment(amount);
  }
}
