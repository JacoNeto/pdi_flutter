import 'dart:typed_data';

class Quarters {
  // 1st Quarter
  static List<int> q1(Uint8List pixels, int pixel, int width, int height,
      List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> q1List = [];

    // [0][0]
    if (pixelX - 2 >= 0 && pixelY < width) {
      q1List.add(twoDList[pixelX - 2][pixelY]);
    } else {
      q1List.add(0);
    }
    // [0][1]
    if (pixelX - 2 >= 0 && pixelY + 1 < width) {
      q1List.add(twoDList[pixelX - 2][pixelY + 1]);
    } else {
      q1List.add(0);
    }
    // [0][2]
    if (pixelX - 2 >= 0 && pixelY + 2 < width) {
      q1List.add(twoDList[pixelX - 2][pixelY + 2]);
    } else {
      q1List.add(0);
    }

    // [1][0]
    if (pixelX - 1 >= 0 && pixelY < width) {
      q1List.add(twoDList[pixelX - 1][pixelY]);
    } else {
      q1List.add(0);
    }
    // [1][1]
    if (pixelX - 1 >= 0 && pixelY + 1 < width) {
      q1List.add(twoDList[pixelX - 1][pixelY + 1]);
    } else {
      q1List.add(0);
    }
    // [1][2]
    if (pixelX - 1 >= 0 && pixelY + 2 < width) {
      q1List.add(twoDList[pixelX - 1][pixelY + 2]);
    } else {
      q1List.add(0);
    }

    // [2][0]
    if (pixelX >= 0 && pixelY < width) {
      q1List.add(twoDList[pixelX][pixelY]);
    } else {
      q1List.add(0);
    }
    // [2][1]
    if (pixelX >= 0 && pixelY + 1 < width) {
      q1List.add(twoDList[pixelX][pixelY + 1]);
    } else {
      q1List.add(0);
    }
    // [2][2]
    if (pixelX >= 0 && pixelY + 2 < width) {
      q1List.add(twoDList[pixelX][pixelY + 2]);
    } else {
      q1List.add(0);
    }

    return q1List;
  }

  // 2nd Quarter
  static List<int> q2(Uint8List pixels, int pixel, int width, int height,
      List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> q2List = [];

    // [0][0]
    if (pixelX - 2 >= 0 && pixelY - 2 >= 0) {
      q2List.add(twoDList[pixelX - 2][pixelY - 2]);
    } else {
      q2List.add(0);
    }
    // [0][1]
    if (pixelX - 2 >= 0 && pixelY - 1 >= 0) {
      q2List.add(twoDList[pixelX - 2][pixelY - 1]);
    } else {
      q2List.add(0);
    }
    // [0][2]
    if (pixelX - 2 >= 0 && pixelY >= 0) {
      q2List.add(twoDList[pixelX - 2][pixelY]);
    } else {
      q2List.add(0);
    }

    // [1][0]
    if (pixelX - 1 >= 0 && pixelY - 2 >= 0) {
      q2List.add(twoDList[pixelX - 1][pixelY - 2]);
    } else {
      q2List.add(0);
    }
    // [1][1]
    if (pixelX - 1 >= 0 && pixelY - 1 >= 0) {
      q2List.add(twoDList[pixelX - 1][pixelY - 1]);
    } else {
      q2List.add(0);
    }
    // [1][2]
    if (pixelX - 1 >= 0 && pixelY >= 0) {
      q2List.add(twoDList[pixelX - 1][pixelY]);
    } else {
      q2List.add(0);
    }

    // [2][0]
    if (pixelX >= 0 && pixelY - 2 >= 0) {
      q2List.add(twoDList[pixelX][pixelY - 2]);
    } else {
      q2List.add(0);
    }
    // [2][1]
    if (pixelX >= 0 && pixelY - 1 >= 0) {
      q2List.add(twoDList[pixelX][pixelY - 1]);
    } else {
      q2List.add(0);
    }
    // [2][2]
    if (pixelX >= 0 && pixelY >= 0) {
      q2List.add(twoDList[pixelX][pixelY]);
    } else {
      q2List.add(0);
    }

    return q2List;
  }

