class Neighbourhood {
  // 3x3
  static List<int> n3x3(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> list = [];

    // [0][0]
    if ((pixelX - 1 >= 0 && pixelX < height) &&
        (pixelY - 1 >= 0 && pixelY - 1 < width)) {
      list.add(twoDList[pixelX - 1][pixelY - 1]);
    } else {
      list.add(0);
    }
    // [0][1]
    if ((pixelX - 1 >= 0 && pixelX < height)) {
      list.add(twoDList[pixelX - 1][pixelY]);
    } else {
      list.add(0);
    }
    // [0][2]
    if ((pixelX - 1 >= 0 && pixelX < height) && (pixelY + 1 < width)) {
      list.add(twoDList[pixelX - 1][pixelY + 1]);
    } else {
      list.add(0);
    }

    // [1][0]
    if (pixelY - 1 >= 0) {
      list.add(twoDList[pixelX][pixelY - 1]);
    } else {
      list.add(0);
    }

    // [1][2]
    if (pixelY + 1 < width) {
      list.add(twoDList[pixelX][pixelY + 1]);
    } else {
      list.add(0);
    }

    // [2][0]
    if (pixelX + 1 < height && pixelY - 1 >= 0) {
      list.add(twoDList[pixelX + 1][pixelY - 1]);
    } else {
      list.add(0);
    }
    // [2][1]
    if (pixelX + 1 < height) {
      list.add(twoDList[pixelX + 1][pixelY]);
    } else {
      list.add(0);
    }
    // [2][2]
    if (pixelX + 1 < height && pixelY + 1 < width) {
      list.add(twoDList[pixelX + 1][pixelY + 1]);
    } else {
      list.add(0);
    }

    return list;
  }
}
