void pause() {
  music.pause();
  fill(255,190);
  textSize(88);
  text("PAUSE!", width/2, width/2);
  textSize(32);
  text("<CLICK ANYWHERE TO RESUME>", width/2, width/2 +75);
}

void pauseClicks () {
    mode = GAME;
}
