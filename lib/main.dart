import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const TropaNgApp());
}

class TropaNgApp extends StatelessWidget {
  const TropaNgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'oh_nego_ttk',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0B0D),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const orange = Color(0xFFE87516);
  static const card = Color(0xFFF7F7F4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 700;
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF050505),
                  Color(0xFF111114),
                  Color(0xFFEDEDF2),
                ],
                stops: [0.0, 0.38, 0.72],
              ),
            ),
            child: SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: wide ? 620 : 520),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: wide ? 32 : 18,
                      vertical: 12,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 4),
                        _header(),
                        const SizedBox(height: 22),
                        _socials(),
                        const SizedBox(height: 30),
                        _link(
                          '⚡',
                          'Site / Portfólio',
                          () => launchUrl(
                            Uri.parse(
                              'https://brunofelipe320yq-ops.github.io/ohnegottk.github.io/',
                            ),
                          ),
                        ),
                        _link(
                          '💬',
                          'Discord',
                          () => launchUrl(
                            Uri.parse('https://discord.gg/8BzYMyrkF'),
                          ),
                        ),
                        _link(
                          '♪',
                          'TikTok',
                          () => launchUrl(
                            Uri.parse('https://www.tiktok.com/@oh_nego_ttk'),
                          ),
                        ),
                        _link(
                          '📸',
                          'Instagram',
                          () => launchUrl(
                            Uri.parse('https://www.instagram.com/oh_nego_ofc'),
                          ),
                        ),
                        _link(
                          '▶',
                          'YouTube',
                          () => launchUrl(
                            Uri.parse('https://www.youtube.com/@oh_nego_ofc'),
                          ),
                        ),
                        const SizedBox(height: 26),
                        const Text(
                          'TROPA DO NG • SENSIBILIDADE & COMUNIDADE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF444448),
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.4,
                          ),
                        ),
                        const SizedBox(height: 18),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _header() {
    return Container(
      height: 430,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 30,
            offset: Offset(0, 15),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/header_reference.jpg',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Color(0xFF25252B)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Center(
                child: Icon(Icons.person, size: 120, color: Colors.white24),
              ),
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0x22000000),
                  Color(0xF2F1F1F4),
                ],
                stops: [0.0, 0.38, 0.58, 1.0],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 35,
            child: Column(
              children: [
                Text(
                  'NEGO-TTK',
                  style: TextStyle(
                    color: orange,
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4,
                    shadows: const [
                      Shadow(
                        color: Colors.black54,
                        blurRadius: 10,
                        offset: Offset(2, 3),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'TROPA DO NG',
                  style: TextStyle(
                    color: Color(0xFF29292D),
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _socials() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _social(Icons.music_note, 'TikTok'),
        _social(Icons.camera_alt_outlined, 'Instagram'),
        _social(Icons.play_arrow_rounded, 'YouTube'),
      ],
    );
  }

  Widget _social(IconData icon, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Icon(icon, color: orange, size: 34),
      ),
    );
  }

  Widget _link(String icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(50),
          child: Ink(
            height: 75,
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: const Color(0xFF17171A), width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                const SizedBox(width: 24),
                Text(
                  icon,
                  style: const TextStyle(
                    color: Color(0xFF17171A),
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF17171A),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
