class Course {
  final String title;
  final String code;
  final double progress;
  final String semester;
  final String iconInitials;
  final String? imagePath;

  Course({
    required this.title,
    required this.code,
    required this.progress,
    required this.semester,
    required this.iconInitials,
    this.imagePath,
  });
}

final List<Course> dummyCourses = [
  Course(
    title: "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
    code: "D4SM-42-03 [ADY]",
    progress: 0.8,
    semester: "2021/2",
    iconInitials: "UI/UX",
  ),
  Course(
    title: "KEWARGANEGARAAN",
    code: "D4SM-41-GAB1 [BBO], JUMAT 2",
    progress: 0.65,
    semester: "2021/2",
    iconInitials: "KWN",
    imagePath: "assets/images/kwn.jpg",
  ),
   Course(
    title: "SISTEM OPERASI",
    code: "D4SM-44-02 [DD6]",
    progress: 0.5,
    semester: "2021/2",
    iconInitials: "SO",
    imagePath: "assets/images/os.jpg",
  ),
  Course(
    title: "PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA",
    code: "D4SM-41-GAB1 [APJ]",
    progress: 0.3,
    semester: "2021/2",
    iconInitials: "MOB",
    imagePath: "assets/images/mobile.jpg",
  ),
   Course(
    title: "BAHASA INGGRIS: BUSINESS AND SCIENTIFIC",
    code: "D4SM-41-GAB1 [ARS]",
    progress: 0.3,
    semester: "2021/2",
    iconInitials: "ENG",
    imagePath: "assets/images/english.jpg",
  ),
  Course(
    title: "PEMROGRAMAN MULTIMEDIA INTERAKTIF",
    code: "D4SM-43-04 [TPR]",
    progress: 0.6,
    semester: "2021/2",
    iconInitials: "MMI",
    imagePath: "assets/images/multimedia.jpg",
  ),
    Course(
    title: "OLAH RAGA",
    code: "D3TT-44-02 [EYR]",
    progress: 0.1,
    semester: "2021/2",
    iconInitials: "OR",
  ),
];
