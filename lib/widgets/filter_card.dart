import 'dart:developer';

import 'package:chorus_app/model/enums.dart';
import 'package:chorus_app/widgets/custom_rect_tween.dart';
import 'package:flutter/material.dart';

class FilterCard extends StatefulWidget {
  /// {@macro add_todo_popup_card}
  const FilterCard({Key? key}) : super(key: key);
  static String filterButtonTag = 'fitler-button';

  @override
  _FilterCardState createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  @override
  Widget build(BuildContext context) {
    ButtonStyle _buttonNotSelectedStyle = ButtonStyle(
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Theme.of(context).accentColor, width: 1))),
    );

    ButtonStyle _buttonSelectedStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Theme.of(context).accentColor),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      )),
    );

    Language _selectedLanguage = Language.English;
    SortType _selectedSortType = SortType.Alphabet;
    SortOrder _selectedSortOrder = SortOrder.Ascending;
    log(_selectedSortType.toString());

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: FilterCard.filterButtonTag,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin!, end: end!);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Sort by"),
                    SizedBox(
                      height: 10,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedSortType = SortType.Number;
                                  });
                                },
                                child: Text("Number"),
                                style: _selectedSortType == SortType.Number
                                    ? _buttonSelectedStyle
                                    : _buttonNotSelectedStyle,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text("Alphabet"),
                                style: _buttonNotSelectedStyle,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text("ASC"),
                                style: _buttonNotSelectedStyle,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text("DESC"),
                                style: _buttonNotSelectedStyle,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Language"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("English"),
                          style: _buttonNotSelectedStyle,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Tamil"),
                          style: _buttonNotSelectedStyle,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Bi-Lingual"),
                          style: _buttonNotSelectedStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Category"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text("Praise"),
                            style: _buttonNotSelectedStyle),
                        TextButton(
                            onPressed: () {},
                            child: Text("Love"),
                            style: _buttonNotSelectedStyle),
                        TextButton(
                            onPressed: () {},
                            child: Text("Worship"),
                            style: _buttonNotSelectedStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
