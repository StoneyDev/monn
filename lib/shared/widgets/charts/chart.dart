import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart.freezed.dart';

@freezed
class Chart with _$Chart {
  const factory Chart({
    required double totalAmount,
    required List<ChartData> data,
  }) = _Chart;
}

@freezed
class ChartData with _$ChartData {
  const factory ChartData({
    required double portion,
    required Color color,
  }) = _ChartData;
}
