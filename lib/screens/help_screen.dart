import 'package:celoe/theme.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text("Bantuan", style: TextStyle(color: Colors.white)),
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
                  Icon(Icons.help_outline, size: 80, color: Colors.white),
                  SizedBox(height: 16),
                  Text(
                    "Pusat Bantuan CeLOE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Kami siap membantu Anda",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Contact Support
                  const Text(
                    "Hubungi Kami",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  
                  _buildContactCard(
                    icon: Icons.email,
                    title: "Email Support",
                    subtitle: "support@celoe.ac.id",
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _buildContactCard(
                    icon: Icons.phone,
                    title: "Telepon",
                    subtitle: "(022) 1234-5678",
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _buildContactCard(
                    icon: Icons.chat,
                    title: "Live Chat",
                    subtitle: "Senin - Jumat, 08:00 - 17:00 WIB",
                    onTap: () {},
                  ),

                  const SizedBox(height: 32),

                  // FAQ Section
                  const Text(
                    "Pertanyaan Umum (FAQ)",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  _buildFAQItem(
                    question: "Bagaimana cara login ke CeLOE?",
                    answer: "Gunakan email 365 dan password yang sama dengan akun Microsoft 365 kampus Anda.",
                  ),
                  _buildFAQItem(
                    question: "Lupa password, apa yang harus dilakukan?",
                    answer: "Klik tombol 'Bantuan ?' pada halaman login, kemudian pilih 'Reset Password'. Ikuti instruksi yang diberikan.",
                  ),
                  _buildFAQItem(
                    question: "Bagaimana cara mengumpulkan tugas?",
                    answer: "Buka halaman detail tugas, scroll ke bawah ke bagian 'Pengumpulan Tugas', kemudian klik tombol 'Pilih File' untuk upload file Anda.",
                  ),
                  _buildFAQItem(
                    question: "Batas maksimal ukuran file yang bisa diupload?",
                    answer: "Batas maksimal ukuran file adalah 10 MB per file. Untuk file yang lebih besar, gunakan link Google Drive atau OneDrive.",
                  ),
                  _buildFAQItem(
                    question: "Bagaimana cara melihat nilai?",
                    answer: "Nilai akan ditampilkan di halaman detail tugas setelah dosen selesai melakukan penilaian.",
                  ),

                  const SizedBox(height: 32),

                  // Tutorial
                  const Text(
                    "Tutorial",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  _buildTutorialCard(
                    icon: Icons.play_circle_outline,
                    title: "Tutorial Menggunakan CeLOE",
                    subtitle: "Video panduan lengkap",
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _buildTutorialCard(
                    icon: Icons.description,
                    title: "Panduan Pengguna PDF",
                    subtitle: "Download panduan lengkap",
                    onTap: () {},
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

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
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
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: CeloeTheme.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: CeloeTheme.primaryColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem({required String question, required String answer}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              answer,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTutorialCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [CeloeTheme.primaryColor, Color(0xFF8B0000)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: CeloeTheme.primaryColor.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
