
import 'package:flutter/foundation.dart';

class Song {
  final String title;
  final String artist;
  final String imageUrl;
  final String duration;

  const Song({
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.duration,
  });
}

// Daftar lagu aplikasi
final List<Song> songs = [
  Song(
    title: 'Bawa Dia Kembali',
    artist: 'Mahalini',
    imageUrl:
        'https://images.unsplash.com/photo-1516280440614-37939bbacd81?w=600',
    duration: '3:46',
  ),
  Song(
    title: 'Dream After Dream',
    artist: 'NCT DREAM',
    imageUrl:
        'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=600',
    duration: '3:30',
  ),
  Song(
    title: 'Chill Hits',
    artist: 'Various Artists',
    imageUrl:
        'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=600',
    duration: '4:12',
  ),
];

// Lagu yang saat ini dipilih
final ValueNotifier<Song> currentSong =
    ValueNotifier<Song>(songs[0]);
