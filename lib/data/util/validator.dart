class Validator {
  static String? latLngValidator(String? latLngString) {
    //Nullまたは空文字の場合
    if (latLngString == null || latLngString.isEmpty) {
      return "緯度経度が未入力です";
    }

    List<String> datas = latLngString.split(",");

    //「,」区切ったときに、2項目とならない場合、
    if (datas.length != 2) {
      return "[緯度],[経度]の形式で入力してください";
    }

    double? lat = double.tryParse(datas[0]);
    double? lng = double.tryParse(datas[1]);

    if (lat == null || lng == null) {
      return "[緯度],[経度]の形式で入力してください";
    }
    if (lat.abs() >= 90.0) {
      return "[緯度]の最大値は ±90° です";
    }
    if (lng.abs() >= 180.0) {
      return "[経度]の最大値は ±180° です";
    }

    //有効
    return null;
  }
}
