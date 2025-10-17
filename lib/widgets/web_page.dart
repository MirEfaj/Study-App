// lib/widgets/web_page.dart
import 'package:flutter/material.dart';

/// WebPage shows course content (multiple "chapters" / sections)
/// and a right-side drawer (endDrawer) listing those chapters.
/// Tapping any chapter scrolls the main content to that chapter.
class WebPage extends StatefulWidget {
  final String title;
  final List<String> webpageUrls; // We will map these to chapters for demo

  const WebPage({
    super.key,
    required this.title,
    required this.webpageUrls,
  });

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final ScrollController _scrollController = ScrollController();
  // Create keys for each section so we can scroll to them
  late final List<GlobalKey> _sectionKeys;
  int _activeChapterIndex = 0;

  @override
  void initState() {
    super.initState();
    // create a key for each webpageUrl (we treat each url as a chapter for demo)
    _sectionKeys = List.generate(widget.webpageUrls.length, (index) => GlobalKey());
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // optional: update _activeChapterIndex based on scroll position
    for (var i = 0; i < _sectionKeys.length; i++) {
      final key = _sectionKeys[i];
      final ctx = key.currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox;
      final pos = box.localToGlobal(Offset.zero, ancestor: null).dy;
      // a simple heuristic
      if (pos < 200) {
        setState(() {
          _activeChapterIndex = i;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollToSection(int index) async {
    final key = _sectionKeys[index];
    final ctx = key.currentContext;
    if (ctx == null) return;
    // ensure the widget is visible
    await Scrollable.ensureVisible(ctx, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    setState(() {
      _activeChapterIndex = index;
    });
    // close the drawer if opened
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    // Build a list of "chapters" from webpageUrls. You can replace this
    // with richer data (title, content, examples, code) in your Course model.
    final chapters = List.generate(widget.webpageUrls.length, (i) => 'Chapter ${i + 1}');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(widget.title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        // Add an icon to open the right-side drawer
        actions: [
          Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu_open, color: Colors.black),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: 'Chapters',
            );
          }),
        ],
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Table of Contents', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    itemCount: chapters.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final active = index == _activeChapterIndex;
                      return ListTile(
                        title: Text(chapters[index], style: TextStyle(fontWeight: active ? FontWeight.bold : FontWeight.normal, color: active ? Colors.indigo : Colors.black)),
                        subtitle: Text(widget.webpageUrls[index], maxLines: 1, overflow: TextOverflow.ellipsis),
                        tileColor: active ? Colors.indigo.shade50 : null,
                        onTap: () => _scrollToSection(index),
                      );
                    },
                  ),
                ),
                // optional: a "close" button
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    child: const Text('Close'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(widget.webpageUrls.length, (index) {
            return _buildChapterSection(index);
          }),
        ),
      ),
    );
  }

  Widget _buildChapterSection(int index) {
    final title = 'Chapter ${index + 1}';
    final subtitle = 'Getting Started';
    final content = '''
Welcome to chapter ${index + 1}! This section illustrates how to structure course content.
You can replace this placeholder text with real course content coming from your backend or markdown files.
(Associated resource: ${widget.webpageUrls[index]})
''';

    return Container(
      key: _sectionKeys[index],
      margin: const EdgeInsets.only(bottom: 28),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header row: breadcrumb + chapter title
          Row(
            children: [
              Text('Chapter ${index + 1}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(width: 8),
              Text('›', style: TextStyle(color: Colors.grey.shade400)),
              const SizedBox(width: 8),
              const Text('Introduction', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              // icon box
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.indigo.shade50, borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.book, color: Colors.indigo),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            ],
          ),
          const SizedBox(height: 12),
          Text(content, style: const TextStyle(fontSize: 15, height: 1.5)),
          const SizedBox(height: 12),
          const Text('Key Points:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _bullet('Understanding the fundamental concepts'),
          _bullet('Practical examples and use cases'),
          _bullet('Best practices and common pitfalls to avoid'),
          const SizedBox(height: 12),
          const Text('Example Code', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
            child: const Text(
              '// Example implementation\nfunction example() {\n  console.log("Hello, SkillWave!");\n  return true;\n}\n',
              style: TextStyle(fontFamily: 'Monospace', fontSize: 13),
            ),
          ),
          const SizedBox(height: 12),
          // navigation controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: index > 0 ? () => _scrollToSection(index - 1) : null,
                icon: const Icon(Icons.arrow_back),
                label: const Text('Previous Section'),
              ),
              ElevatedButton.icon(
                onPressed: index < widget.webpageUrls.length - 1 ? () => _scrollToSection(index + 1) : null,
                icon: const Text('Next Section'),
                label: const Icon(Icons.arrow_forward),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Text('•  '),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
