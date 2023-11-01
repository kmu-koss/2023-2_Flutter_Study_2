class Fortune {
  String day;

  List<Luck> Lucks;

  Fortune(this.day, this.Lucks);

  // ignore: lines_longer_than_80_chars
  static const String content = 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';


  static List<Fortune> samples = [
    Fortune('Yesterday', [
      Luck(0, 10, content),
      Luck(1, 20, content),
      Luck(2, 30, content),
      Luck(3, 40, content),
    ],),
    Fortune('Today', [
      Luck(0, 15, content),
      Luck(1, 25, content),
      Luck(2, 35, content),
      Luck(3, 45, content),
    ],),
    Fortune('Tomorrow', [
      Luck(0, 50, content),
      Luck(1, 60, content),
      Luck(2, 70, content),
      Luck(3, 80, content),
    ],),
  ];
}


class Luck {
  static const List<String> names = ['총운', '재물운', '연애운', '소망운'];
  int idx;
  String? name;
  int score;
  String? content;

  Luck(int idx, int score, this.content) : idx = idx, score = score  {
    name = names[idx];
  }
}
