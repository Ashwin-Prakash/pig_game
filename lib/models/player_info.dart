class PlayerInfo {
  String playerName;
  int score = 0;
  bool active = false;
  PlayerInfo(this.playerName);
  void addScore(int points) {
    score += points;
  }

  void toggleActiveState() {
    active ? active = false : active = true;
  }
}
