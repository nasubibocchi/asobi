void main() {
  print(search(8, [1, 3, 5, 7, 9, 11, 13]));
}

int search(int k, List<int> numList) {
  int left = 0;
  int right = numList.length - 1;
  int index = 0;

  if (k > numList.last) return -1;

  while (left < right) {
    index = (left + (right - left) / 2).round();
    if (numList[index] < k) {
      left = index + 1;
      if (numList[index + 1] > k) {
        index++;
        break;
      }
    } else if (k < numList[index]) {
      right = index - 1;
    } else {
      break;
    }
  }

  return numList[index];
}
