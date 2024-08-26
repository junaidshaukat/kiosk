import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';

/// An animation that slides its child.
class SlideAnimation extends StatelessWidget {
  /// The duration of the child animation.
  final Duration? duration;

  /// The delay between the beginning of two children's animations.
  final Duration? delay;

  /// The curve of the child animation. Defaults to [Curves.ease].
  final Curve curve;

  /// The vertical offset to apply at the start of the animation (can be negative).
  final double verticalOffset;

  /// The horizontal offset to apply at the start of the animation (can be negative).
  final double horizontalOffset;

  /// The child Widget to animate.
  final Widget child;

  /// Creates a slide animation that slides its child from the given
  /// [verticalOffset] and [horizontalOffset] to its final position.
  ///
  /// A default value of 50.0 is applied to [verticalOffset] if
  /// [verticalOffset] and [horizontalOffset] are both undefined or null.
  ///
  /// The [child] argument must not be null.
  const SlideAnimation({
    super.key,
    this.duration,
    this.delay,
    this.curve = Curves.ease,
    double? verticalOffset,
    double? horizontalOffset,
    required this.child,
  })  : verticalOffset = (verticalOffset == null && horizontalOffset == null)
            ? 50.0
            : (verticalOffset ?? 0.0),
        horizontalOffset = horizontalOffset ?? 0.0;

  @override
  Widget build(BuildContext context) {
    return AnimationConfigurator(
      duration: duration,
      delay: delay,
      animatedChildBuilder: _slideAnimation,
    );
  }

  Widget _slideAnimation(Animation<double> animation) {
    Animation<double> offsetAnimation(
        double offset, Animation<double> animation) {
      return Tween<double>(begin: offset, end: 0.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: Interval(0.0, 1.0, curve: curve),
        ),
      );
    }

    return Transform.translate(
      offset: Offset(
        horizontalOffset == 0.0
            ? 0.0
            : offsetAnimation(horizontalOffset, animation).value,
        verticalOffset == 0.0
            ? 0.0
            : offsetAnimation(verticalOffset, animation).value,
      ),
      child: child,
    );
  }
}

/// An animation that scales its child.
class ScaleAnimation extends StatelessWidget {
  /// The duration of the child animation.
  final Duration? duration;

  /// The delay between the beginning of two children's animations.
  final Duration? delay;

  /// The curve of the child animation. Defaults to [Curves.ease].
  final Curve curve;

  /// Scaling factor to apply at the start of the animation.
  final double scale;

  /// The child Widget to animate.
  final Widget child;

  /// Creates a scale animation that scales its child for its center.
  ///
  /// Default value for [scale] is 0.0.
  ///
  /// The [child] argument must not be null.
  const ScaleAnimation({
    super.key,
    this.duration,
    this.delay,
    this.curve = Curves.ease,
    this.scale = 0.0,
    required this.child,
  }) : assert(scale >= 0.0);

  @override
  Widget build(BuildContext context) {
    return AnimationConfigurator(
      duration: duration,
      delay: delay,
      animatedChildBuilder: _landingAnimation,
    );
  }

  Widget _landingAnimation(Animation<double> animation) {
    final landingAnimation = Tween<double>(begin: scale, end: 1.0).animate(
      CurvedAnimation(
        parent: animation,
        curve: Interval(0.0, 1.0, curve: curve),
      ),
    );

    return Transform.scale(
      scale: landingAnimation.value,
      child: child,
    );
  }
}

/// An enum representing a flip axis.
enum FlipAxis {
  /// The x axis (vertical flip)
  x,

  /// The y axis (horizontal flip)
  y,
}

/// An animation that flips its child either vertically or horizontally.
class FlipAnimation extends StatelessWidget {
  /// The duration of the child animation.
  final Duration? duration;

  /// The delay between the beginning of two children's animations.
  final Duration? delay;

  /// The curve of the child animation. Defaults to [Curves.ease].
  final Curve curve;

  /// The [FlipAxis] in which the child widget will be flipped.
  final FlipAxis flipAxis;

