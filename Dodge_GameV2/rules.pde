void rules() {
  background(0, 100, 0);

  //title
  fill(255, 255, 0);
  textSize(58);
  text("HOW TO PLAY", width/2, 110);

  //rules text
  fill(255);
  textSize(28);
  text("Balls drop from the top of the screen at\n" +
       "random spots and random speeds.\n\n" +
       "Move your circle with  A / D  or the\n" +
       "LEFT / RIGHT arrow keys.\n\n" +
       "Dodge the balls! Every ball that falls\n" +
       "safely past you is worth  +1  point.\n\n" +
       "Get hit and you lose a life. Lose all\n" +
       "3 lives and it is GAME OVER.\n\n" +
       "Click the screen while playing to PAUSE.\n\n" +
       "See how high a score you can get!", width/2, height/2 + 20);

  //back button
  tactile(width/2, height - 80, 200, 80);
  stroke(255);
  rect(width/2, height - 80, 200, 80, 20);
  fill(255);
  textSize(32);
  text("BACK", width/2, height - 80);
  noFill();
}

void rulesClicks() {
  mode=INTRO;
}
