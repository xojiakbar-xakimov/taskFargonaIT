import '../models/DemoModel.dart';

class DemoData {
  List<DemoModel> list = [];

  List<String> imageList = [];

  DemoData() {
    imageList.add("assets/fantastik.png") ;
    imageList.add("assets/love.png");
    imageList.add("assets/horor.png");
    imageList.add("assets/horro.png");
    list.add(DemoModel("assets/halo.png", "Halo", "14 30", "assets/fantastik.png"));
    list.add(DemoModel("assets/fall.png", "Falling in love", "15 30", "assets/love.png"));
    list.add(DemoModel("assets/bird.png", "Bird Box", "14 30", "assets/horor.png"));
    list.add(DemoModel("assets/pet.png", "Pet Sematary", "14 30", "assets/horro.png"));
    list.add(DemoModel("assets/halo.png", "Halo", "14 30", "assets/fantastik.png"));
    list.add(DemoModel("assets/fall.png", "Falling in love", "15 30", "assets/love.png"));
    list.add(DemoModel("assets/bird.png", "Bird Box", "14 30", "assets/horor.png"));
    list.add(DemoModel("assets/pet.png", "Pet Sematary", "14 30", "assets/horro.png"));
    list.add(DemoModel("assets/halo.png", "Halo", "14 30", "assets/fantastik.png"));
    list.add(DemoModel("assets/fall.png", "Falling in love", "15 30", "assets/love.png"));
    list.add(DemoModel("assets/bird.png", "Bird Box", "14 30", "assets/horor.png"));
    list.add(DemoModel("assets/pet.png", "Pet Sematary", "14 30", "assets/horro.png"));
    list.add(DemoModel("assets/halo.png", "Halo", "14 30", "assets/fantastik.png"));
    list.add(DemoModel("assets/fall.png", "Falling in love", "15 30", "assets/love.png"));
    list.add(DemoModel("assets/bird.png", "Bird Box", "14 30", "assets/horor.png"));
    list.add(DemoModel("assets/pet.png", "Pet Sematary", "14 30", "assets/horro.png"));
    list.add(DemoModel("assets/halo.png", "Halo", "14 30", "assets/fantastik.png"));
    list.add(DemoModel("assets/fall.png", "Falling in love", "15 30", "assets/love.png"));
    list.add(DemoModel("assets/bird.png", "Bird Box", "14 30", "assets/horor.png"));
    list.add(DemoModel("assets/pet.png", "Pet Sematary", "14 30", "assets/horro.png"));
    list.add(DemoModel("assets/halo.png", "Halo", "14 30", "assets/fantastik.png"));
    list.add(DemoModel("assets/fall.png", "Falling in love", "15 30", "assets/love.png"));
    list.add(DemoModel("assets/bird.png", "Bird Box", "14 30", "assets/horor.png"));
    list.add(DemoModel("assets/pet.png", "Pet Sematary", "14 30", "assets/horro.png"));
    list.add(DemoModel("assets/halo.png", "Halo", "14 30", "assets/fantastik.png"));
    list.add(DemoModel("assets/fall.png", "Falling in love", "15 30", "assets/love.png"));
    list.add(DemoModel("assets/bird.png", "Bird Box", "14 30", "assets/horor.png"));
    list.add(DemoModel("assets/pet.png", "Pet Sematary", "14 30", "assets/horro.png"));
    list.add(DemoModel("assets/halo.png", "Halo", "14 30", "assets/fantastik.png"));
    list.add(DemoModel("assets/fall.png", "Falling in love", "15 30", "assets/love.png"));
    list.add(DemoModel("assets/bird.png", "Bird Box", "14 30", "assets/horor.png"));
    list.add(DemoModel("assets/pet.png", "Pet Sematary", "14 30", "assets/horro.png"));
    list.add(DemoModel("assets/halo.png", "Halo", "14 30", "assets/fantastik.png"));
    list.add(DemoModel("assets/fall.png", "Falling in love", "15 30", "assets/love.png"));
    list.add(DemoModel("assets/bird.png", "Bird Box", "14 30", "assets/horor.png"));
    list.add(DemoModel("assets/pet.png", "Pet Sematary", "14 30", "assets/horro.png"));
    list.add(DemoModel("assets/halo.png", "Halo", "14 30", "assets/fantastik.png"));
    list.add(DemoModel("assets/fall.png", "Falling in love", "15 30", "assets/love.png"));
    list.add(DemoModel("assets/bird.png", "Bird Box", "14 30", "horror"));
    list.add(DemoModel("assets/pet.png", "Pet Sematary", "14 30", "history"));
  }

  List<String> getAllJanrs() {
    return imageList ;
  }

  Future<List<DemoModel>> getAllData(int count) async {
    List<DemoModel> answer = [];
    await Future.delayed(const Duration(seconds: 3), () {
      if (count * 10 <= list.length) {
        answer = list.sublist(0, (count * 10));
      } else {
        answer = list;
      }
    });
    return answer;
  }

  List<DemoModel> getDataByText(String text) {
    List<DemoModel> answer = [];
    if (text.isEmpty) {
      answer = list;
    } else {
      answer = list
          .where((element) =>
              element.filmName.toLowerCase().startsWith(text.toLowerCase()))
          .toList();
    }
    return answer;
  }

  List<DemoModel> getDataByJanr(String text) {
    List<DemoModel> answer = [];
    if (text.isEmpty) {
      answer = list;
    } else {
      answer = list
          .where((element) =>
          element.janr.toLowerCase() == text.toLowerCase())
          .toList();
    }
    return answer;
  }

}
