import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Configurações',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        scaffoldBackgroundColor: const Color(0xFFF4F5FA),
      ),
      home: const ConfiguracoesPage(),
    );
  }
}

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  bool wifi = true;
  bool bluetooth = false;
  bool modoAviao = false;
  bool modoEscuro = false;
  bool notificacoes = true;
  double brilho = 0.6;

  void _mostrarMensagem(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(texto),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cor = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configurações',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _mostrarMensagem('Busca em breve'),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => _mostrarMensagem('Mais opções'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ---------- CARD DE PERFIL ----------
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [cor.primary, cor.tertiary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: cor.primary.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 36, color: Colors.indigo),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Seu Nome',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'seuemail@exemplo.com',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  onPressed: () => _mostrarMensagem('Editar perfil'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ---------- CONEXÕES ----------
          _titulo('Conexões'),
          _card([
            SwitchListTile(
              secondary: _icone(Icons.wifi, Colors.blue),
              title: const Text('Wi-Fi'),
              subtitle: Text(wifi ? 'Conectado' : 'Desligado'),
              value: wifi,
              onChanged: (v) => setState(() => wifi = v),
            ),
            const Divider(height: 0, indent: 72),
            SwitchListTile(
              secondary: _icone(Icons.bluetooth, Colors.lightBlue),
              title: const Text('Bluetooth'),
              subtitle: Text(bluetooth ? 'Ligado' : 'Desligado'),
              value: bluetooth,
              onChanged: (v) => setState(() => bluetooth = v),
            ),
            const Divider(height: 0, indent: 72),
            SwitchListTile(
              secondary: _icone(Icons.airplanemode_active, Colors.orange),
              title: const Text('Modo avião'),
              value: modoAviao,
              onChanged: (v) => setState(() => modoAviao = v),
            ),
          ]),

          const SizedBox(height: 24),

          // ---------- EXIBIÇÃO ----------
          _titulo('Exibição'),
          _card([
            SwitchListTile(
              secondary: _icone(Icons.dark_mode, Colors.deepPurple),
              title: const Text('Modo escuro'),
              value: modoEscuro,
              onChanged: (v) => setState(() => modoEscuro = v),
            ),
            const Divider(height: 0, indent: 72),
            ListTile(
              leading: _icone(Icons.brightness_6, Colors.amber),
              title: const Text('Brilho'),
              subtitle: Slider(
                value: brilho,
                onChanged: (v) => setState(() => brilho = v),
              ),
              trailing: Text('${(brilho * 100).round()}%'),
            ),
          ]),

          const SizedBox(height: 24),

          // ---------- GERAL ----------
          _titulo('Geral'),
          _card([
            SwitchListTile(
              secondary: _icone(Icons.notifications, Colors.red),
              title: const Text('Notificações'),
              value: notificacoes,
              onChanged: (v) => setState(() => notificacoes = v),
            ),
            const Divider(height: 0, indent: 72),
            ListTile(
              leading: _icone(Icons.language, Colors.green),
              title: const Text('Idioma'),
              subtitle: const Text('Português (Brasil)'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SobrePage()),
              ),
            ),
            const Divider(height: 0, indent: 72),
            ListTile(
              leading: _icone(Icons.info_outline, Colors.teal),
              title: const Text('Sobre'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SobrePage()),
              ),
            ),
          ]),

          const SizedBox(height: 24),

          // ---------- BOTÕES ----------
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => _mostrarMensagem('Configurações salvas!'),
                  icon: const Icon(Icons.save),
                  label: const Text('Salvar'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      wifi = true;
                      bluetooth = false;
                      modoAviao = false;
                      modoEscuro = false;
                      notificacoes = true;
                      brilho = 0.6;
                    });
                    _mostrarMensagem('Configurações restauradas');
                  },
                  icon: const Icon(Icons.restore),
                  label: const Text('Restaurar'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          TextButton.icon(
            onPressed: () => _confirmarSair(context),
            icon: const Icon(Icons.logout, color: Colors.red),
            label: const Text('Sair da conta', style: TextStyle(color: Colors.red)),
          ),

          const SizedBox(height: 24),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _mostrarMensagem('Ajuda'),
        icon: const Icon(Icons.help_outline),
        label: const Text('Ajuda'),
      ),
    );
  }

  // ---------- WIDGETS AUXILIARES ----------

  Widget _titulo(String texto) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Text(
        texto.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }

  Widget _card(List<Widget> children) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Column(children: children),
    );
  }

  Widget _icone(IconData icone, Color cor) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: cor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icone, color: cor),
    );
  }

  void _confirmarSair(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Sair da conta?'),
        content: const Text('Você precisará fazer login novamente.'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              _mostrarMensagem('Você saiu da conta');
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Sair'),
          ),
        ],
      ),
    );
  }
}

// ---------- SEGUNDA TELA ----------

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre')),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.flutter_dash, size: 80, color: Colors.indigo),
            SizedBox(height: 16),
            Text(
              'Meu App Flutter',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('Versão 1.0.0'),
          ],
        ),
      ),
    );
  }
}