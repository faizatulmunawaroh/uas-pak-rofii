enum AnnouncementCategory {
  academic,
  technical,
  event,
  general,
}

class Announcement {
  final String id;
  final String title;
  final String content;
  final DateTime publishDate;
  final AnnouncementCategory category;
  final String? imageUrl;

  Announcement({
    required this.id,
    required this.title,
    required this.content,
    required this.publishDate,
    required this.category,
    this.imageUrl,
  });
}

final List<Announcement> dummyAnnouncements = [
  Announcement(
    id: '1',
    title: 'Maintenance Pra UAS Semester Genap 2020/2021',
    content: 'Sistem CeLOE akan melakukan maintenance pada tanggal 25-26 Februari 2021 pukul 00.00 - 06.00 WIB. Mohon maaf atas ketidaknyamanannya.',
    publishDate: DateTime(2021, 2, 20),
    category: AnnouncementCategory.technical,
  ),
  Announcement(
    id: '2',
    title: 'Jadwal UAS Semester Genap 2020/2021',
    content: 'Ujian Akhir Semester akan dilaksanakan mulai tanggal 1 Maret 2021. Silahkan cek jadwal lengkap di portal akademik.',
    publishDate: DateTime(2021, 2, 15),
    category: AnnouncementCategory.academic,
  ),
  Announcement(
    id: '3',
    title: 'Webinar: Future of UI/UX Design',
    content: 'Ikuti webinar gratis tentang tren terkini dalam UI/UX Design. Kamis, 4 Maret 2021 pukul 19.00 WIB.',
    publishDate: DateTime(2021, 2, 22),
    category: AnnouncementCategory.event,
  ),
  Announcement(
    id: '4',
    title: 'Perpanjangan Deadline Tugas Pemrograman Mobile',
    content: 'Deadline tugas pemrograman mobile diperpanjang hingga 5 Maret 2021 pukul 23:59 WIB.',
    publishDate: DateTime(2021, 2, 24),
    category: AnnouncementCategory.academic,
  ),
];
