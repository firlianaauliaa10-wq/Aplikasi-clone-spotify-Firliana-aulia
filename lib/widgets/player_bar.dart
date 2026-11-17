
import 'package:flutter/material.dart';
import '../models/song.dart';

class PlayerBar extends StatefulWidget {
  const PlayerBar({super.key});

  @override
  State<PlayerBar> createState() => _PlayerBarState();
}

class _PlayerBarState extends State<PlayerBar> {
  bool isPlaying = false;
  bool isShuffle = false;
  bool isRepeat = false;

  double progress = 0.0;
  double volume = 0.85;

  void nextSong() {
    final currentIndex = songs.indexOf(currentSong.value);
    final nextIndex = (currentIndex + 1) % songs.length;

    currentSong.value = songs[nextIndex];

    setState(() {
      progress = 0.0;
      isPlaying = true;
    });
  }

  void previousSong() {
    final currentIndex = songs.indexOf(currentSong.value);
    final previousIndex =
        (currentIndex - 1 + songs.length) % songs.length;

    currentSong.value = songs[previousIndex];

    setState(() {
      progress = 0.0;
      isPlaying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF181818),
        border: Border(
          top: BorderSide(color: Color(0xFF333333)),
        ),
      ),
      child: Row(
        children: [
          // INFORMASI LAGU
          Expanded(
            flex: 3,
            child: ValueListenableBuilder<Song>(
              valueListenable: currentSong,
              builder: (context, song, child) {
                return Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        song.imageUrl,
                        width: 55,
                        height: 55,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) {
                          return _coverPlaceholder();
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            song.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            song.artist,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.check_circle,
                      color: Color(0xFF1DB954),
                      size: 19,
                    ),
                  ],
                );
              },
            ),
          ),

          // KONTROL MUSIK
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isShuffle = !isShuffle;
                        });
                      },
                      icon: Icon(
                        Icons.shuffle,
                        color: isShuffle
                            ? const Color(0xFF1DB954)
                            : Colors.grey,
                        size: 19,
                      ),
                    ),
                    IconButton(
                      onPressed: previousSong,
                      icon: const Icon(
                        Icons.skip_previous,
                        color: Colors.white70,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_filled,
                        color: Colors.white,
                        size: 38,
                      ),
                    ),
                    IconButton(
                      onPressed: nextSong,
                      icon: const Icon(
                        Icons.skip_next,
                        color: Colors.white70,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isRepeat = !isRepeat;
                        });
                      },
                      icon: Icon(
                        Icons.repeat,
                        color: isRepeat
                            ? const Color(0xFF1DB954)
                            : Colors.grey,
                        size: 19,
                      ),
                    ),
                  ],
                ),

                // PROGRESS LAGU
                Row(
                  children: [
                    const Text(
                      '0:00',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 3,
                          thumbShape:
                              const RoundSliderThumbShape(
                            enabledThumbRadius: 4,
                          ),
                          overlayShape:
                              SliderComponentShape.noOverlay,
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                          thumbColor: Colors.white,
                        ),
                        child: Slider(
                          value: progress,
                          onChanged: (value) {
                            setState(() {
                              progress = value;
                            });
                          },
                        ),
                      ),
                    ),
                    ValueListenableBuilder<Song>(
                      valueListenable: currentSong,
                      builder: (context, song, child) {
                        return Text(
                          song.duration,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          // VOLUME DAN PENGATURAN
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.mic_none,
                    color: Colors.white70,
                    size: 19,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.queue_music,
                    color: Colors.white70,
                    size: 19,
                  ),
                ),
                const Icon(
                  Icons.volume_up,
                  color: Colors.white70,
                  size: 20,
                ),
                SizedBox(
                  width: 95,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 3,
                      thumbShape:
                          const RoundSliderThumbShape(
                        enabledThumbRadius: 4,
                      ),
                      overlayShape:
                          SliderComponentShape.noOverlay,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: Colors.white,
                    ),
                    child: Slider(
                      value: volume,
                      onChanged: (value) {
                        setState(() {
                          volume = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _coverPlaceholder() {
    return Container(
      width: 55,
      height: 55,
      color: const Color(0xFF54264A),
      child: const Icon(
        Icons.music_note,
        color: Colors.white,
      ),
    );
  }
}
