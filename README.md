# top_modal_sheet

A popup simple topModalSheet menu button widget with handsome design and easy to use.

## Installations

Add `top_modal_sheet: ^1.0.0` in your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:top_modal_sheet/top_modal_sheet.dart';
```

## How to use

Simply call showModalTopSheet to display it

```dart
MaterialButton(
  color: Colors.white,
  elevation: 5,
  child: const Text("Show TopModal"),
  onPressed: () async {
    var value = await showTopModalSheet<String>(context: context, child: DumyModal());

    if(value != null){
      setState(() {
        _topModalData = value;
      });
    }
  },
)
```

Here is another way to invoke the modal using a Globalkey to get a smooth pop animation

```dart
final _topModalSheetKey = GlobalKey<TopModalSheetState>();

MaterialButton(
  color: Colors.white,
  elevation: 5,
  child: const Text("Show TopModal 2"),
  onPressed: () async {
    var value = await Navigator.of(context).push<List<int>>(PageRouteBuilder(pageBuilder: (_, __, ___) {
      return TopModalSheet(
        key: _topModalSheetKey,
        child: Container(color: Colors.teal, height: MediaQuery.of(context).size.height * .2, child: Center(
          child: MaterialButton(
            color: Colors.white,
            child: const Text("Back", style: TextStyle(color: Colors.teal),),
            onPressed: () {
              _topModalSheetKey.currentState.onBackPressed(data: [1,2,3]);
            },
          )
        )),
      );
    }, opaque: false));

    if(value != null){
      setState(() {
        _topModalData = "$value";
      });
    }
  },
)
```

For a more detail example please take a look at the `example` folder.

## Example

Menu button with 3 items:

#<img src="https://github.com/Pilaba/TopModalSheet/blob/master/example/A.png" width="200" height="500">
#<img src="https://github.com/Pilaba/TopModalSheet/blob/master/example/B.png" width="200" height="500">
![alt-text-1](https://github.com/Pilaba/TopModalSheet/blob/master/example/A.png "title-1") ![alt-text-2](https://github.com/Pilaba/TopModalSheet/blob/master/example/B.png "title-2")

## -

If something is missing, feel free to open a ticket or contribute!