import 'package:chorus_app/HeroDialogRoute.dart';
import 'package:chorus_app/widgets/custom_rect_tween.dart';
import 'package:chorus_app/widgets/filter_card.dart';
import 'package:chorus_app/model/Song.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String _languageListItem;

  void initState() {
    super.initState();
    _languageListItem = "English";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Scaffold(
        appBar: _appBar(context),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Container(
                  height: 48,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _searchSongField(),
                      SizedBox(
                        width: 5,
                      ),
                      _filterButton(),
                    ],
                  ),
                ),
              ),
              _songList()
            ],
          ),
        ),
      )),
    );
  }

  AppBar _appBar(BuildContext context) {
    List listItems = ['English', 'Tamil', 'Bi-Lin'];
    String? dropdownValue = 'One';

    return AppBar(
        title: Text(
          "English Songs",
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ]);
  }

  Widget _searchSongField() {
    return Expanded(
      flex: 5,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: 'Serach for a Song',
          prefixIcon: Icon(
            Icons.search_outlined,
            color: Colors.grey,
          ),
          hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
    );
  }

  Widget _filterButton() {
    return Flexible(
      flex: 1,
      child: Container(
        height: 48,
        width: 48,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(HeroDialogRoute(builder: (context) {
              return const FilterCard();
            }));
          },
          child: Hero(
            tag: FilterCard.filterButtonTag,
            createRectTween: (begin, end) {
              return CustomRectTween(begin: begin!, end: end!);
            },
            child: Material(
              color: Theme.of(context).accentColor,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: const Icon(
                Icons.filter_alt_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _songList() {
    return Expanded(
      child: ListView.builder(
        itemCount: Data.songList.length,
        itemBuilder: (ctx, index) {
          return Container(
            padding: const EdgeInsets.all(0),
            child: Card(
              child: ListTile(
                onTap: () {},
                leading: Text(Data.songList[index].number),
                title: Text(Data.songList[index].name),
              ),
            ),
          );
        },
      ),
    );
  }
}
