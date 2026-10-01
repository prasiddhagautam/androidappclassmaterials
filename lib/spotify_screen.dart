import 'package:flutter/material.dart';

class SpotifyScreen extends StatelessWidget {
  const SpotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar Header: Recently Played + Action Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recently played",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.notifications_none, color: Colors.white, size: 24),
                      SizedBox(width: 16),
                      Icon(Icons.history, color: Colors.white, size: 24),
                      SizedBox(width: 16),
                      Icon(Icons.settings_outlined, color: Colors.white, size: 24),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Circular Recently Played Artists Row
              Row(
                children: [
                  _buildArtistAvatar(
                    name: "Lana Del Rey",
                    color: Colors.amber.shade800,
                  ),
                  const SizedBox(width: 20),
                  _buildArtistAvatar(
                    name: "Marvin Gaye",
                    color: Colors.blueGrey.shade700,
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // Spotify Wrapped Header
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFCCFF00),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#SPOTIFYWRAPPED",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "Your 2021 in review",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Wrapped Cards Row
              Row(
                children: [
                  Expanded(
                    child: _buildWrappedCard(
                      title: "Your Top Songs\n2021",
                      color: const Color(0xFFD3E75A),
                      textColor: const Color(0xFF2E1A47),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _buildWrappedCard(
                      title: "Your Artists\nRevealed",
                      color: const Color(0xFFB5B3E6),
                      textColor: const Color(0xFF241571),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // Editor's Picks Section
              const Text(
                "Editor's picks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Editor's Picks Cards Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildEditorPickCard(
                      title: "Ed Sheeran, Big Sean, Juice WRLD, Post Malone",
                      bgColor: const Color(0xFF9CCA35),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _buildEditorPickCard(
                      title: "Mitski, Tame Impala, Glass Animals, Charli XCX",
                      bgColor: const Color(0xFF4C8F79),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArtistAvatar({required String name, required Color color}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: color,
          child: const Icon(Icons.person, color: Colors.white, size: 40),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildWrappedCard({
    required String title,
    required Color color,
    required Color textColor,
  }) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.music_note, color: Colors.black54, size: 20),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w900,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditorPickCard({required String title, required Color bgColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Center(
              child: Icon(Icons.album, size: 60, color: Colors.white38),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 12,
            height: 1.2,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
