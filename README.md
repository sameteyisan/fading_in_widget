
## Fading in Widget

<img  src="https://github.com/sameteyisan/fading_in_widget/blob/main/showcase.gif?raw=true"  width="280">
 
All you need to do is wrap your widget with the fading widget. The rest will happen by itself.

```dart
const FadingInWidget(
	child: FlutterLogo(),
),
```

Other parameters can come to the rescue if needed :)

```dart
const FadingInWidget(
	delay: Duration.zero, // This is the default value. 
	duration: Duration(seconds: 2), // This is the default value. 
	curve: Curves.easeInOut, // This is the default value. 
	child: FlutterLogo(),
),
```

That's all. Now you are ready to use the fading in widget.

Parameters are as follows. ☺️

-  **child**: This is the static widget you want to hide while scrolling.
-  **duration**: Determines how long the fade animation lasts.
-  **delay**: Determines after how long the fade animation will start.
-  **curve**: It is used to adjust the rate of change of the fade animation over time, allowing them to speed up and slow down instead of moving at a constant speed.