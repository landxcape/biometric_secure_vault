import 'package:flutter_test/flutter_test.dart';
import 'package:biometric_secure_vault/biometric_secure_vault.dart';

void main() {
  group('VaultResult', () {
    test('success holds correct data', () {
      const result = VaultResult.success('secret');
      expect(result, isA<VaultResultSuccess<String>>());
      expect((result as VaultResultSuccess<String>).data, equals('secret'));
    });

    test('pattern matching works for union cases', () {
      const VaultResult<int> result = VaultResult.empty();
      final message = switch (result) {
        VaultResultSuccess(:final data) => 'Got $data',
        VaultResultEmpty() => 'Not found',
        VaultResultUserCanceled() => 'Canceled',
        VaultResultLockout() => 'Locked',
        VaultResultPermanentlyLockout() => 'Perm locked',
        VaultResultBiometricsChanged() => 'Changed',
        VaultResultFailure(:final message) => 'Failed: $message',
      };
      expect(message, equals('Not found'));
    });
  });
}
