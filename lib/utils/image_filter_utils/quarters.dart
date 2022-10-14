/*
This class contains all the Quarter Masks from LowPassFiltering.

Applies to:

q1 - q4: Kuwahara
q1 - q5: Tomita
q5, n2-n9: Naoto

This is not a reading-easy class. Each method returns the list of grey scale
values taken from a given mask applied to a pixel list. If you want to
understand each mask, please google search each filter stated above.
*/

class Quarters {
  // 1st Quarter
  static List<int> q1(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
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
  static List<int> q2(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
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
  static List<int> q3(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
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
  static List<int> q4(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
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

  // 5th Quarter | Nagao 1st mask
  static List<int> q5(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> q5List = [];

    // [0][0]
    if ((pixelX - 1 >= 0 && pixelX < height) &&
        (pixelY - 1 >= 0 && pixelY - 1 < width)) {
      q5List.add(twoDList[pixelX - 1][pixelY - 1]);
    } else {
      q5List.add(0);
    }
    // [0][1]
    if ((pixelX - 1 >= 0 && pixelX < height)) {
      q5List.add(twoDList[pixelX - 1][pixelY]);
    } else {
      q5List.add(0);
    }
    // [0][2]
    if ((pixelX - 1 >= 0 && pixelX < height) && (pixelY + 1 < width)) {
      q5List.add(twoDList[pixelX - 1][pixelY + 1]);
    } else {
      q5List.add(0);
    }

    // [1][0]
    if (pixelY - 1 >= 0) {
      q5List.add(twoDList[pixelX][pixelY - 1]);
    } else {
      q5List.add(0);
    }

    // [1][1]
    q5List.add(twoDList[pixelX][pixelY]);

    // [1][2]
    if (pixelY + 1 < width) {
      q5List.add(twoDList[pixelX][pixelY + 1]);
    } else {
      q5List.add(0);
    }

    // [2][0]
    if (pixelX + 1 < height && pixelY - 1 >= 0) {
      q5List.add(twoDList[pixelX + 1][pixelY - 1]);
    } else {
      q5List.add(0);
    }
    // [2][1]
    if (pixelX + 1 < height) {
      q5List.add(twoDList[pixelX + 1][pixelY]);
    } else {
      q5List.add(0);
    }
    // [2][2]
    if (pixelX + 1 < height && pixelY + 1 < width) {
      q5List.add(twoDList[pixelX + 1][pixelY + 1]);
    } else {
      q5List.add(0);
    }

    return q5List;
  }

  // Nagao 2nd mask
  static List<int> n2(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> q5List = [];

    // [1][0]
    if ((pixelX - 2 >= 0 && pixelX < height) &&
        (pixelY - 1 >= 0 && pixelY - 1 < width)) {
      q5List.add(twoDList[pixelX - 2][pixelY - 1]);
    } else {
      q5List.add(0);
    }
    // [1][1]
    if ((pixelX - 2 >= 0 && pixelX < height)) {
      q5List.add(twoDList[pixelX - 2][pixelY]);
    } else {
      q5List.add(0);
    }
    // [1][2]
    if ((pixelX - 2 >= 0 && pixelX < height) && (pixelY + 1 < width)) {
      q5List.add(twoDList[pixelX - 2][pixelY + 1]);
    } else {
      q5List.add(0);
    }

    // [1][0]
    if ((pixelX - 1 >= 0 && pixelX < height) &&
        (pixelY - 1 >= 0 && pixelY - 1 < width)) {
      q5List.add(twoDList[pixelX - 1][pixelY - 1]);
    } else {
      q5List.add(0);
    }
    // [1][1]
    if ((pixelX - 1 >= 0 && pixelX < height)) {
      q5List.add(twoDList[pixelX - 1][pixelY]);
    } else {
      q5List.add(0);
    }
    // [1][2]
    if ((pixelX - 1 >= 0 && pixelX < height) && (pixelY + 1 < width)) {
      q5List.add(twoDList[pixelX - 1][pixelY + 1]);
    } else {
      q5List.add(0);
    }

    // center
    q5List.add(twoDList[pixelX][pixelY]);

    return q5List;
  }

  // Nagao 3nd mask
  static List<int> n3(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> q5List = [];

    // center
    q5List.add(twoDList[pixelX][pixelY]);

    // [0][0]
    if ((pixelX - 1 >= 0) && (pixelY + 1 < width)) {
      q5List.add(twoDList[pixelX - 1][pixelY + 1]);
    } else {
      q5List.add(0);
    }
    // [0][1]
    if ((pixelX - 1 >= 0 && pixelY + 2 < width)) {
      q5List.add(twoDList[pixelX - 1][pixelY + 2]);
    } else {
      q5List.add(0);
    }

    // [1][0]
    if ((pixelX < height) && (pixelY + 1 < width)) {
      q5List.add(twoDList[pixelX][pixelY + 1]);
    } else {
      q5List.add(0);
    }
    // [1][1]
    if ((pixelX < height) && (pixelY + 2 < width)) {
      q5List.add(twoDList[pixelX][pixelY + 2]);
    } else {
      q5List.add(0);
    }

    // [2][0]
    if ((pixelX + 1 < height) && (pixelY + 1 < width)) {
      q5List.add(twoDList[pixelX + 1][pixelY + 1]);
    } else {
      q5List.add(0);
    }
    // [2][1]
    if ((pixelX + 1 < height && pixelX < height) && (pixelY + 2 < width)) {
      q5List.add(twoDList[pixelX + 1][pixelY + 2]);
    } else {
      q5List.add(0);
    }

    return q5List;
  }

  // Nagao 4th mask
  static List<int> n4(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> q5List = [];

    // center
    q5List.add(twoDList[pixelX][pixelY]);

    // [0][0]
    if ((pixelX + 1 < height) && (pixelY - 1 >= 0 && pixelY - 1 < width)) {
      q5List.add(twoDList[pixelX + 1][pixelY - 1]);
    } else {
      q5List.add(0);
    }
    // [0][1]
    if ((pixelX + 1 < height)) {
      q5List.add(twoDList[pixelX + 1][pixelY]);
    } else {
      q5List.add(0);
    }
    // [0][2]
    if ((pixelX + 1 < height) && (pixelY - 1 >= 0 && pixelY + 1 < width)) {
      q5List.add(twoDList[pixelX + 1][pixelY + 1]);
    } else {
      q5List.add(0);
    }

    // [1][0]
    if ((pixelX + 2 < height) && (pixelY - 1 >= 0 && pixelY - 1 < width)) {
      q5List.add(twoDList[pixelX + 2][pixelY - 1]);
    } else {
      q5List.add(0);
    }
    // [1][1]
    if ((pixelX + 2 < height)) {
      q5List.add(twoDList[pixelX + 2][pixelY]);
    } else {
      q5List.add(0);
    }
    // [1][2]
    if ((pixelX + 2 < height) && (pixelY - 1 >= 0 && pixelY + 1 < width)) {
      q5List.add(twoDList[pixelX + 2][pixelY + 1]);
    } else {
      q5List.add(0);
    }

    return q5List;
  }

  // Nagao 3nd mask
  static List<int> n5(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> q5List = [];

    // center
    q5List.add(twoDList[pixelX][pixelY]);

    // [0][0]
    if ((pixelX - 1 >= 0 && pixelY - 2 >= 0)) {
      q5List.add(twoDList[pixelX - 1][pixelY - 2]);
    } else {
      q5List.add(0);
    }
    // [0][1]
    if ((pixelX - 1 >= 0) && (pixelY - 1 >= 0)) {
      q5List.add(twoDList[pixelX - 1][pixelY - 1]);
    } else {
      q5List.add(0);
    }

    // [1][0]
    if ((pixelX < height) && (pixelY - 2 >= 0)) {
      q5List.add(twoDList[pixelX][pixelY - 2]);
    } else {
      q5List.add(0);
    }
    // [1][1]
    if ((pixelX < height) && (pixelY - 1 >= 0)) {
      q5List.add(twoDList[pixelX][pixelY - 1]);
    } else {
      q5List.add(0);
    }

    // [2][0]
    if ((pixelX + 1 < height && pixelX < height) && (pixelY - 2 >= 0)) {
      q5List.add(twoDList[pixelX + 1][pixelY - 2]);
    } else {
      q5List.add(0);
    }
    // [2][1]
    if ((pixelX + 1 < height) && (pixelY - 1 >= 0)) {
      q5List.add(twoDList[pixelX + 1][pixelY - 1]);
    } else {
      q5List.add(0);
    }

    return q5List;
  }

  // Nagao 6th Quarter
  static List<int> n6(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> n6List = [];

    // [0][0]
    if (pixelX - 2 >= 0 && pixelY - 2 >= 0) {
      n6List.add(twoDList[pixelX - 2][pixelY - 2]);
    } else {
      n6List.add(0);
    }
    // [0][1]
    if (pixelX - 2 >= 0 && pixelY - 1 >= 0) {
      n6List.add(twoDList[pixelX - 2][pixelY - 1]);
    } else {
      n6List.add(0);
    }

    // [1][0]
    if (pixelX - 1 >= 0 && pixelY - 2 >= 0) {
      n6List.add(twoDList[pixelX - 1][pixelY - 2]);
    } else {
      n6List.add(0);
    }
    // [1][1]
    if (pixelX - 1 >= 0 && pixelY - 1 >= 0) {
      n6List.add(twoDList[pixelX - 1][pixelY - 1]);
    } else {
      n6List.add(0);
    }
    // [1][2]
    if (pixelX - 1 >= 0 && pixelY >= 0) {
      n6List.add(twoDList[pixelX - 1][pixelY]);
    } else {
      n6List.add(0);
    }

    // [2][1]
    if (pixelX >= 0 && pixelY - 1 >= 0) {
      n6List.add(twoDList[pixelX][pixelY - 1]);
    } else {
      n6List.add(0);
    }
    // [2][2]
    if (pixelX >= 0 && pixelY >= 0) {
      n6List.add(twoDList[pixelX][pixelY]);
    } else {
      n6List.add(0);
    }

    return n6List;
  }

  // Nagao 7th mask
  static List<int> n7(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> n7List = [];

    // [0][1]
    if (pixelX - 2 >= 0 && pixelY + 1 < width) {
      n7List.add(twoDList[pixelX - 2][pixelY + 1]);
    } else {
      n7List.add(0);
    }
    // [0][2]
    if (pixelX - 2 >= 0 && pixelY + 2 < width) {
      n7List.add(twoDList[pixelX - 2][pixelY + 2]);
    } else {
      n7List.add(0);
    }

    // [1][0]
    if (pixelX - 1 >= 0 && pixelY < width) {
      n7List.add(twoDList[pixelX - 1][pixelY]);
    } else {
      n7List.add(0);
    }
    // [1][1]
    if (pixelX - 1 >= 0 && pixelY + 1 < width) {
      n7List.add(twoDList[pixelX - 1][pixelY + 1]);
    } else {
      n7List.add(0);
    }
    // [1][2]
    if (pixelX - 1 >= 0 && pixelY + 2 < width) {
      n7List.add(twoDList[pixelX - 1][pixelY + 2]);
    } else {
      n7List.add(0);
    }

    // [2][0]
    if (pixelX >= 0 && pixelY < width) {
      n7List.add(twoDList[pixelX][pixelY]);
    } else {
      n7List.add(0);
    }
    // [2][1]
    if (pixelX >= 0 && pixelY + 1 < width) {
      n7List.add(twoDList[pixelX][pixelY + 1]);
    } else {
      n7List.add(0);
    }

    return n7List;
  }

  // Naoto 8th mask
  static List<int> n8(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> n8List = [];

    // [0][0]
    if (pixelX < height && pixelY < width) {
      n8List.add(twoDList[pixelX][pixelY]);
    } else {
      n8List.add(0);
    }
    // [0][1]
    if (pixelX < height && pixelY + 1 < width) {
      n8List.add(twoDList[pixelX][pixelY + 1]);
    } else {
      n8List.add(0);
    }

    // [1][0]
    if (pixelX + 1 < height && pixelY < width) {
      n8List.add(twoDList[pixelX + 1][pixelY]);
    } else {
      n8List.add(0);
    }
    // [1][1]
    if (pixelX + 1 < height && pixelY + 1 < width) {
      n8List.add(twoDList[pixelX + 1][pixelY + 1]);
    } else {
      n8List.add(0);
    }
    // [1][2]
    if (pixelX + 1 < height && pixelY + 2 < width) {
      n8List.add(twoDList[pixelX + 1][pixelY + 2]);
    } else {
      n8List.add(0);
    }

    // [2][1]
    if (pixelX + 2 < height && pixelY + 1 < width) {
      n8List.add(twoDList[pixelX + 2][pixelY + 1]);
    } else {
      n8List.add(0);
    }
    // [2][2]
    if (pixelX + 2 < height && pixelY + 2 < width) {
      n8List.add(twoDList[pixelX + 2][pixelY + 2]);
    } else {
      n8List.add(0);
    }

    return n8List;
  }

  // Naoto 9th mask
  static List<int> n9(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> n9List = [];

    // [0][1]
    if (pixelX < height && pixelY - 1 >= 0) {
      n9List.add(twoDList[pixelX][pixelY - 1]);
    } else {
      n9List.add(0);
    }
    // [0][2]
    if (pixelX < height && pixelY >= 0) {
      n9List.add(twoDList[pixelX][pixelY]);
    } else {
      n9List.add(0);
    }

    // [1][0]
    if (pixelX + 1 < height && pixelY - 2 >= 0) {
      n9List.add(twoDList[pixelX + 1][pixelY - 2]);
    } else {
      n9List.add(0);
    }
    // [1][1]
    if (pixelX + 1 < height && pixelY - 1 >= 0) {
      n9List.add(twoDList[pixelX + 1][pixelY - 1]);
    } else {
      n9List.add(0);
    }
    // [1][2]
    if (pixelX + 1 < height && pixelY >= 0) {
      n9List.add(twoDList[pixelX + 1][pixelY]);
    } else {
      n9List.add(0);
    }

    // [2][0]
    if (pixelX + 2 < height && pixelY - 2 >= 0) {
      n9List.add(twoDList[pixelX + 2][pixelY - 2]);
    } else {
      n9List.add(0);
    }
    // [2][1]
    if (pixelX + 2 < height && pixelY - 1 >= 0) {
      n9List.add(twoDList[pixelX + 2][pixelY - 1]);
    } else {
      n9List.add(0);
    }

    return n9List;
  }

  // Somboonkaew 1st mask
  static List<int> s1(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> s1List = [];

    // topLeft
    if ((pixelX - 2 >= 0) && (pixelY - 2 >= 0)) {
      s1List.add(twoDList[pixelX - 2][pixelY - 2]);
    } else {
      s1List.add(0);
    }

    // [0][0]
    if ((pixelX - 1 >= 0 && pixelX < height) &&
        (pixelY - 1 >= 0 && pixelY - 1 < width)) {
      s1List.add(twoDList[pixelX - 1][pixelY - 1]);
    } else {
      s1List.add(0);
    }
    // [0][2]
    if ((pixelX - 1 >= 0 && pixelX < height) && (pixelY + 1 < width)) {
      s1List.add(twoDList[pixelX - 1][pixelY + 1]);
    } else {
      s1List.add(0);
    }

    // [1][1]
    s1List.add(twoDList[pixelX][pixelY]);

    // [2][0]
    if (pixelX + 1 < height && pixelY - 1 >= 0) {
      s1List.add(twoDList[pixelX + 1][pixelY - 1]);
    } else {
      s1List.add(0);
    }
    // [2][2]
    if (pixelX + 1 < height && pixelY + 1 < width) {
      s1List.add(twoDList[pixelX + 1][pixelY + 1]);
    } else {
      s1List.add(0);
    }

    // bottomRight
    if (pixelX + 2 < height && pixelY + 2 < width) {
      s1List.add(twoDList[pixelX + 2][pixelY + 2]);
    } else {
      s1List.add(0);
    }

    return s1List;
  }

  // Somboonkaew 2nd mask
  static List<int> s2(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> s2List = [];

    // topRight
    if ((pixelX + 2 < height) && (pixelY + 2 < width)) {
      s2List.add(twoDList[pixelX + 2][pixelY + 2]);
    } else {
      s2List.add(0);
    }

    // [0][0]
    if ((pixelX - 1 >= 0 && pixelX < height) &&
        (pixelY - 1 >= 0 && pixelY - 1 < width)) {
      s2List.add(twoDList[pixelX - 1][pixelY - 1]);
    } else {
      s2List.add(0);
    }
    // [0][2]
    if ((pixelX - 1 >= 0 && pixelX < height) && (pixelY + 1 < width)) {
      s2List.add(twoDList[pixelX - 1][pixelY + 1]);
    } else {
      s2List.add(0);
    }

    // [1][1]
    s2List.add(twoDList[pixelX][pixelY]);

    // [2][0]
    if (pixelX + 1 < height && pixelY - 1 >= 0) {
      s2List.add(twoDList[pixelX + 1][pixelY - 1]);
    } else {
      s2List.add(0);
    }
    // [2][2]
    if (pixelX + 1 < height && pixelY + 1 < width) {
      s2List.add(twoDList[pixelX + 1][pixelY + 1]);
    } else {
      s2List.add(0);
    }

    // bottomLeft
    if (pixelX - 2 >= 0 && pixelY - 2 >= 0) {
      s2List.add(twoDList[pixelX - 2][pixelY - 2]);
    } else {
      s2List.add(0);
    }

    return s2List;
  }

  // Somboonkaew 3nd mask
  static List<int> s3(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> s3List = [];

    // [0][1]
    if ((pixelX - 1 >= 0 && pixelX < height)) {
      s3List.add(twoDList[pixelX - 1][pixelY]);
    } else {
      s3List.add(0);
    }

    // left
    if (pixelY - 2 >= 0) {
      s3List.add(twoDList[pixelX][pixelY - 2]);
    } else {
      s3List.add(0);
    }
    // [1][0]
    if (pixelY - 1 >= 0) {
      s3List.add(twoDList[pixelX][pixelY - 1]);
    } else {
      s3List.add(0);
    }
    // [1][1]
    s3List.add(twoDList[pixelX][pixelY]);
    // [1][2]
    if (pixelY + 1 < width) {
      s3List.add(twoDList[pixelX][pixelY + 1]);
    } else {
      s3List.add(0);
    }
    // right
    if (pixelY + 2 < width) {
      s3List.add(twoDList[pixelX][pixelY + 2]);
    } else {
      s3List.add(0);
    }

    // [2][1]
    if (pixelX + 1 < height) {
      s3List.add(twoDList[pixelX + 1][pixelY]);
    } else {
      s3List.add(0);
    }

    return s3List;
  }

  // Somboonkaew 4th mask
  static List<int> s4(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> s4List = [];

    // top
    if ((pixelX - 2 >= 0 && pixelX < height)) {
      s4List.add(twoDList[pixelX - 2][pixelY]);
    } else {
      s4List.add(0);
    }

    // [0][1]
    if ((pixelX - 1 >= 0 && pixelX < height)) {
      s4List.add(twoDList[pixelX - 1][pixelY]);
    } else {
      s4List.add(0);
    }

    // [1][0]
    if (pixelY - 1 >= 0) {
      s4List.add(twoDList[pixelX][pixelY - 1]);
    } else {
      s4List.add(0);
    }
    // [1][1]
    s4List.add(twoDList[pixelX][pixelY]);
    // [1][2]
    if (pixelY + 1 < width) {
      s4List.add(twoDList[pixelX][pixelY + 1]);
    } else {
      s4List.add(0);
    }

    // [2][1]
    if (pixelX + 1 < height) {
      s4List.add(twoDList[pixelX + 1][pixelY]);
    } else {
      s4List.add(0);
    }

    // bottom
    if (pixelX + 2 < height) {
      s4List.add(twoDList[pixelX + 2][pixelY]);
    } else {
      s4List.add(0);
    }

    return s4List;
  }

  // Somboonkaew 5th mask
  static List<int> s5(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> s5List = [];

    // [0][0]
    if ((pixelX - 1 >= 0 && pixelX < height) &&
        (pixelY - 1 >= 0 && pixelY - 1 < width)) {
      s5List.add(twoDList[pixelX - 1][pixelY - 1]);
    } else {
      s5List.add(0);
    }
    // [0][1]
    if ((pixelX - 1 >= 0 && pixelX < height)) {
      s5List.add(twoDList[pixelX - 1][pixelY]);
    } else {
      s5List.add(0);
    }
    // [0][2]
    if ((pixelX - 1 >= 0 && pixelX < height) && (pixelY + 1 < width)) {
      s5List.add(twoDList[pixelX - 1][pixelY + 1]);
    } else {
      s5List.add(0);
    }

    // [1][1]
    s5List.add(twoDList[pixelX][pixelY]);

    // [2][0]
    if (pixelX + 1 < height && pixelY - 1 >= 0) {
      s5List.add(twoDList[pixelX + 1][pixelY - 1]);
    } else {
      s5List.add(0);
    }
    // [2][1]
    if (pixelX + 1 < height) {
      s5List.add(twoDList[pixelX + 1][pixelY]);
    } else {
      s5List.add(0);
    }
    // [2][2]
    if (pixelX + 1 < height && pixelY + 1 < width) {
      s5List.add(twoDList[pixelX + 1][pixelY + 1]);
    } else {
      s5List.add(0);
    }

    return s5List;
  }

  // Somboonkaew 6th mask
  static List<int> s6(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> s6List = [];

    // [0][0]
    if ((pixelX - 1 >= 0 && pixelX < height) &&
        (pixelY - 1 >= 0 && pixelY - 1 < width)) {
      s6List.add(twoDList[pixelX - 1][pixelY - 1]);
    } else {
      s6List.add(0);
    }
    // [0][2]
    if ((pixelX - 1 >= 0 && pixelX < height) && (pixelY + 1 < width)) {
      s6List.add(twoDList[pixelX - 1][pixelY + 1]);
    } else {
      s6List.add(0);
    }

    // [1][0]
    if (pixelY - 1 >= 0) {
      s6List.add(twoDList[pixelX][pixelY - 1]);
    } else {
      s6List.add(0);
    }
    // [1][1]
    s6List.add(twoDList[pixelX][pixelY]);
    // [1][2]
    if (pixelY + 1 < width) {
      s6List.add(twoDList[pixelX][pixelY + 1]);
    } else {
      s6List.add(0);
    }

    // [2][0]
    if (pixelX + 1 < height && pixelY - 1 >= 0) {
      s6List.add(twoDList[pixelX + 1][pixelY - 1]);
    } else {
      s6List.add(0);
    }
    // [2][2]
    if (pixelX + 1 < height && pixelY + 1 < width) {
      s6List.add(twoDList[pixelX + 1][pixelY + 1]);
    } else {
      s6List.add(0);
    }

    return s6List;
  }

  // Somboonkaew 7th mask
  static List<int> s7(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> s7List = [];

    // [0][0]
    if ((pixelX - 1 >= 0 && pixelX < height) &&
        (pixelY - 1 >= 0 && pixelY - 1 < width)) {
      s7List.add(twoDList[pixelX - 1][pixelY - 1]);
    } else {
      s7List.add(0);
    }
    // [0][1]
    if ((pixelX - 1 >= 0 && pixelX < height)) {
      s7List.add(twoDList[pixelX - 1][pixelY]);
    } else {
      s7List.add(0);
    }

    // [1][0]
    if (pixelY - 1 >= 0) {
      s7List.add(twoDList[pixelX][pixelY - 1]);
    } else {
      s7List.add(0);
    }
    // [1][1]
    s7List.add(twoDList[pixelX][pixelY]);
    // [1][2]
    if (pixelY + 1 < width) {
      s7List.add(twoDList[pixelX][pixelY + 1]);
    } else {
      s7List.add(0);
    }

    // [2][1]
    if (pixelX + 1 < height) {
      s7List.add(twoDList[pixelX + 1][pixelY]);
    } else {
      s7List.add(0);
    }
    // [2][2]
    if (pixelX + 1 < height && pixelY + 1 < width) {
      s7List.add(twoDList[pixelX + 1][pixelY + 1]);
    } else {
      s7List.add(0);
    }

    return s7List;
  }

  // Somboonkaew 8th mask
  static List<int> s8(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> s8List = [];

    // [0][1]
    if ((pixelX - 1 >= 0 && pixelX < height)) {
      s8List.add(twoDList[pixelX - 1][pixelY]);
    } else {
      s8List.add(0);
    }
    // [0][2]
    if ((pixelX - 1 >= 0 && pixelX < height) && (pixelY + 1 < width)) {
      s8List.add(twoDList[pixelX - 1][pixelY + 1]);
    } else {
      s8List.add(0);
    }

    // [1][0]
    if (pixelY - 1 >= 0) {
      s8List.add(twoDList[pixelX][pixelY - 1]);
    } else {
      s8List.add(0);
    }
    // [1][1]
    s8List.add(twoDList[pixelX][pixelY]);
    // [1][2]
    if (pixelY + 1 < width) {
      s8List.add(twoDList[pixelX][pixelY + 1]);
    } else {
      s8List.add(0);
    }

    // [2][0]
    if (pixelX + 1 < height && pixelY - 1 >= 0) {
      s8List.add(twoDList[pixelX + 1][pixelY - 1]);
    } else {
      s8List.add(0);
    }
    // [2][1]
    if (pixelX + 1 < height) {
      s8List.add(twoDList[pixelX + 1][pixelY]);
    } else {
      s8List.add(0);
    }

    return s8List;
  }

  // Somboonkaew 9th mask
  static List<int> s9(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> q5List = [];

    // [0][1]
    if ((pixelX - 1 >= 0 && pixelX < height)) {
      q5List.add(twoDList[pixelX - 1][pixelY]);
    } else {
      q5List.add(0);
    }

    // [1][0]
    if (pixelY - 1 >= 0) {
      q5List.add(twoDList[pixelX][pixelY - 1]);
    } else {
      q5List.add(0);
    }

    // [1][1]
    q5List.add(twoDList[pixelX][pixelY]);

    // [1][2]
    if (pixelY + 1 < width) {
      q5List.add(twoDList[pixelX][pixelY + 1]);
    } else {
      q5List.add(0);
    }

    // [2][0]
    if (pixelX + 1 < height && pixelY - 1 >= 0) {
      q5List.add(twoDList[pixelX + 1][pixelY - 1]);
    } else {
      q5List.add(0);
    }
    // [2][1]
    if (pixelX + 1 < height) {
      q5List.add(twoDList[pixelX + 1][pixelY]);
    } else {
      q5List.add(0);
    }
    // [2][2]
    if (pixelX + 1 < height && pixelY + 1 < width) {
      q5List.add(twoDList[pixelX + 1][pixelY + 1]);
    } else {
      q5List.add(0);
    }

    return q5List;
  }

  // Somboonkaew 10th mask
  static List<int> s10(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> s10List = [];

    // [0][0]
    if ((pixelX - 1 >= 0 && pixelX < height) &&
        (pixelY - 1 >= 0 && pixelY - 1 < width)) {
      s10List.add(twoDList[pixelX - 1][pixelY - 1]);
    } else {
      s10List.add(0);
    }
    // [0][1]
    if ((pixelX - 1 >= 0 && pixelX < height)) {
      s10List.add(twoDList[pixelX - 1][pixelY]);
    } else {
      s10List.add(0);
    }

    // [1][0]
    if (pixelY - 1 >= 0) {
      s10List.add(twoDList[pixelX][pixelY - 1]);
    } else {
      s10List.add(0);
    }

    // [1][1]
    s10List.add(twoDList[pixelX][pixelY]);

    // [1][2]
    if (pixelY + 1 < width) {
      s10List.add(twoDList[pixelX][pixelY + 1]);
    } else {
      s10List.add(0);
    }

    // [2][0]
    if (pixelX + 1 < height && pixelY - 1 >= 0) {
      s10List.add(twoDList[pixelX + 1][pixelY - 1]);
    } else {
      s10List.add(0);
    }
    // [2][1]
    if (pixelX + 1 < height) {
      s10List.add(twoDList[pixelX + 1][pixelY]);
    } else {
      s10List.add(0);
    }

    return s10List;
  }

  // Somboonkaew 11th mask
  static List<int> s11(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> s11List = [];

    // [0][0]
    if ((pixelX - 1 >= 0 && pixelX < height) &&
        (pixelY - 1 >= 0 && pixelY - 1 < width)) {
      s11List.add(twoDList[pixelX - 1][pixelY - 1]);
    } else {
      s11List.add(0);
    }
    // [0][1]
    if ((pixelX - 1 >= 0 && pixelX < height)) {
      s11List.add(twoDList[pixelX - 1][pixelY]);
    } else {
      s11List.add(0);
    }
    // [0][2]
    if ((pixelX - 1 >= 0 && pixelX < height) && (pixelY + 1 < width)) {
      s11List.add(twoDList[pixelX - 1][pixelY + 1]);
    } else {
      s11List.add(0);
    }

    // [1][0]
    if (pixelY - 1 >= 0) {
      s11List.add(twoDList[pixelX][pixelY - 1]);
    } else {
      s11List.add(0);
    }
    // [1][1]
    s11List.add(twoDList[pixelX][pixelY]);
    // [1][2]
    if (pixelY + 1 < width) {
      s11List.add(twoDList[pixelX][pixelY + 1]);
    } else {
      s11List.add(0);
    }

    // [2][1]
    if (pixelX + 1 < height) {
      s11List.add(twoDList[pixelX + 1][pixelY]);
    } else {
      s11List.add(0);
    }

    return s11List;
  }

  // Somboonkaew 12th mask
  static List<int> s12(
      int width, int height, List<List<int>> twoDList, int pixelX, int pixelY) {
    List<int> s12List = [];

    // [0][1]
    if ((pixelX - 1 >= 0 && pixelX < height)) {
      s12List.add(twoDList[pixelX - 1][pixelY]);
    } else {
      s12List.add(0);
    }
    // [0][2]
    if ((pixelX - 1 >= 0 && pixelX < height) && (pixelY + 1 < width)) {
      s12List.add(twoDList[pixelX - 1][pixelY + 1]);
    } else {
      s12List.add(0);
    }

    // [1][0]
    if (pixelY - 1 >= 0) {
      s12List.add(twoDList[pixelX][pixelY - 1]);
    } else {
      s12List.add(0);
    }
    // [1][1]
    s12List.add(twoDList[pixelX][pixelY]);
    // [1][2]
    if (pixelY + 1 < width) {
      s12List.add(twoDList[pixelX][pixelY + 1]);
    } else {
      s12List.add(0);
    }

    // [2][1]
    if (pixelX + 1 < height) {
      s12List.add(twoDList[pixelX + 1][pixelY]);
    } else {
      s12List.add(0);
    }
    // [2][2]
    if (pixelX + 1 < height && pixelY + 1 < width) {
      s12List.add(twoDList[pixelX + 1][pixelY + 1]);
    } else {
      s12List.add(0);
    }

    return s12List;
  }
}
