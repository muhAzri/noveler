extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String avatar() {
    if (isEmpty) {
      return "";
    }

    if (length == 1) {
      return this;
    }

    var avatar = substring(0, 2);

    if (contains(" ")) {
      var words = split(" ");
      avatar = words[0].substring(0, 1) + words[1].substring(0, 1);
    }

    return avatar.toUpperCase();
  }
}
