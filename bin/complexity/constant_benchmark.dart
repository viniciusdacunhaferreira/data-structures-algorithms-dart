import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:dsad/complexity.dart';

import 'utils/names.dart';

class ConstantAlgorithmBenchmark extends BenchmarkBase {
  const ConstantAlgorithmBenchmark(super.name, this.data);

  final List<String> data;

  @override
  void run() {
    constantTimeAlgorithm(data);
  }
}

void main() {
  final benchmarks = [
    ConstantAlgorithmBenchmark('S', Names.s),
    ConstantAlgorithmBenchmark('M', Names.m),
    ConstantAlgorithmBenchmark('L', Names.l),
    ConstantAlgorithmBenchmark('XL', Names.xl),
  ];

  for (final b in benchmarks) {
    b.report();
  }
}
