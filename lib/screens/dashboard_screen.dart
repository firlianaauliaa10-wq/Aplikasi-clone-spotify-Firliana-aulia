
import 'package:flutter/material.dart';

import '../widgets/sidebar.dart';
import '../widgets/music_card.dart';
import '../widgets/player_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const Color background = Color(0xFF000000);
  static const Color panel = Color(0xFF121212);
  static const Color green = Color(0xFF1DB954);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER ATAS
            _buildHeader(),

            // AREA DASHBOARD
            Expanded(
              child: Row(
                children: [
                  // SIDEBAR KIRI
                  const Sidebar(),

                  const SizedBox(width: 8),

                  // KONTEN TENGAH
                  Expanded(
                    child: _buildMainContent(),
                  ),

                  const SizedBox(width: 8),

                  // PANEL KANAN
                  SizedBox(
                    width: 280,
                    child: _buildNowPlaying(),
                  ),

                  const SizedBox(width: 8),
                ],
              ),
            ),

            // PLAYER BAWAH
            const PlayerBar(),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // HEADER ATAS
  // =====================================================

  Widget _buildHeader() {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.black,
      child: Row(
        children: [
          // LOGO
          const Icon(
            Icons.music_note,
            size: 34,
            color: Colors.white,
          ),

          const SizedBox(width: 18),

          // HOME
          Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
              color: Color(0xFF242424),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home_filled,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // SEARCH
          Expanded(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              height: 46,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF242424),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white70,
                    size: 23,
                  ),
                  SizedBox(width: 13),
                  Expanded(
                    child: Text(
                      'Apa yang ingin kamu putar?',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.library_music_outlined,
                    color: Colors.white70,
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),

          // PREMIUM
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 13,
              ),
            ),
            child: const Text(
              'Jelajahi Premium',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),

          const SizedBox(width: 18),

          const Icon(
            Icons.notifications_none,
            color: Colors.white70,
            size: 23,
          ),

          const SizedBox(width: 18),

          const Icon(
            Icons.people_outline,
            color: Colors.white70,
            size: 23,
          ),

          const SizedBox(width: 18),

          // PROFILE
          const CircleAvatar(
            radius: 19,
            backgroundColor: green,
            child: Text(
              'F',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // KONTEN TENGAH
  // =====================================================

  Widget _buildMainContent() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            Color(0xFF351414),
            Color(0xFF181313),
            Color(0xFF121212),
          ],
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FILTER KONTEN
            Row(
              children: [
                _filterButton('Semua', true),
                const SizedBox(width: 10),
                _filterButton('Musik', false),
                const SizedBox(width: 10),
                _filterButton('Podcast', false),
              ],
            ),

            const SizedBox(height: 18),

            // PLAYLIST CEPAT
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                _QuickPlaylist(
                  title: 'Daily Mix 2',
                  imageUrl:
                      'https://images.unsplash.com/photo-1516280440614-37939bbacd81?w=150',
                ),
                _QuickPlaylist(
                  title: 'Playlist #5',
                  imageUrl:
                      'https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=150',
                ),
                _QuickPlaylist(
                  title: 'My playlist',
                  imageUrl:
                      'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=150',
                ),
                _QuickPlaylist(
                  title: 'Daily Mix 1',
                  imageUrl:
                      'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=150',
                ),
              ],
            ),

            const SizedBox(height: 42),

            // RILIS MENDATANG
            const Text(
              'Simpan dulu rilis mendatang',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 15,
              runSpacing: 15,
              children: const [
                MusicCard(
                  title: 'Dream After Dream',
                  subtitle: 'NCT DREAM',
                  imageUrl:
                      'https://images.unsplash.com/photo-1516280440614-37939bbacd81?w=500',
                ),
                MusicCard(
                  title: 'Elissar',
                  subtitle: 'Elissa',
                  imageUrl:
                      'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=500',
                ),
                MusicCard(
                  title: 'Daily Mix',
                  subtitle: 'Made for you',
                  imageUrl:
                      'https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=500',
                ),
              ],
            ),

            const SizedBox(height: 40),

            // DIBUAT UNTUK KAMU
            const Text(
              'Dibuat Untuk Kamu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 15,
              runSpacing: 15,
              children: const [
                MusicCard(
                  title: 'Chill Hits',
                  subtitle: 'Relaxing music',
                  imageUrl:
                      'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=500',
                ),
                MusicCard(
                  title: 'Pop Hits',
                  subtitle: 'Popular music',
                  imageUrl:
                      'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?w=500',
                ),
              ],
            ),

            const SizedBox(height: 40),

            // REKOMENDASI
            const Text(
              'Rekomendasi Musik',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 15,
              runSpacing: 15,
              children: const [
                MusicCard(
                  title: 'Music Collection',
                  subtitle: 'Pilihan musik untukmu',
                  imageUrl:
                      'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?w=500',
                ),
                MusicCard(
                  title: 'Relaxing Music',
                  subtitle: 'Musik santai',
                  imageUrl:
                      'https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=500',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // TOMBOL FILTER
  // =====================================================

  Widget _filterButton(String title, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: selected
            ? Colors.white
            : const Color(0xFF333333),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.black : Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // =====================================================
  // PANEL KANAN / NOW PLAYING
  // =====================================================

  Widget _buildNowPlaying() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sampai Menutup Mata',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 22),

            // GAMBAR ALBUM
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  'https://images.unsplash.com/photo-1516280440614-37939bbacd81?w=600',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return _imagePlaceholder();
                  },
                ),
              ),
            ),

            const SizedBox(height: 18),

            // JUDUL LAGU
            const Text(
              'Bawa Dia Kembali',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 7),

            const Row(
              children: [
                Expanded(
                  child: Text(
                    'Mahalini',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: green,
                ),
              ],
            ),

            const SizedBox(height: 30),

            // LIRIK
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF51203F),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pratinjau lirik',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),

                  SizedBox(height: 25),

                  Text(
                    'Malam ini aku menanti',
                    style: TextStyle(
                      color: Color(0xFFFFC5E0),
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 18),

                  Text(
                    'Kedatanganmu...',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Tentang artis',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 12),

            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=500',
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return _imagePlaceholder();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      color: const Color(0xFF54264A),
      child: const Center(
        child: Icon(
          Icons.album,
          color: Colors.white,
          size: 85,
        ),
      ),
    );
  }
}

// =====================================================
// WIDGET PLAYLIST CEPAT
// =====================================================

class _QuickPlaylist extends StatelessWidget {
  final String title;
  final String imageUrl;

  const _QuickPlaylist({
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 52,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 52,
              height: 52,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  width: 52,
                  height: 52,
                  color: const Color(0xFF514040),
                  child: const Icon(
                    Icons.music_note,
                    color: Colors.white,
                  ),
                );
              },
            ),

            Expanded(
              child: Container(
                height: 52,
                color: const Color(0xFF302525),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
