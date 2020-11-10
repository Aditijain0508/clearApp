import 'package:flutter/material.dart';
import 'package:clear/Screens/PageControllerViews.dart';
import 'package:clear/Screens/ToDoScreen.dart';

class PageViewController extends StatefulWidget {
  @override
  _PageViewControllerState createState() => _PageViewControllerState();
}

class _PageViewControllerState extends State<PageViewController> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      onPageChanged: (pageIndex) {
        if (pageIndex == 7) {}
      },
      children: [
        PageControllerViews(
          text: 'Clear sort items by priority.',
          imageString: 'Images/Image1.png',
          secondaryText: 'Imported items are highlighted at the top...',
        ),
        PageControllerViews(
          text: 'Tap and hold to pick an item up.',
          imageString: 'Images/Image2.png',
          secondaryText: 'Drag it up or down to change its priority.',
        ),
        PageControllerViews(
          text: 'There are three navigation levels...',
          imageString: 'Images/Image3.png',
          secondaryText: ' ',
        ),
        PageControllerViews(
          text:
              'Pinch together vertically to collapse your current level and navigate up.',
          imageString: 'Images/Image4.png',
          secondaryText: ' ',
        ),
        PageControllerViews(
          text: 'Tap on a list to see its content.',
          imageString: 'Images/Image5.png',
          secondaryText: 'Tap on a list title to edit it',
        ),
        PageControllerViews(
          text: ' ',
          imageString: 'Images/Image6.png',
          secondaryText: ' ',
        ),
        PageControllerViews(
          text: ' ',
          imageString: 'Images/Image7.png',
          secondaryText: '',
        ),
        ToDoScreen(),
      ],
    );
  }
}
