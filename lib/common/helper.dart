class DesignHelper {
  static const int maxPaginationNumber = 15;

  static int calcPaginationOffset({required List<dynamic> itemsCount}) {
    return itemsCount.length;
  }
}
