enum Rank {
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  knight,
  queen,
  king,
  ace,
}

extension RankValueExtension on Rank {
  int get value {
    switch (this) {
      case Rank.two:
        return 2;
      case Rank.three:
        return 3;
      case Rank.four:
        return 4;
      case Rank.five:
        return 5;
      case Rank.six:
        return 6;
      case Rank.seven:
        return 7;
      case Rank.eight:
        return 8;
      case Rank.nine:
        return 9;
      case Rank.ten:
        return 10;
      case Rank.jack:
        return 11;
      case Rank.knight:
        return 12;
      case Rank.queen:
        return 13;
      case Rank.king:
        return 14;
      case Rank.ace:
        return 1; // As = 1 selon les règles
    }
  }
}