  /// The child Widget to animate.
  final Widget child;

  /// Creates a flip animation that flips its child.
  ///
  /// Default value for [flipAxis] is [FlipAxis.x].
  ///
  /// The [child] argument must not be null.
  const FlipAnimation({
    super.key,
    this.duration,
    this.delay,
    this.curve = Curves.ease,
    this.flipAxis = FlipAxis.x,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationConfigurator(
      duration: duration,
      delay: delay,
      animatedChildBuilder: _flipAnimation,
    );
  }

  Widget _flipAnimation(Animation<double> animation) {
    final flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animation,
        curve: Interval(0.0, 1.0, curve: curve),
      ),
    );

    Matrix4 computeTransformationMatrix() {
      var radians = (1 - flipAnimation.value) * pi / 2;

      switch (flipAxis) {
        case FlipAxis.y:
          return Matrix4.rotationY(radians);
        case FlipAxis.x:
        default:
          return Matrix4.rotationX(radians);
      }
    }

    return Transform(
      transform: computeTransformationMatrix(),
      alignment: Alignment.center,
      child: child,
    );
  }
}

/// An animation that fades its child.
class FadeInAnimation extends StatelessWidget {
  /// The duration of the child animation.
  final Duration? duration;

  /// The delay between the beginning of two children's animations.
  final Duration? delay;

  /// The curve of the child animation. Defaults to [Curves.ease].
  final Curve curve;

  /// The child Widget to animate.
  final Widget child;

  /// Creates a fade animation that fades its child.
  ///
  /// The [child] argument must not be null.
  const FadeInAnimation({
    super.key,
    this.duration,
    this.delay,
    this.curve = Curves.ease,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationConfigurator(
      duration: duration,
      delay: delay,
      animatedChildBuilder: _fadeInAnimation,
    );
  }

  Widget _fadeInAnimation(Animation<double> animation) {
    final opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animation,
        curve: Interval(0.0, 1.0, curve: curve),
      ),
    );

    return Opacity(
      opacity: opacityAnimation.value,
      child: child,
    );
  }
}

/// In the context of a scrollable view, your children's animations are only built
/// as the user scrolls and they appear on the screen.
///
/// This create a situation
/// where your animations will be run as you scroll through the content.
///
/// If this is not a behaviour you want in your app, you can use AnimationLimiter.
///
/// AnimationLimiter is an InheritedWidget that prevents the children widgets to be
/// animated if they don't appear in the first frame where AnimationLimiter is built.
///
/// To be effective, AnimationLimiter musts be a direct parent of your scrollable list of widgets.
class AnimationLimiter extends StatefulWidget {
  /// The child Widget to animate.
  final Widget child;

  /// Creates an [AnimationLimiter] that will prevents the children widgets to be
  /// animated if they don't appear in the first frame where AnimationLimiter is built.
  ///
  /// The [child] argument must not be null.
  const AnimationLimiter({
    super.key,
    required this.child,
  });

  @override
  State<AnimationLimiter> createState() => _AnimationLimiterState();

  static bool? shouldRunAnimation(BuildContext context) {
    return _AnimationLimiterProvider.of(context)?.shouldRunAnimation;
  }
}

class _AnimationLimiterState extends State<AnimationLimiter> {
  bool _shouldRunAnimation = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration value) {
      if (!mounted) return;
      setState(() {
        _shouldRunAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _AnimationLimiterProvider(
      shouldRunAnimation: _shouldRunAnimation,
      child: widget.child,
    );
  }
}

class _AnimationLimiterProvider extends InheritedWidget {
  final bool? shouldRunAnimation;

  const _AnimationLimiterProvider({
    this.shouldRunAnimation,
    required super.child,
  });

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static _AnimationLimiterProvider? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<_AnimationLimiterProvider>();
  }
}

typedef Builder = Widget Function(
    BuildContext context, AnimationController? animationController);

class AnimationExecutor extends StatefulWidget {
  final Duration duration;
  final Duration delay;
  final Builder builder;

  const AnimationExecutor({
    super.key,
    required this.duration,
    this.delay = Duration.zero,
    required this.builder,
  });

