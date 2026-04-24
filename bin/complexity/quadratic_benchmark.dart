import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:dsad/complexity.dart';

import 'utils/names.dart';

class QuadraticAlgorithmBenchmark extends BenchmarkBase {
  const QuadraticAlgorithmBenchmark(super.name, this.data);

  final List<String> data;

  @override
  void run() {
    quadraticTimeAlgorithm(data);
  }
}

void main() {
  final benchmarks = [
    QuadraticAlgorithmBenchmark('S', Names.s),
    QuadraticAlgorithmBenchmark('M', Names.m),
    QuadraticAlgorithmBenchmark('L', Names.l),
    QuadraticAlgorithmBenchmark('XL', Names.xl),
  ];

  for (final b in benchmarks) {
    b.report();
  }
}
