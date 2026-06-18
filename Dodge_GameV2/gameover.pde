void gameover() {
  music.pause();
  gameover.play();
  drawGameover();
  textSize(70);
  fill(0, 255, 255);
  text("GAME OVER!", width/2, 300);

  //scoring display
  textSize(55);
  text("Score: " + score, width/2, 500);

  textSize(32);
  text("<CLICK ANYWHERE TO CONTINUE>",width/2, 650);
}

void gameoverClicks () {
  reset();
  mode = INTRO;
}

void drawGameover() {
  image(gif[f], 0, 0, width, height);
  f++;
  if (f == numberOfFrames) f=0;
}
