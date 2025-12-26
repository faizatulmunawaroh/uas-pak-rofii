import 'package:celoe/providers/app_state.dart';
import 'package:celoe/screens/login_screen.dart';
import 'package:celoe/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _emailNotifications = true;
  bool _pushNotifications = true;
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedLanguage = 'Bahasa Indonesia';
  bool _autoDownloadMaterials = false;
  bool _wifiOnlyDownload = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text("Pengaturan", style: TextStyle(color: Colors.white)),
        backgroundColor: CeloeTheme.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: CeloeTheme.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Column(
                children: [
                  Icon(Icons.settings, size: 60, color: Colors.white),
                  SizedBox(height: 12),
                  Text(
                    "Atur Preferensi Anda",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Notifikasi Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Notifikasi",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  _buildSettingCard(
                    child: Column(
                      children: [
                        _buildSwitchTile(
                          title: "Aktifkan Notifikasi",
                          subtitle: "Terima notifikasi dari aplikasi",
                          value: _notificationsEnabled,
                          onChanged: (value) {
                            setState(() {
                              _notificationsEnabled = value;
                            });
                          },
                          icon: Icons.notifications_active,
                        ),
                        const Divider(height: 1),
                        _buildSwitchTile(
                          title: "Email Notifikasi",
                          subtitle: "Kirim notifikasi ke email",
                          value: _emailNotifications,
                          onChanged: (value) {
                            setState(() {
                              _emailNotifications = value;
                            });
                          },
                          icon: Icons.email,
                        ),
                        const Divider(height: 1),
                        _buildSwitchTile(
                          title: "Push Notifikasi",
                          subtitle: "Notifikasi push ke perangkat",
                          value: _pushNotifications,
                          onChanged: (value) {
                            setState(() {
                              _pushNotifications = value;
                            });
                          },
                          icon: Icons.message,
                        ),
                        const Divider(height: 1),
                        _buildSwitchTile(
                          title: "Suara",
                          subtitle: "Bunyi notifikasi",
                          value: _soundEnabled,
                          onChanged: (value) {
                            setState(() {
                              _soundEnabled = value;
                            });
                          },
                          icon: Icons.volume_up,
                        ),
                        const Divider(height: 1),
                        _buildSwitchTile(
                          title: "Getar",
                          subtitle: "Getar saat ada notifikasi",
                          value: _vibrationEnabled,
                          onChanged: (value) {
                            setState(() {
                              _vibrationEnabled = value;
                            });
                          },
                          icon: Icons.vibration,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Tampilan Section
                  const Text(
                    "Tampilan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  _buildSettingCard(
                    child: Column(
                      children: [
                        _buildSwitchTile(
                          title: "Mode Gelap",
                          subtitle: "Gunakan tema gelap",
                          value: _darkModeEnabled,
                          onChanged: (value) {
                            setState(() {
                              _darkModeEnabled = value;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Fitur mode gelap akan segera tersedia"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          icon: Icons.dark_mode,
                        ),
                        const Divider(height: 1),
                        _buildTapTile(
                          title: "Bahasa",
                          subtitle: _selectedLanguage,
                          icon: Icons.language,
                          onTap: () {
                            _showLanguageDialog();
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Download & Storage
                  const Text(
                    "Download & Penyimpanan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  _buildSettingCard(
                    child: Column(
                      children: [
                        _buildSwitchTile(
                          title: "Auto Download Materi",
                          subtitle: "Otomatis download materi baru",
                          value: _autoDownloadMaterials,
                          onChanged: (value) {
                            setState(() {
                              _autoDownloadMaterials = value;
                            });
                          },
                          icon: Icons.download,
                        ),
                        const Divider(height: 1),
                        _buildSwitchTile(
                          title: "Download Hanya WiFi",
                          subtitle: "Download hanya saat terhubung WiFi",
                          value: _wifiOnlyDownload,
                          onChanged: (value) {
                            setState(() {
                              _wifiOnlyDownload = value;
                            });
                          },
                          icon: Icons.wifi,
                        ),
                        const Divider(height: 1),
                        _buildTapTile(
                          title: "Bersihkan Cache",
                          subtitle: "Hapus file temporary",
                          icon: Icons.cleaning_services,
                          onTap: () {
                            _showClearCacheDialog();
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Akun Section
                  const Text(
                    "Akun",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  _buildSettingCard(
                    child: Column(
                      children: [
                        _buildTapTile(
                          title: "Ubah Password",
                          subtitle: "Ganti password akun Anda",
                          icon: Icons.lock,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Fitur ubah password akan segera tersedia"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                        ),
                        const Divider(height: 1),
                        _buildTapTile(
                          title: "Privasi",
                          subtitle: "Atur pengaturan privasi",
                          icon: Icons.privacy_tip,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Fitur privasi akan segera tersedia"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Tentang Section
                  const Text(
                    "Tentang",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  _buildSettingCard(
                    child: Column(
                      children: [
                        _buildTapTile(
                          title: "Versi Aplikasi",
                          subtitle: "1.0.0",
                          icon: Icons.info,
                          onTap: () {},
                        ),
                        const Divider(height: 1),
                        _buildTapTile(
                          title: "Syarat & Ketentuan",
                          subtitle: "Baca syarat penggunaan",
                          icon: Icons.description,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Syarat & ketentuan akan segera tersedia"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                        ),
                        const Divider(height: 1),
                        _buildTapTile(
                          title: "Kebijakan Privasi",
                          subtitle: "Baca kebijakan privasi",
                          icon: Icons.policy,
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Kebijakan privasi akan segera tersedia"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _showLogoutDialog();
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text("Keluar"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade900,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: child,
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    required IconData icon,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: CeloeTheme.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: CeloeTheme.primaryColor, size: 24),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: CeloeTheme.primaryColor,
      ),
    );
  }

  Widget _buildTapTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: CeloeTheme.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: CeloeTheme.primaryColor, size: 24),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Pilih Bahasa"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: const Text("Bahasa Indonesia"),
              value: "Bahasa Indonesia",
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
                Navigator.pop(context);
              },
              activeColor: CeloeTheme.primaryColor,
            ),
            RadioListTile<String>(
              title: const Text("English"),
              value: "English",
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("English language will be available soon"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              activeColor: CeloeTheme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  void _showClearCacheDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Bersihkan Cache"),
        content: const Text(
          "Apakah Anda yakin ingin menghapus semua file cache? "
          "Ini akan menghapus file temporary dan data yang di-cache.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Cache berhasil dibersihkan"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text("Hapus", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Keluar"),
        content: const Text("Apakah Anda yakin ingin keluar dari aplikasi?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () async {
              final appState = Provider.of<AppState>(context, listen: false);
              await appState.logout();
              
              if (mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              }
            },
            child: const Text("Keluar", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
