class StrHelper {
  static String attributesStr(Map<String, dynamic> attributes) {
    String str = '';
    attributes.forEach(
      (key, value) {
        if (value != null) {
          if (str == '') {
            str = '$key=$value';
          } else {
            str += '&$key=$value';
          }
        }
      },
    );
    return str;
  }
}
