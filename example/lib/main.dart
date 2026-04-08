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
  final BiometricVault _vault = BiometricVaultImpl();
  final TextEditingController _controller = TextEditingController();
  String _status = 'Check availability to start';
  bool _allowPin = false;

  Future<void> _checkAvailability() async {
    final availability = await _vault.checkAvailability();
    setState(() {
      _status = availability.when(
        available: () => 'Biometrics Available',
        noHardware: () => 'No Biometric Hardware',
        notEnrolled: () => 'Biometrics Not Enrolled',
        unsupported: () => 'Platform Not Supported',
      );
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

    result.when(
      success: (_) => _showSnackBar('Secret saved securely!'),
      userCanceled: () => _showSnackBar('Setup canceled'),
      failure: (msg) => _showSnackBar('Error: $msg'),
      lockout: () => _showSnackBar('Biometrics locked'),
      permanentlyLockout: () => _showSnackBar('Permanently locked'),
      biometricsChanged: () => _showSnackBar('Biometrics changed!'),
      empty: () => _showSnackBar('Empty'),
    );
  }

  Future<void> _readSecret() async {
    final result = await _vault.read(
      key: 'my_secret',
      promptMessage: 'Authenticate to view your secret',
      allowDevicePassword: _allowPin,
    );

    result.when(
      success: (data) =>
          _showDialog('Secret Retrieved', 'Your secret is: $data'),
      userCanceled: () => _showSnackBar('Authentication canceled'),
      empty: () => _showSnackBar('No secret found. Save one first.'),
      biometricsChanged: () =>
          _showSnackBar('Security Alert: Biometrics changed!'),
      failure: (msg) => _showSnackBar('Error: $msg'),
      lockout: () => _showSnackBar('Locked out'),
      permanentlyLockout: () => _showSnackBar('Permanently locked'),
    );
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
