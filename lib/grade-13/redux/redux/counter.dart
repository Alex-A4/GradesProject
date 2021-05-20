/// Модель счетчика, которая будет изменяться в редусере
class Counter {
  final int value;
  final bool isLoading;

  const Counter(this.value, [this.isLoading = false]);
}
