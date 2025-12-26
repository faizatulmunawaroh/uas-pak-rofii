import 'package:celoe/models/course.dart';
import 'package:celoe/screens/course_detail_screen.dart';
import 'package:celoe/theme.dart';
import 'package:flutter/material.dart';

class MyClassesScreen extends StatefulWidget {
  const MyClassesScreen({super.key});

  @override
  State<MyClassesScreen> createState() => _MyClassesScreenState();
}

class _MyClassesScreenState extends State<MyClassesScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Course> _filteredCourses = dummyCourses;

  void _filterCourses(String query) {
    setState(() {
      _filteredCourses = dummyCourses
          .where((course) =>
              course.title.toLowerCase().contains(query.toLowerCase()) ||
              course.code.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // App Bar / Header area
        Container(
          padding: const EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 20),
          decoration: const BoxDecoration(
            color: CeloeTheme.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Kelas Saya",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _searchController,
                onChanged: _filterCourses,
                decoration: InputDecoration(
                  hintText: "Cari mata kuliah...",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                ),
              ),
            ],
          ),
        ),
        
        // Course List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _filteredCourses.length,
            itemBuilder: (context, index) {
              final course = _filteredCourses[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetailScreen(course: course),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                       BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 5, offset: const Offset(0, 2))
                    ]
                  ),
                  child: Row(
                     children: [
                       Container(
                         width: 60,
                         height: 80, // Taller for book cover aspect ratio
                         decoration: BoxDecoration(
                           color: Colors.primaries[course.title.length % Colors.primaries.length].shade100, 
                           borderRadius: BorderRadius.circular(8),
                           image: course.imagePath != null
                              ? DecorationImage(
                                  image: AssetImage(course.imagePath!),
                                  fit: BoxFit.cover
                                )
                              : null
                         ),
                          child: course.imagePath == null ? Center(
                           child: Text(
                             course.iconInitials, 
                             style: TextStyle(
                               color: Colors.primaries[course.title.length % Colors.primaries.length].shade900,
                               fontWeight: FontWeight.bold,
                               fontSize: 14
                              )
                            ),
                         ) : null,
                       ),
                       const SizedBox(width: 12),
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(course.semester, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                                 Container(
                                   padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                   decoration: BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(4)),
                                   child: Text("Aktif", style: TextStyle(fontSize: 10, color: Colors.green.shade800)),
                                 )
                               ],
                             ),
                             const SizedBox(height: 4),
                             Text(course.title, maxLines: 2, overflow: TextOverflow.ellipsis, 
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                              Text(course.code, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                              const SizedBox(height: 8),
                              LinearProgressIndicator(
                                value: course.progress,
                                color: CeloeTheme.primaryColor,
                                backgroundColor: Colors.grey.shade200,
                                minHeight: 6,
                                borderRadius: BorderRadius.circular(4),
                              ),
                               const SizedBox(height: 4),
                               Text("${(course.progress * 100).toInt()}% Selesai", style: const TextStyle(fontSize: 10))
                           ],
                         ),
                       )
                     ],
                   ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
