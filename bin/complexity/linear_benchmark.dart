import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:dsad/complexity.dart';

import 'utils/names.dart';

class LinearAlgorithmBenchmark extends BenchmarkBase {
  const LinearAlgorithmBenchmark(super.name, this.data);

  final List<String> data;

  @override
  void run() {
    linearTimeAlgorithm(data);
  }
}

void main() {
  final benchmarks = [
    LinearAlgorithmBenchmark('S', Names.s),
    LinearAlgorithmBenchmark('M', Names.m),
    LinearAlgorithmBenchmark('L', Names.l),
    LinearAlgorithmBenchmark('XL', Names.xl),
  ];

  for (final b in benchmarks) {
    b.report();
  }
}
