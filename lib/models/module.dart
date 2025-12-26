class Module {
  final String id;
  final String title;
  final String description;
  final String courseCode;
  final bool isCompleted;
  final String type; // 'video', 'document', 'quiz'

  Module({
    required this.id,
    required this.title,
    required this.description,
    required this.courseCode,
    required this.isCompleted,
    required this.type,
  });
}

final List<Module> dummyModules = [
  Module(
    id: '1',
    title: 'Pengenalan UI/UX Design',
    description: 'Materi dasar tentang prinsip-prinsip UI/UX design',
    courseCode: 'D4SM-42-03',
    isCompleted: true,
    type: 'video',
  ),
  Module(
    id: '2',
    title: 'Wireframing dan Prototyping',
    description: 'Teknik membuat wireframe dan prototype',
    courseCode: 'D4SM-42-03',
    isCompleted: true,
    type: 'document',
  ),
  Module(
    id: '3',
    title: 'User Research',
    description: 'Metode riset pengguna untuk desain yang lebih baik',
    courseCode: 'D4SM-42-03',
    isCompleted: false,
    type: 'video',
  ),
  Module(
    id: '4',
    title: 'Quiz 1 - Dasar UI/UX',
    description: 'Kuis untuk menguji pemahaman materi dasar',
    courseCode: 'D4SM-42-03',
    isCompleted: false,
    type: 'quiz',
  ),
  Module(
    id: '5',
    title: 'Pengenalan Sistem Operasi',
    description: 'Konsep dasar sistem operasi',
    courseCode: 'D4SM-44-02',
    isCompleted: true,
    type: 'video',
  ),
  Module(
    id: '6',
    title: 'Manajemen Proses',
    description: 'Cara kerja proses dalam sistem operasi',
    courseCode: 'D4SM-44-02',
    isCompleted: false,
    type: 'document',
  ),
];
