import 'package:flutter/material.dart';
import '../widgets/dojo_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController(text: 'Raphael');
  final _email = TextEditingController(text: 'raphael@example.com');
  final _phone = TextEditingController(text: '(21) 99999-9999');

  final _oldPass = TextEditingController();
  final _newPass = TextEditingController();
  final _confirmPass = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _oldPass.dispose();
    _newPass.dispose();
    _confirmPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DojoAppBar(title: 'Perfil'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dados pessoais',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(labelText: 'Nome'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(labelText: 'E-mail'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _phone,
                      decoration: const InputDecoration(labelText: 'Telefone'),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Dados salvos (mock).'),
                            ),
                          );
                        },
                        child: const Text('Salvar alterações'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Divider(color: Colors.white10),
              const SizedBox(height: 24),
              Text(
                'Dados de acesso',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _oldPass,
                decoration: const InputDecoration(labelText: 'Senha atual'),
                obscureText: true,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _newPass,
                decoration: const InputDecoration(labelText: 'Nova senha'),
                obscureText: true,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _confirmPass,
                decoration: const InputDecoration(
                  labelText: 'Confirmar nova senha',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    if (_newPass.text.isNotEmpty &&
                        _newPass.text == _confirmPass.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Senha alterada (mock).')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('As senhas não conferem.'),
                        ),
                      );
                    }
                  },
                  child: const Text('Alterar senha'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