  @override
  State<AnimationExecutor> createState() => _AnimationExecutorState();
}

class _AnimationExecutorState extends State<AnimationExecutor>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: widget.duration, vsync: this);

    if (AnimationLimiter.shouldRunAnimation(context) ?? true) {
      _timer = Timer(widget.delay, _animationController.forward);
    } else {
      _animationController.value = 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: _animationController,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return widget.builder(context, _animationController);
  }
}

class AnimationConfigurator extends StatelessWidget {
  final Duration? duration;
  final Duration? delay;
  final Widget Function(Animation<double>) animatedChildBuilder;

  const AnimationConfigurator({
    super.key,
    this.duration,
    this.delay,
    required this.animatedChildBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final animationConfiguration = AnimationConfiguration.of(context);

    if (animationConfiguration == null) {
      throw FlutterError.fromParts(
        <DiagnosticsNode>[
          ErrorSummary('Animation not wrapped in an AnimationConfiguration.'),
          ErrorDescription(
              'This error happens if you use an Animation that is not wrapped in an '
              'AnimationConfiguration.'),
          ErrorHint(
              'The solution is to wrap your Animation(s) with an AnimationConfiguration. '
              'Reminder: an AnimationConfiguration provides the configuration '
              'used as a base for every children Animation. Configuration made in AnimationConfiguration '
              'can be overridden in Animation children if needed.'),
        ],
      );
    }

    final position = animationConfiguration.position;
    final columnCount = animationConfiguration.columnCount;

    return AnimationExecutor(
      duration: duration ?? animationConfiguration.duration,
      delay: stagger(position, duration ?? animationConfiguration.duration,
          delay ?? animationConfiguration.delay, columnCount),
      builder: (context, animationController) =>
          animatedChildBuilder(animationController!),
    );
  }

  Duration stagger(
      int position, Duration duration, Duration? delay, int columnCount) {
    var delayInMilliseconds =
        (delay == null ? duration.inMilliseconds ~/ 6 : delay.inMilliseconds);

    int computeStaggeredGridDuration() {
      return (position ~/ columnCount + position % columnCount) *
          delayInMilliseconds;
    }

    int computeStaggeredListDuration() {
      return position * delayInMilliseconds;
    }

    return Duration(
        milliseconds: columnCount > 1
            ? computeStaggeredGridDuration()
            : computeStaggeredListDuration());
  }
}

/// [AnimationConfiguration] provides the configuration used as a base for every children Animation.
/// Configuration made in [AnimationConfiguration] can be overridden in Animation children if needed.
///
/// Depending on the scenario in which you will present your animations,
/// you should use one of [AnimationConfiguration]'s named constructors.
///
/// [AnimationConfiguration.synchronized] if you want to launch all the children's animations at the same time.
///
/// [AnimationConfiguration.staggeredList] if you want to delay the animation of each child
/// to produce a single-axis staggered animations (from top to bottom or from left to right).
///
/// [AnimationConfiguration.staggeredGrid] if you want to delay the animation of each child
/// to produce a dual-axis staggered animations (from left to right and top to bottom).
class AnimationConfiguration extends InheritedWidget {
  /// Index used as a factor to calculate the delay of each child's animation.
  final int position;

  /// The duration of each child's animation.
  final Duration duration;

  /// The delay between the beginning of two children's animations.
  final Duration? delay;

  /// The column count of the grid
  final int columnCount;

  /// Configure the children's animation to be synchronized (all the children's animation start at the same time).
  ///
  /// Default value for [duration] is 225ms.
  ///
  /// The [child] argument must not be null.
  const AnimationConfiguration.synchronized({
    super.key,
    this.duration = const Duration(milliseconds: 225),
    required super.child,
  })  : position = 0,
        delay = Duration.zero,
        columnCount = 1;

