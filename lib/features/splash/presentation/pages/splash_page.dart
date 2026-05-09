import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _mainController;
  late final List<AnimationController> _letterControllers;
  late final Animation<double> _slideAnim;
  late final Animation<double> _scaleAnim;

  final String _text = 'Hello';

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    // Initialize letter controllers untuk bounce animation
    _letterControllers = List.generate(
      _text.length,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
      ),
    );

    // Pop out animation: scale dari 0 → 1
    _slideAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.50, curve: Curves.elasticOut),
      ),
    );

    // Zoom dari ukuran normal (1.0) → sangat besar (40x) hingga memenuhi layar
    _scaleAnim = Tween<double>(begin: 1.0, end: 40.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.65, 1.0, curve: Curves.easeInCubic),
      ),
    );

    // Start main animation
    _mainController.forward().then((_) {
      if (mounted) context.go('/splash2');
    });

    // Start letter bounce animations with delay
    for (int i = 0; i < _letterControllers.length; i++) {
      Future.delayed(Duration(milliseconds: 200 * i), () {
        if (mounted) {
          _letterControllers[i].forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _mainController.dispose();
    for (var controller in _letterControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: ClipRect(
        child: Center(
          child: AnimatedBuilder(
            animation: _mainController,
            builder: (context, child) {
              return Transform.scale(
                scale: _slideAnim.value,
                child: Transform.scale(scale: _scaleAnim.value, child: child),
              );
            },
            child: _buildLogo(),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        _text.length,
        (index) => AnimatedBuilder(
          animation: _letterControllers[index],
          builder: (context, child) {
            // Bounce animation: up and down
            final bounceValue = _letterControllers[index].value;
            final offset = _calculateBounceOffset(bounceValue);

            return Transform.translate(offset: Offset(0, offset), child: child);
          },
          child: Text(
            _text[index],
            style: const TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2B37D4),
            ),
          ),
        ),
      ),
    );
  }

  double _calculateBounceOffset(double value) {
    // Bounce curve: goes down then up
    if (value < 0.5) {
      // First half: go down
      return (value * 2) * 20; // Max 20px down
    } else {
      // Second half: go up
      return (1 - (value - 0.5) * 2) * 20; // Back to 0
    }
  }
}
