[![pub package](https://img.shields.io/pub/v/flutter_lints.svg)](https://pub.dev/packages/top_modal_sheet)

# top_modal_sheet

Simple modal sheet that appears from the top of the screen

## Installations

Add `top_modal_sheet: ^2.1.0` in your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:top_modal_sheet/top_modal_sheet.dart';
```

## How to use

Simply call showModalTopSheet to display it

```dart
MaterialButton(
  color: Colors.white,
  elevation: 5,
  child: const Text("Show TopModal 1"),
  onPressed: () async {
    var value = await showTopModalSheet<String?>(context, DummyModal());
    setState(() { _topModalData = value; });
  },
)
```

For a more detail example please take a look at the `example` folder.

## Example

<img src="https://raw.githubusercontent.com/Pilaba/TopModalSheet/master/example/screenshots/main_screen.png" width="250" height="450">
<img src="https://raw.githubusercontent.com/Pilaba/TopModalSheet/master/example/screenshots/top_modal.png" width="250" height="450">
<img src="https://raw.githubusercontent.com/Pilaba/TopModalSheet/master/example/screenshots/top_modal_result.png" width="250" height="450">

## -

If something is missing, feel free to open a ticket or contribute!