  /// Configure the children's animation to be staggered.
  ///
  /// A staggered animation consists of sequential or overlapping animations.
  ///
  /// Each child animation will start with a delay based on its position comparing to previous children.
  ///
  /// The staggering effect will be based on a single axis (from top to bottom or from left to right).
  ///
  /// Use this named constructor to display a staggered animation on a single-axis list of widgets
  /// ([ListView], [ScrollView], [Column], [Row]...).
  ///
  /// The [position] argument must not be null.
  ///
  /// Default value for [duration] is 225ms.
  ///
  /// Default value for [delay] is the [duration] divided by 6
  /// (appropriate factor to keep coherence during the animation).
  ///
  /// The [child] argument must not be null.
  const AnimationConfiguration.staggeredList({
    super.key,
    required this.position,
    this.duration = const Duration(milliseconds: 225),
    this.delay,
    required super.child,
  }) : columnCount = 1;

  /// Configure the children's animation to be staggered.
  ///
  /// A staggered animation consists of sequential or overlapping animations.
  ///
  /// Each child animation will start with a delay based on its position comparing to previous children.
  ///
  /// The staggering effect will be based on a dual-axis (from left to right and top to bottom).
  ///
  /// Use this named constructor to display a staggered animation on a dual-axis list of widgets
  /// ([GridView]...).
  ///
  /// The [position] argument must not be null.
  ///
  /// Default value for [duration] is 225ms.
  ///
  /// Default value for [delay] is the [duration] divided by 6
  /// (appropriate factor to keep coherence during the animation).
  ///
  /// The [columnCount] argument must not be null and must be greater than 0.
  ///
  /// The [child] argument must not be null.
  const AnimationConfiguration.staggeredGrid({
    super.key,
    required this.position,
    this.duration = const Duration(milliseconds: 225),
    this.delay,
    required this.columnCount,
    required super.child,
  });

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  /// Helper method to apply a staggered animation to the children of a [Column] or [Row].
  ///
  /// It maps every child with an index and calls
  /// [AnimationConfiguration.staggeredList] constructor under the hood.
  ///
  /// Default value for [duration] is 225ms.
  ///
  /// Default value for [delay] is the [duration] divided by 6
  /// (appropriate factor to keep coherence during the animation).
  ///
  /// The [childAnimationBuilder] is a function that will be applied to each child you provide in [children]
  ///
  /// The following is an example of a [childAnimationBuilder] you could provide:
  ///
  /// ```dart
  /// (widget) => SlideAnimation(
  ///   horizontalOffset: 50.0,
  ///   child: FadeInAnimation(
  ///     child: widget,
  ///   ),
  /// )
  /// ```
  ///
  /// The [children] argument must not be null.
  /// It corresponds to the children you would normally have passed to the [Column] or [Row].
  static List<Widget> toStaggeredList({
    Duration? duration,
    Duration? delay,
    required Widget Function(Widget) childAnimationBuilder,
    required List<Widget> children,
  }) =>
      children
          .asMap()
          .map((index, widget) {
            return MapEntry(
              index,
              AnimationConfiguration.staggeredList(
                position: index,
                duration: duration ?? const Duration(milliseconds: 225),
                delay: delay,
                child: childAnimationBuilder(widget),
              ),
            );
          })
          .values
          .toList();

  static AnimationConfiguration? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<AnimationConfiguration>();
  }
}

class StaggerColumn extends StatelessWidget {
  final List<Widget> children;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const StaggerColumn({
    super.key,
    this.children = const [],
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: AnimationConfiguration.toStaggeredList(
          delay: const Duration(milliseconds: 1),
          duration: const Duration(milliseconds: 375),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: children,
        ),
      ),
    );
  }
}

class StaggeredGrid extends StatelessWidget {
  final int crossAxisCount;
  final int length;
  final int columnCount;
  final Widget child;

  const StaggeredGrid({
    super.key,
    required this.child,
    required this.length,
    required this.columnCount,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.count(
        crossAxisCount: crossAxisCount,
        children: List.generate(
          length,
          (int index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 375),
              columnCount: columnCount,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: child,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class StaggeredList extends StatelessWidget {
  final int itemCount;
  final Widget child;

  const StaggeredList({
    super.key,
    required this.child,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
