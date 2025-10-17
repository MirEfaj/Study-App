// lib/widgets/video_page.dart
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

/// VideoPage shows a large YouTube player at the top and a clickable
/// list of videos below. When a lesson is selected, it highlights
/// and the player loads & plays that video.
///
/// Expects a list of URLs (preferably YouTube links).
class VideoPage extends StatefulWidget {
  final String title;
  final List<String> videoUrls;

  const VideoPage({
    super.key,
    required this.title,
    required this.videoUrls,
  });

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController _ytController;
  int _selectedIndex = 0; // index of currently selected video

  @override
  void initState() {
    super.initState();

    // Ensure there is at least one url. If empty, we create a dummy controller.
    final firstVideoId = _extractYoutubeId(widget.videoUrls.isNotEmpty ? widget.videoUrls[0] : '');
    _ytController = YoutubePlayerController(
      initialVideoId: firstVideoId ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _ytController.dispose();
    super.dispose();
  }

  /// Try to extract YouTube video ID. Returns null if it's not a YouTube URL.
  String? _extractYoutubeId(String url) {
    try {
      final id = YoutubePlayer.convertUrlToId(url);
      return id;
    } catch (_) {
      return null;
    }
  }

  /// If the url is a YouTube link, load it into the player and play.
  /// Otherwise, open it in external browser via url_launcher.
  void _openVideoAtIndex(int index) async {
    final url = widget.videoUrls[index];
    final videoId = _extractYoutubeId(url);

    setState(() {
      _selectedIndex = index;
    });

    if (videoId != null && videoId.isNotEmpty) {
      // load new video ID (keeps same controller instance)
      _ytController.load(videoId);
      _ytController.play();
    } else {
      // fallback: open in browser if not YouTube
      final uri = Uri.tryParse(url);
      if (uri != null && await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // show message
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cannot open video URL')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // top player area: show a placeholder if no youtube id
    final firstId = _extractYoutubeId(widget.videoUrls.isNotEmpty ? widget.videoUrls[0] : '');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(widget.title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // video player container
          Container(
            color: Colors.black,
            width: double.infinity,
            height: 220,
            child: firstId == null
                ? // If first URL isn't YouTube, show a message
            Center(
              child: Text(
                'No embeddable YouTube video found.\nTap a video below to open it.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white.withOpacity(0.9)),
              ),
            )
                : YoutubePlayer(
              controller: _ytController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.redAccent,
              onReady: () {
                // nothing special; user will tap to play
              },
            ),
          ),

          // course meta & progress can be placed here (optional)
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text('Course Lessons', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Spacer(),
                Text('${widget.videoUrls.length} lessons', style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // lesson list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: widget.videoUrls.length,
              itemBuilder: (context, index) {
                final url = widget.videoUrls[index];
                final selected = index == _selectedIndex;

                return GestureDetector(
                  onTap: () => _openVideoAtIndex(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: selected ? Colors.indigo.shade50 : Colors.white,
                      border: Border.all(color: selected ? Colors.indigo : Colors.grey.shade300, width: selected ? 1.6 : 1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selected ? Colors.indigo : Colors.grey.shade200,
                          ),
                          child: Icon(Icons.play_arrow, color: selected ? Colors.white : Colors.black54),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Lesson ${index + 1}', style: TextStyle(fontWeight: FontWeight.bold, color: selected ? Colors.indigo : Colors.black87)),
                              const SizedBox(height: 6),
                              Text(
                                url,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (selected)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text('Playing', style: TextStyle(fontSize: 12, color: Colors.green)),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
