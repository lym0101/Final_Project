void game() {
  background(0, 100, 0);

  //player paddle (floating rect)
  fill(255);
  rect(px, py, pd, ph);

  //move the player left / right (rect block)
  if (akey     && px - pd/2 > 0)     px -= 8;
  if (dkey     && px + pd/2 < width) px += 8;
  if (leftkey  && px - pd/2 > 0)     px -= 8;
  if (rightkey && px + pd/2 < width) px += 8;

  //falling balls/bricks
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      brickLayout(i);              //draw the ball + check if it hit the player
      if (timer == 0) {
        y[i] = y[i] + speed[i];    //the ball falls
      }
      //ball made it past the bottom -> you dodged it! remove it and drop a new one
      if (y[i] > height + ballSize[i]/2) {
        respawn(i);
        score += 1;
        success.rewind();
        success.play();
      }
    }
    i++;
  }

  //scoreboard
  textSize(50);
  fill(255);
  text("Score:" + score, 7*width/8, 700);
  text("Lives:" + lives, 1*width/8, 700);

  //short countdown before the balls start dropping
  if (timer > 0) {
    fill(255);
    text(round(timer/60.0), width/2, 100);
    timer = timer - 1;
  }
  if (lives <= 0) {
    mode = GAMEOVER;
  }
}

void gameClicks() {
  mode = PAUSE;
}
