
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  static const Color panelColor = Color(0xFF121212);

  final List<Map<String, String>> playlists = const [
    {
      'title': 'Lagu yang Disukai',
      'subtitle': 'Playlist • 8 lagu',
      'image': '',
    },
    {
      'title': 'Episodemu',
      'subtitle': 'Playlist • Episode',
      'image': '',
    },
    {
      'title': 'Playlist #5',
      'subtitle': 'Playlist • Firliaulia',
      'image':
          'https://images.unsplash.com/photo-1516280440614-37939bbacd81?w=150',
    },
    {
      'title': 'My playlist',
      'subtitle': 'Playlist • Firliaulia',
      'image':
          'https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=150',
    },
    {
      'title': 'Senja Bersuara',
      'subtitle': 'Podcast • Senja',
      'image':
          'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=150',
    },
    {
      'title': '17 Agustus',
      'subtitle': 'Playlist • Firliaulia',
      'image':
          'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 294,
      margin: const EdgeInsets.only(left: 10, bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // JUDUL KOLEKSI
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Koleksi Kamu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.white70),
              ),
              const Icon(
                Icons.open_in_full,
                color: Colors.white70,
                size: 17,
              ),
            ],
          ),

          const SizedBox(height: 8),

          // FILTER PLAYLIST
          Row(
            children: [
              _filter('Playlist'),
              const SizedBox(width: 8),
              _filter('Podcast'),
            ],
          ),

          const SizedBox(height: 18),

          // PENCARIAN KOLEKSI
          Row(
            children: [
              const Icon(Icons.search, color: Colors.white70, size: 21),
              const Spacer(),
              const Text(
                'Baru diputar',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.sort, color: Colors.white70),
            ],
          ),

          const SizedBox(height: 18),

          // DAFTAR PLAYLIST
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: playlists.length,
              itemBuilder: (context, index) {
                final playlist = playlists[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 13),
                  child: Row(
                    children: [
                      _playlistImage(
                        playlist['image']!,
                        index,
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              playlist['title']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              playlist['subtitle']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _filter(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF292929),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _playlistImage(String url, int index) {
    if (url.isEmpty) {
      return Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: index == 0
              ? const Color(0xFF7352D9)
              : const Color(0xFF008F61),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(
          index == 0 ? Icons.favorite : Icons.bookmark,
          color: Colors.white,
          size: 25,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(
        url,
        width: 48,
        height: 48,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 48,
            height: 48,
            color: const Color(0xFF333333),
            child: const Icon(
              Icons.music_note,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
