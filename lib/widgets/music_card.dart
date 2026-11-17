
import 'package:flutter/material.dart';

class MusicCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String? imageUrl;

  const MusicCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Icons.music_note,
    this.imageUrl,
  });

  @override
  State<MusicCard> createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
  bool isHovered = false;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => isHovered = true);
      },
      onExit: (_) {
        setState(() => isHovered = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 175,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isHovered
              ? const Color(0xFF282828)
              : const Color(0xFF181818),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: widget.imageUrl != null
                        ? Image.network(
                            widget.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                _placeholder(),
                          )
                        : _placeholder(),
                  ),
                ),

                if (isHovered)
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                      child: Container(
                        width: 46,
                        height: 46,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1DB954),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.black,
                          size: 29,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 13),

            Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              widget.subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      color: const Color(0xFF333333),
      child: Icon(
        widget.icon,
        color: Colors.white,
        size: 65,
      ),
    );
  }
}
