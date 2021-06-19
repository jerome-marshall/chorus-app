import 'dart:core';

class Song {
  String name = "SongName";
  String number = "1";

  Song(this.number, this.name);
}

class Data {
  static List<Song> songList = [
    Song("1", "Holy Holy Holy"),
    Song("2", "To God be the lory"),
    Song("3", "Power of your love"),
    Song("4", "Awesome God"),
    Song("5", "Seet Jesus"),
    Song("6", "Heaven is a wonderful place"),
    Song("7", "Shine Jesus shine"),
    Song("3", "Praise Him praise Him"),
    Song("6", "Heaven is a wonderful place"),
    Song("7", "Shine Jesus shine"),
    Song("3", "Praise Him praise Him"),
  ];
}
