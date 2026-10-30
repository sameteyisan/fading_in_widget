# Fading in Widget Example

A pastel-colored animation playground with three different `FadingInWidget`
examples. The app uses the package in the parent directory through a local path
dependency. All illustrations are Flutter widgets, with no image assets or
network requests needed.

## Run the example

From the repository root:

```sh
cd example
flutter pub get
flutter run
```

The project includes Android, iOS, and web support. To run in Chrome, use
`flutter run -d chrome`.

## The little moments

| Preview | Delay | Duration | Curve |
| --- | --- | --- | --- |
| A sunshine greeting card | None | 2 seconds | `Curves.easeInOut` (defaults) |
| A decorative mini music player | 700 ms | 1.4 seconds | `Curves.easeOutCubic` |
| An achievement notification | 300 ms | 3 seconds | `Curves.easeInOutCubic` |

Use **Replay all** to replay the entire collection, or the replay icon on a card
to replay just that preview. Each card also displays its settings and usage code.
The layout adapts from a single column on phones to three columns on wider screens.

## Basic usage

```dart
import 'package:fading_in_widget/fading_in_widget.dart';
import 'package:flutter/material.dart';

import 'showcase_widgets.dart';

const FadingInWidget(
  child: SunshineCard(),
),
```

## Explicit parameters

```dart
const FadingInWidget(
  delay: Duration(milliseconds: 700),
  duration: Duration(milliseconds: 1400),
  curve: Curves.easeOutCubic,
  child: PlaylistCard(),
),
```

Find the animation examples in [`lib/main.dart`](lib/main.dart) and the preview
widgets in [`lib/showcase_widgets.dart`](lib/showcase_widgets.dart). Change `delay`,
`duration`, or `curve` to try your own entrance.
