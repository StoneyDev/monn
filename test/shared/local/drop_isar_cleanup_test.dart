import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('repo no longer contains Isar runtime or generator references', () {
    const forbiddenIsarReferences = [
      'isar:',
      'isar_community',
      'isar_flutter_libs',
      'package:isar/isar.dart',
      'isar_generator',
      '@collection',
      'IsarLinks',
      'MigrationService',
    ];

    final grep = Process.runSync(
      'git',
      [
        'grep',
        '-l',
        '-F',
        for (final reference in forbiddenIsarReferences) ...[
          '-e',
          reference,
        ],
        '--',
        '*.dart',
        '*.yaml',
        '*.lock',
        ':!test/shared/local/drop_isar_cleanup_test.dart',
      ],
      workingDirectory: Directory.current.path,
    );

    expect(grep.exitCode, anyOf(0, 1), reason: grep.stderr.toString());

    final offenders = grep.exitCode == 0
        ? grep.stdout
              .toString()
              .split('\n')
              .where((path) => path.isNotEmpty)
              .toList()
        : <String>[];

    expect(offenders, isEmpty);
  });
}
