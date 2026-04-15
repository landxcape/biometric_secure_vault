import 'package:flutter/material.dart';
import 'package:biometric_secure_vault/biometric_secure_vault.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biometric Vault Example',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const ExampleHome(),
    );
  }
}

class ExampleHome extends StatefulWidget {
  const ExampleHome({super.key});

  @override
  State<ExampleHome> createState() => _ExampleHomeState();
}

class _ExampleHomeState extends State<ExampleHome> {
  final BiometricVault _vault = BiometricVault();
  final TextEditingController _controller = TextEditingController();
  String _status = 'Check availability to start';
  bool _allowPin = false;

  Future<void> _checkAvailability() async {
    final availability = await _vault.checkAvailability();
    setState(() {
      _status = switch (availability) {
        BiometricAvailable() => 'Biometrics Available',
        BiometricNoHardware() => 'No Biometric Hardware',
        BiometricNotEnrolled() => 'Biometrics Not Enrolled',
        BiometricUnsupported() => 'Platform Not Supported',
      };
    });
  }

  Future<void> _saveSecret() async {
    if (_controller.text.isEmpty) {
      _showSnackBar('Please enter a secret first');
      return;
    }

    final result = await _vault.write(
      key: 'my_secret',
      value: _controller.text,
      promptMessage: 'Authorize to save your secret',
      allowDevicePassword: _allowPin,
    );

    final message = switch (result) {
      VaultResultSuccess() => 'Secret saved securely!',
      VaultResultUserCanceled() => 'Setup canceled',
      VaultResultFailure(:final message) => 'Error: $message',
      VaultResultLockout() => 'Biometrics locked',
      VaultResultPermanentlyLockout() => 'Permanently locked',
      VaultResultBiometricsChanged() => 'Biometrics changed!',
      VaultResultEmpty() => 'Empty',
    };
    _showSnackBar(message);
  }

  Future<void> _readSecret() async {
    final result = await _vault.read(
      key: 'my_secret',
      promptMessage: 'Authenticate to view your secret',
      allowDevicePassword: _allowPin,
    );

    switch (result) {
      case VaultResultSuccess(:final data):
        _showDialog('Secret Retrieved', 'Your secret is: $data');
      case VaultResultUserCanceled():
        _showSnackBar('Authentication canceled');
      case VaultResultEmpty():
        _showSnackBar('No secret found. Save one first.');
      case VaultResultBiometricsChanged():
        _showSnackBar('Security Alert: Biometrics changed!');
      case VaultResultFailure(:final message):
        _showSnackBar('Error: $message');
      case VaultResultLockout():
        _showSnackBar('Locked out');
      case VaultResultPermanentlyLockout():
        _showSnackBar('Permanently locked');
    }
  }

  void _showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _showDialog(String title, String body) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biometric Vault Example')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Status: $_status',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Secret Data',
                hintText: 'Enter something to hide behind FaceID',
                border: OutlineInputBorder(),
              ),
            ),
            CheckboxListTile(
              title: const Text('Allow PIN/Passcode Fallback'),
              value: _allowPin,
              onChanged: (val) => setState(() => _allowPin = val ?? false),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: _checkAvailability,
                  child: const Text('Check Hardware'),
                ),
                ElevatedButton(
                  onPressed: _saveSecret,
                  child: const Text('Save Secret'),
                ),
                ElevatedButton(
                  onPressed: _readSecret,
                  child: const Text('Read Secret'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