  // 3rd Quarter
  static List<int> q3(Uint8List pixels, int pixel, int width, int height,
      List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> q3List = [];

    // [0][0]
    if (pixelX < height && pixelY - 2 >= 0) {
      q3List.add(twoDList[pixelX][pixelY - 2]);
    } else {
      q3List.add(0);
    }
    // [0][1]
    if (pixelX < height && pixelY - 1 >= 0) {
      q3List.add(twoDList[pixelX][pixelY - 1]);
    } else {
      q3List.add(0);
    }
    // [0][2]
    if (pixelX < height && pixelY >= 0) {
      q3List.add(twoDList[pixelX][pixelY]);
    } else {
      q3List.add(0);
    }

    // [1][0]
    if (pixelX + 1 < height && pixelY - 2 >= 0) {
      q3List.add(twoDList[pixelX + 1][pixelY - 2]);
    } else {
      q3List.add(0);
    }
    // [1][1]
    if (pixelX + 1 < height && pixelY - 1 >= 0) {
      q3List.add(twoDList[pixelX + 1][pixelY - 1]);
    } else {
      q3List.add(0);
    }
    // [1][2]
    if (pixelX + 1 < height && pixelY >= 0) {
      q3List.add(twoDList[pixelX + 1][pixelY]);
    } else {
      q3List.add(0);
    }

    // [2][0]
    if (pixelX + 2 < height && pixelY - 2 >= 0) {
      q3List.add(twoDList[pixelX + 2][pixelY - 2]);
    } else {
      q3List.add(0);
    }
    // [2][1]
    if (pixelX + 2 < height && pixelY - 1 >= 0) {
      q3List.add(twoDList[pixelX + 2][pixelY - 1]);
    } else {
      q3List.add(0);
    }
    // [2][2]
    if (pixelX + 2 < height && pixelY >= 0) {
      q3List.add(twoDList[pixelX + 2][pixelY]);
    } else {
      q3List.add(0);
    }

    return q3List;
  }

  // 4th Quarter
  static List<int> q4(Uint8List pixels, int pixel, int width, int height,
      List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> q4List = [];

    // [0][0]
    if (pixelX < height && pixelY < width) {
      q4List.add(twoDList[pixelX][pixelY]);
    } else {
      q4List.add(0);
    }
    // [0][1]
    if (pixelX < height && pixelY + 1 < width) {
      q4List.add(twoDList[pixelX][pixelY + 1]);
    } else {
      q4List.add(0);
    }
    // [0][2]
    if (pixelX < height && pixelY + 2 < width) {
      q4List.add(twoDList[pixelX][pixelY + 2]);
    } else {
      q4List.add(0);
    }

    // [1][0]
    if (pixelX + 1 < height && pixelY < width) {
      q4List.add(twoDList[pixelX + 1][pixelY]);
    } else {
      q4List.add(0);
    }
    // [1][1]
    if (pixelX + 1 < height && pixelY + 1 < width) {
      q4List.add(twoDList[pixelX + 1][pixelY + 1]);
    } else {
      q4List.add(0);
    }
    // [1][2]
    if (pixelX + 1 < height && pixelY + 2 < width) {
      q4List.add(twoDList[pixelX + 1][pixelY + 2]);
    } else {
      q4List.add(0);
    }

    // [2][0]
    if (pixelX + 2 < height && pixelY < width) {
      q4List.add(twoDList[pixelX + 2][pixelY]);
    } else {
      q4List.add(0);
    }
    // [2][1]
    if (pixelX + 2 < height && pixelY + 1 < width) {
      q4List.add(twoDList[pixelX + 2][pixelY + 1]);
    } else {
      q4List.add(0);
    }
    // [2][2]
    if (pixelX + 2 < height && pixelY + 2 < width) {
      q4List.add(twoDList[pixelX + 2][pixelY + 2]);
    } else {
      q4List.add(0);
    }

    return q4List;
  }
}
