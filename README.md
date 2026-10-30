# Fading in Widget

[![pub package](https://img.shields.io/pub/v/fading_in_widget.svg)](https://pub.dev/packages/fading_in_widget)

Give any Flutter widget a softer entrance. Wrap your content with
`FadingInWidget` and it will fade into view automatically, with an optional delay
and a customizable duration and curve.

<img src="https://raw.githubusercontent.com/sameteyisan/fading_in_widget/main/showcase.gif" alt="Fading in Widget animation demo" width="280">

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  fading_in_widget: ^1.0.3
```

Then run:

```sh
flutter pub get
```

Requires **Flutter 3.29.2 or later** and **Dart 3.7.2 or later**.

## Basic usage

```dart
import 'package:fading_in_widget/fading_in_widget.dart';
import 'package:flutter/material.dart';

const FadingInWidget(
  child: FlutterLogo(),
),
```

That's it. By default, the animation starts immediately and fades in over two
seconds using `Curves.easeInOut`.

## Customize the animation

Specify the defaults explicitly:

```dart
const FadingInWidget(
  delay: Duration.zero, // Default value.
  duration: Duration(seconds: 2), // Default value.
  curve: Curves.easeInOut, // Default value.
  child: FlutterLogo(),
),
```

Or give your content a different entrance:

```dart
const FadingInWidget(
  delay: Duration(milliseconds: 700),
  duration: Duration(milliseconds: 1400),
  curve: Curves.easeOutCubic,
  child: Card(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: Text('Good things fade in.'),
    ),
  ),
),
```

## Parameters

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `child` | `Widget` | Required | The widget to fade into view. |
| `delay` | `Duration` | `Duration.zero` | How long to wait before starting the animation. |
| `duration` | `Duration` | `Duration(seconds: 2)` | How long the fade-in animation lasts. |
| `curve` | `Curve` | `Curves.easeInOut` | The animation's rate of change over time. |

The animation runs once when the widget is inserted into the tree. To replay it,
provide a new key so Flutter creates fresh animation state:

```dart
FadingInWidget(
  key: ValueKey(replayCount),
  child: const Text('Hello again!'),
),
```

Increment `replayCount` inside `setState` to replay the animation. The example app
demonstrates this with individual and global replay buttons.

## Example app

The [example app](example/README.md) is a pastel-colored animation playground
with three different previews:

- **A warm hello:** a sunshine greeting card using the default settings.
- **Set the mood:** a mini music player with a delayed, faster entrance.
- **Little wins matter:** an achievement notification with a slower reveal.

Each card displays its animation settings and usage code. The layout adapts to
phone, tablet, and desktop widths, and the project includes Android, iOS, and web
runners.

From the repository root:

```sh
cd example
flutter pub get
flutter run
```

Use `flutter run -d chrome` to run the web example. See
[`example/lib/main.dart`](example/lib/main.dart) for the animation examples and
[`example/lib/showcase_widgets.dart`](example/lib/showcase_widgets.dart) for the
preview widgets.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for release notes.

## License

Released under the [MIT License](LICENSE).
