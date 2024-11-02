import 'package:get/get.dart';
import 'package:stunting_app/features/jadwal/constants/jadwal_api_constant.dart';
import 'package:stunting_app/features/jadwal/models/imunitation.dart';
import 'package:stunting_app/features/jadwal/models/jadwal_model.dart';
import 'package:stunting_app/features/jadwal/models/schedule.dart';
// import 'package:stunting_app/services/api_service.dart';

class JadwalController extends GetxController {
  var posyanduList = <Posyandu>[].obs;
  var datesList = <Schedule>[].obs;
  var selectedPosyandu = Rxn<Posyandu>();
  var selectedDate = Rxn<String>();
  var immunizationSchedules = <ImmunizationSchedule>[].obs;
  var isLoading = false.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosyanduList();
  }

  void fetchPosyanduList() async {
    try {
      print("Fetching Posyandu list...");
      final data = await JadwalApiConstant.fetchPosyandu();
      posyanduList.value = data;
      print("Posyandu list fetched successfully: $posyanduList");
    } catch (e) {
      print('Error fetching Posyandu list: $e');
    }
  }

  void fetchDates(Posyandu posyandu) async {
    selectedPosyandu.value = posyandu;
    // Clear the selected date when changing Posyandu
    selectedDate.value = null;
    try {
      print("Fetching dates for Posyandu ID: ${posyandu.id}...");
      final dates = await JadwalApiConstant.fetchDates(posyandu.id);
      datesList.value = dates;
      print("Dates fetched successfully: $datesList");
    } catch (e) {
      print('Error fetching dates: $e');
      // Clear the dates list on error
      datesList.clear();
    }
  }

  Future<void> fetchImmunizationSchedule() async {
    if (selectedPosyandu.value == null || selectedDate.value == null) {
      errorMessage.value = 'Pilih Posyandu dan tanggal terlebih dahulu';
      hasError.value = true;
      return;
    }

    isLoading.value = true;
    hasError.value = false;
    errorMessage.value = '';

    try {
      print(
          "Fetching schedules for Posyandu ID: ${selectedPosyandu.value!.id} and date: ${selectedDate.value}");

      final schedules = await JadwalApiConstant.fetchImmunizations(
        selectedPosyandu.value!.id,
        selectedDate.value!,
      );

      immunizationSchedules.value = schedules;
      print("Fetched schedules: ${schedules.length}");

      // Clear error state if successful
      hasError.value = false;
      errorMessage.value = '';
    } catch (e) {
      print('Error fetching immunization schedule: $e');
      hasError.value = true;
      errorMessage.value = 'Gagal memuat jadwal imunisasi: $e';
      immunizationSchedules.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
