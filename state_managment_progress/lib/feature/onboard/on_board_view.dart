import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:state_managment_progress/feature/onboard/on_board_model.dart';
import 'package:state_managment_progress/feature/onboard/tab_indicator.dart';
import 'package:state_managment_progress/feature/product/padding/page_padding.dart';
import 'package:state_managment_progress/feature/product/widgets/on_board_card.dart';

part './module/start_fab_button.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skiptile = 'Skip';
  int _selectedIndex = 0;

  bool get _isLastPage =>
      OnBoardModels.onBoardItems.length - 1 == _selectedIndex;

  bool get _isFirstPage => _selectedIndex == 0;

  // ---- xx
  ValueNotifier<bool> isBackEnable = ValueNotifier(false);
  // --- xx

  void _incrementAndChange([int? value]) {
    if (_isLastPage && value != null) {
      _changeBackEnable(true);
      return;
    }
    _incrementSelectedPage(value);
    _changeBackEnable(false);
  }

  void _incrementSelectedPage([int? value]) {
    setState(() {
      if (value != null) {
        _selectedIndex = value;
      } else {
        _selectedIndex++;
      }
    });
  }

  void _changeBackEnable(bool value) {
    if (value == isBackEnable.value) {
      return;
    }
    isBackEnable.value = value;
  }

  // void _dicrementAndChance([int? value]) {
  //   if (_isFirstPage && value != null) {
  //     return;
  //   }
  //   dicrementSelectedPage(value);
  // }

  // void dicrementSelectedPage(int? value) {
  //   setState(() {
  //     _selectedIndex = value ?? _selectedIndex--;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(
          children: [
            Expanded(
              child: _pageViewItems(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabIndicator(
                  selectedIndex: _selectedIndex,
                ),
                _StartFabButton(
                  isLastPage: _isLastPage,
                  onPressed: () {
                    _incrementAndChange();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  PageView _pageViewItems() {
    return PageView.builder(
      onPageChanged: (value) {
        _incrementAndChange(value);
      },
      itemBuilder: (context, index) {
        return OnBoardCard(model: OnBoardModels.onBoardItems[index]);
      },
      itemCount: OnBoardModels.onBoardItems.length,
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [
        ValueListenableBuilder<bool>(
            valueListenable: isBackEnable,
            builder: (BuildContext context, bool value, Widget? child) {
              return value
                  ? const SizedBox()
                  : TextButton(
                      child: Text(_skiptile),
                      onPressed: () {},
                    );
            })
      ],
      leading: _isFirstPage
          ? null
          : IconButton(
              icon: const Icon(Icons.chevron_left_outlined),
              color: Colors.grey,
              onPressed: () {
                // _dicrementAndChance();
              },
            ),
    );
  }
}
