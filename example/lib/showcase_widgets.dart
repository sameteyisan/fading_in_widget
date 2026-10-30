import 'package:flutter/material.dart';

const _ink = Color(0xFF302C42);
const _muted = Color(0xFF9690A2);

/// A greeting card: the simplest example's child.
class SunshineCard extends StatelessWidget {
  const SunshineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const _PreviewSurface(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 130,
            height: 76,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.wb_sunny_rounded,
                  size: 72,
                  color: Color(0xFFFFC45C),
                ),
                Icon(
                  Icons.sentiment_satisfied_alt_rounded,
                  size: 34,
                  color: Color(0xFFA96B30),
                ),
                Positioned(
                  left: 0,
                  top: 8,
                  child: Icon(
                    Icons.auto_awesome_rounded,
                    size: 16,
                    color: Color(0xFFE9B76E),
                  ),
                ),
                Positioned(
                  right: 4,
                  bottom: 6,
                  child: Icon(
                    Icons.auto_awesome_rounded,
                    size: 12,
                    color: Color(0xFFE9B76E),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Hello, sunshine!',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 6),
          Text(
            'A fresh start looks good on you.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: _muted, height: 1.5),
          ),
        ],
      ),
    );
  }
}

/// A decorative mini music player; no audio or network access is needed.
class PlaylistCard extends StatelessWidget {
  const PlaylistCard({super.key});

  static const _bars = <double>[
    8,
    16,
    24,
    12,
    20,
    30,
    18,
    10,
    26,
    20,
    12,
    24,
    16,
    8,
    18,
    12,
  ];

  @override
  Widget build(BuildContext context) {
    return _PreviewSurface(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 62,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF9A7BDC), Color(0xFFDAAFCE)],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.graphic_eq_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'YOUR DAILY MIX',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        color: Color(0xFF9A7BDC),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Slow mornings',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Little joys, vol. 01',
                      style: TextStyle(fontSize: 10, color: _muted),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 32,
                  child: Row(
                    children: [
                      for (var i = 0; i < _bars.length; i++)
                        Expanded(
                          child: Container(
                            height: _bars[i],
                            margin: const EdgeInsets.symmetric(horizontal: 1.5),
                            decoration: BoxDecoration(
                              color:
                                  i < 10
                                      ? const Color(0xFFAE94D9)
                                      : const Color(0xFFEBE5F4),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const CircleAvatar(
                radius: 17,
                backgroundColor: Color(0xFF8B6ACB),
                child: Icon(Icons.play_arrow_rounded, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('0:42', style: TextStyle(fontSize: 9, color: _muted)),
              Text('2:18', style: TextStyle(fontSize: 9, color: _muted)),
            ],
          ),
        ],
      ),
    );
  }
}

/// An achievement notification with a tiny completed progress indicator.
class AchievementCard extends StatelessWidget {
  const AchievementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _PreviewSurface(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: Color(0xFFE2F3EB),
                child: Icon(
                  Icons.done_rounded,
                  color: Color(0xFF589B7C),
                  size: 30,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Look at you go!',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'One little win at a time.',
                      style: TextStyle(
                        fontSize: 10,
                        color: _muted,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daily good things',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
              Text(
                '3 / 3',
                style: TextStyle(fontSize: 10, color: Color(0xFF589B7C)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              for (var i = 0; i < 3; i++)
                Expanded(
                  child: Container(
                    height: 6,
                    margin: EdgeInsets.only(right: i < 2 ? 5 : 0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8AC5A9),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 14),
          const Text(
            'Small steps. Really good feelings.',
            style: TextStyle(fontSize: 10, color: _muted),
          ),
        ],
      ),
    );
  }
}

class _PreviewSurface extends StatelessWidget {
  const _PreviewSurface({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 238,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D302C42),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: DefaultTextStyle.merge(
        style: const TextStyle(color: _ink),
        child: child,
      ),
    );
  }
}

class HeroIllustration extends StatelessWidget {
  const HeroIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFF0E9FA), Color(0xFFE8DFF6)],
              ),
            ),
            child: const Icon(
              Icons.auto_awesome_rounded,
              size: 76,
              color: Color(0xFFA58ACC),
            ),
          ),
          const Positioned(
            right: 12,
            top: 12,
            child: _FloatingCharm(
              color: Color(0xFFFFF0DB),
              icon: Icons.wb_sunny_rounded,
              iconColor: Color(0xFFD4A152),
            ),
          ),
          const Positioned(
            left: 0,
            bottom: 22,
            child: _FloatingCharm(
              color: Color(0xFFE2F3EB),
              icon: Icons.favorite_rounded,
              iconColor: Color(0xFF7BAD94),
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingCharm extends StatelessWidget {
  const _FloatingCharm({
    required this.color,
    required this.icon,
    required this.iconColor,
  });

  final Color color;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white, width: 4),
      ),
      child: Icon(icon, color: iconColor, size: 23),
    );
  }
}
