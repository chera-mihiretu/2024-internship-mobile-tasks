Stream<int> getNumbers() async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

void main() async {
  Stream<int> numbers = getNumbers();
  numbers.listen((data) {
    print(data);
  });
}
