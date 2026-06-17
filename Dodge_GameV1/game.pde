void game() {
  background(0, 100, 0);

  //paddles
  circle(px, py, pd);

  //move paddles
  // Move left paddle — half submerged at edges
  if (akey    && px - pd/2 > 0) px -= 8;
  if (dkey    && px + pd/2 < width - pd/2) px += 8;
  if (leftkey  && px - pd/2 > 0) px -= 8;
  if (rightkey && px + pd/2 < width + pd/2) px += 8;

  if (timer == 0) {
    bx = bx + vx;
    by = by + vy;
  }
  //bricks
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      brickLayout(i);
    }
    i++;
  }

  //ball
  circle(bx, by, bd);

  //bouncing
  if ( by < bd/2) {
    vy = abs(vy);
  }
  if (by > height -bd/2) {
    vy = -abs(vy);
  }
  if ( bx < bd/2) {
    vx = abs(vx);
  }
  if (bx > width -bd/2) {
    vx = -abs(vx);
  }

  //Circle Paddle Collisions
  if (dist (bx, by, px, py) <= bd/2 + pd/2) {
    vx = (bx - px)/9.75;
    vy = (by - py)/9.75;
  }

  //scoreboard
  textSize(50);
  fill(255);
  text("Score:" + score, 7*width/8, 700);
  text("Lives:" + lives, 1*width/8, 700);

  if (timer > 0) {
    fill(255);
    text(timer/60, width/2, 100);
    timer = timer - 1;
  } else {
    noFill();
  }

  fill(255);

  //scoring
  if (by >= height - bd/2) {
    lives -= 1;
    bx = width/2;
    by = 6*height/8 + 20;
    timer = 180;
  }
  if (lives <= 0) {
    mode = GAMEOVER;
  }
}

void gameClicks() {
  mode = PAUSE;
}
