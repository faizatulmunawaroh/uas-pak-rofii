import 'package:celoe/models/assignment.dart';
import 'package:celoe/models/course.dart';
import 'package:celoe/screens/my_classes_screen.dart';
import 'package:celoe/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hide back button
        backgroundColor: CeloeTheme.primaryColor,
        toolbarHeight: 100, // Taller app bar for profile info
        title: Row(
          children: [
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Halo,", style: TextStyle(color: Colors.white, fontSize: 14)),
                const Text("DANDY CANDRA PRATAMA", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
             const Spacer(),
             Container(
               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
               decoration: BoxDecoration(
                 color: const Color(0xFFA51B1B), // Slightly darker red
                 borderRadius: BorderRadius.circular(20),
                 border: Border.all(color: Colors.white24)
               ),
               child: Row(
                 mainAxisSize: MainAxisSize.min,
                 children: const [
                   Text("MAHASISWA", style: TextStyle(color: Colors.white, fontSize: 12)),
                   SizedBox(width: 8),
                   CircleAvatar(
                     radius: 12,
                     backgroundColor: Colors.white,
                     child: Icon(Icons.person, size: 16, color: CeloeTheme.primaryColor),
                   )
                 ],
               ),
             )
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFFA51B1B), // Dark red
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white60,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
               BottomNavigationBarItem(icon: Icon(Icons.school), label: "Kelas Saya"),
                BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifikasi"),
            ],
          ),
        ),
      ),
    );
  }

  static List<Widget> get _widgetOptions => <Widget>[
    const HomeContent(),
    const MyClassesScreen(),
    const Center(child: Text("Notifikasi (Segera Hadir)")),
  ];
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             // Upcoming Tasks Section
             const Text("Tugas Yang Akan Datang", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
             const SizedBox(height: 10),
             Container(
               width: double.infinity,
               padding: const EdgeInsets.all(16),
               decoration: BoxDecoration(
                 color: CeloeTheme.primaryColor,
                 borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 4))
                  ]
               ),
               child: Column(
                 children: [
                   Text(
                     nextAssignment.course.toUpperCase(),
                     style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                     textAlign: TextAlign.center,
                   ),
                   const SizedBox(height: 10),
                   Text(
                     nextAssignment.title,
                     style: const TextStyle(color: Colors.white, fontSize: 14),
                     textAlign: TextAlign.center,
                   ),
                    const SizedBox(height: 20),
                    const Divider(color: Colors.white24),
                    const SizedBox(height: 5),
                     Text(
                     "Waktu Pengumpulan\n${nextAssignment.dueDate}",
                     style: const TextStyle(color: Colors.white, fontSize: 12),
                     textAlign: TextAlign.center,
                   ),
                 ],
               ),
             ),

             const SizedBox(height: 24),

             // Announcements
             const Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Pengumuman Terakhir", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                 Text("Lihat Semua", style: TextStyle(color: Colors.blue, fontSize: 12)),
               ],
             ),
             const SizedBox(height: 10),
              const Text("Maintenance Pra UAS Semester Genap 2020/2021", style: TextStyle(fontSize: 12)),
               const SizedBox(height: 8),
             Container(
               height: 150,
               width: double.infinity,
               decoration: BoxDecoration(
                 color: Colors.blue.shade50,
                 borderRadius: BorderRadius.circular(8),
               ),
               child: const Center(
                 child: Icon(Icons.campaign, size: 50, color: Colors.blue), // Announcement placeholder
               ),
               // Image.asset('assets/announcement.png')
             ),

              const SizedBox(height: 24),
              // Class Progress
               const Text("Progres Kelas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
               const SizedBox(height: 10),

               ...dummyCourses.map((course) => Padding(
                 padding: const EdgeInsets.only(bottom: 16),
                 child: Row(
                   children: [
                     Container(
                       width: 80,
                       height: 80,
                       decoration: BoxDecoration(
                         color: Colors.primaries[course.title.length % Colors.primaries.length].shade100, // Randomish pastel color
                         borderRadius: BorderRadius.circular(8)
                       ),
                        child: Center(
                         child: Text(
                           course.iconInitials, 
                           style: TextStyle(
                             color: Colors.primaries[course.title.length % Colors.primaries.length].shade900,
                             fontWeight: FontWeight.bold,
                             fontSize: 18
                            )
                          ),
                       ),
                     ),
                     const SizedBox(width: 12),
                     Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(course.semester, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                           Text(course.title, maxLines: 2, overflow: TextOverflow.ellipsis, 
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                            Text(course.code, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: course.progress,
                              color: const Color(0xFFA51B1B),
                              backgroundColor: Colors.grey.shade200,
                              minHeight: 8,
                              borderRadius: BorderRadius.circular(4),
                            ),
                             const SizedBox(height: 4),
                             Text("${(course.progress * 100).toInt()}% Selesai", style: const TextStyle(fontSize: 10))
                         ],
                       ),
                     )
                   ],
                 ),
               )),

               const SizedBox(height: 80), // Padding for bottom nav
          ],
        ),
      );
  }
}
