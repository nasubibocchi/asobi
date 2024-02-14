import 'dart:math';

void main() {
  // print("Hello World");
  print(isPrimaryNumber(137));
}

bool isPrimaryNumber(int n) {
  bool isPrimary = true;
  int count = 0;
  const calculateNum = 100;

  final random = Random();
  int a = n + random.nextInt(n - 2);

  while (count <= calculateNum) {
    if (isMutually(n, a)) {
      isPrimary = false;
      break;
    } else if (a ^ (n - 1) % n == 1) {
      isPrimary = false;
      break;
    } else {
      count++;
    }
  }

  return isPrimary;
}

bool isMutually(int a, int b) {
  int x = 0;
  int y = 0;

  if (a > b) {
    x = a;
    y = b;
  } else {
    x = b;
    y = a;
  }

  int r = x % y;
  while (r != 0) {
    x = y;
    y = r;
    r = x % y;
  }

  return x == 1;
}
