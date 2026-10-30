import 'package:fading_in_widget/fading_in_widget.dart';
import 'package:flutter/material.dart';

import 'showcase_widgets.dart';

const _ink = Color(0xFF302C42);
const _muted = Color(0xFF858092);
const _purple = Color(0xFF8B6ACB);

void main() {
  runApp(const FadingInWidgetExampleApp());
}

class FadingInWidgetExampleApp extends StatelessWidget {
  const FadingInWidgetExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fading in · A little animation playground',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAF9F6),
        colorScheme: ColorScheme.fromSeed(seedColor: _purple),
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: _ink,
          displayColor: _ink,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: _ink,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          ),
        ),
      ),
      home: const _Playground(),
    );
  }
}

class _Playground extends StatefulWidget {
  const _Playground();

  @override
  State<_Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<_Playground> {
  int _replay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final wide = constraints.maxWidth >= 720;
                  final columns =
                      constraints.maxWidth >= 1000
                          ? 3
                          : constraints.maxWidth >= 640
                          ? 2
                          : 1;
                  final cardWidth =
                      (constraints.maxWidth - (columns - 1) * 20) / columns;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFECE5F8),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(
                              Icons.blur_on_rounded,
                              color: _purple,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text(
                              'fading in.',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.6,
                              ),
                            ),
                          ),
                          FilledButton.icon(
                            onPressed: () => setState(() => _replay++),
                            icon: const Icon(Icons.replay_rounded, size: 18),
                            label: const Text('Replay all'),
                          ),
                        ],
                      ),
                      SizedBox(height: wide ? 56 : 40),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const _Eyebrow('SMALL DETAILS. BIG FEELINGS.'),
                                const SizedBox(height: 16),
                                Text.rich(
                                  const TextSpan(
                                    text: 'Good things\n',
                                    children: [
                                      TextSpan(
                                        text: 'fade in.',
                                        style: TextStyle(color: _purple),
                                      ),
                                    ],
                                  ),
                                  style: TextStyle(
                                    fontSize: wide ? 64 : 46,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -2.5,
                                    height: 1.05,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'A hello, a favorite song, a little win.\n'
                                  'Wrap any widget and give it a softer entrance.',
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.7,
                                    color: _muted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (wide) ...[
                            const SizedBox(width: 32),
                            const HeroIllustration(),
                          ],
                        ],
                      ),
                      const SizedBox(height: 40),
                      const _Eyebrow('PICK A LITTLE MOMENT'),
                      const SizedBox(height: 16),
                      KeyedSubtree(
                        key: ValueKey(_replay),
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            for (final example in _examples)
                              SizedBox(width: cardWidth, child: example),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Center(
                        child: Text.rich(
                          TextSpan(
                            text: 'Made with a little ',
                            children: [
                              TextSpan(
                                text: '♡',
                                style: TextStyle(color: _purple, fontSize: 18),
                              ),
                              TextSpan(text: ' and FadingInWidget.'),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: _muted, fontSize: 12),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Each preview uses the real package. The child can be any widget you like.
const _examples = [
  _ExampleCard(
    label: '01 / THE SIMPLE HELLO',
    title: 'A warm hello',
    description: 'Just wrap your widget.\nThe defaults do the lovely part.',
    background: Color(0xFFFFF0DB),
    settings: ['No delay', '2 seconds', 'easeInOut'],
    code:
        'const FadingInWidget(\n'
        '  child: SunshineCard(),\n'
        ')',
    preview: FadingInWidget(child: SunshineCard()),
  ),
  _ExampleCard(
    label: '02 / WORTH THE WAIT',
    title: 'Set the mood',
    description:
        'A tiny pause before the good stuff.\nLet your content find its moment.',
    background: Color(0xFFEEE7FC),
    settings: ['700 ms delay', '1.4 seconds', 'easeOutCubic'],
    code:
        'const FadingInWidget(\n'
        '  delay: Duration(milliseconds: 700),\n'
        '  duration: Duration(milliseconds: 1400),\n'
        '  curve: Curves.easeOutCubic,\n'
        '  child: PlaylistCard(),\n'
        ')',
    preview: FadingInWidget(
      delay: Duration(milliseconds: 700),
      duration: Duration(milliseconds: 1400),
      curve: Curves.easeOutCubic,
      child: PlaylistCard(),
    ),
  ),
  _ExampleCard(
    label: '03 / NICE AND SLOW',
    title: 'Little wins matter',
    description:
        'Some things deserve a slower reveal.\nMake a good moment last a little longer.',
    background: Color(0xFFE2F3EB),
    settings: ['300 ms delay', '3 seconds', 'easeInOutCubic'],
    code:
        'const FadingInWidget(\n'
        '  delay: Duration(milliseconds: 300),\n'
        '  duration: Duration(seconds: 3),\n'
        '  curve: Curves.easeInOutCubic,\n'
        '  child: AchievementCard(),\n'
        ')',
    preview: FadingInWidget(
      delay: Duration(milliseconds: 300),
      duration: Duration(seconds: 3),
      curve: Curves.easeInOutCubic,
      child: AchievementCard(),
    ),
  ),
];

class _ExampleCard extends StatefulWidget {
  const _ExampleCard({
    required this.label,
    required this.title,
    required this.description,
    required this.background,
    required this.settings,
    required this.code,
    required this.preview,
  });

  final String label;
  final String title;
  final String description;
  final Color background;
  final List<String> settings;
  final String code;
  final Widget preview;

  @override
  State<_ExampleCard> createState() => _ExampleCardState();
}

class _ExampleCardState extends State<_ExampleCard> {
  int _replay = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFECE9F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05302C42),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: _Eyebrow(widget.label)),
              IconButton(
                onPressed: () => setState(() => _replay++),
                tooltip: 'Replay ${widget.title.toLowerCase()}',
                icon: const Icon(Icons.replay_rounded, size: 20),
                color: _purple,
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: 244,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: widget.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                const Positioned(
                  top: -35,
                  right: -25,
                  child: _Bubble(size: 130),
                ),
                const Positioned(
                  bottom: -20,
                  left: -15,
                  child: _Bubble(size: 90),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: KeyedSubtree(
                      key: ValueKey(_replay),
                      child: widget.preview,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.description,
            style: const TextStyle(fontSize: 12, color: _muted, height: 1.7),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final setting in widget.settings)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F3F8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    setting,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF746A85),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 142),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF302C42),
              borderRadius: BorderRadius.circular(14),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                widget.code,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 10.5,
                  height: 1.8,
                  color: Color(0xFFE2D7F5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Eyebrow extends StatelessWidget {
  const _Eyebrow(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: _muted,
        fontSize: 10,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.5,
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0x55FFFFFF),
      ),
    );
  }
}
