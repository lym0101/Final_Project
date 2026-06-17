void reset() {
  mode = INTRO;
  music.rewind();
  //initialize paddles
  px = width/2;
  py = height;
  pd = 100;
  bx = width/2;
  by = 6*height/8 +20 ;
  bd = 20;
  brickd = 40;
  lives = 3;

  //initialize keyboard variables
  akey = dkey = leftkey = rightkey = false;

  vx = 0;
  vy = 7;

  //initialize score
  score = 0;
  timer = 180;

  for (int i = 0; i < n; i++) {
    alive[i] = true;
  }
}


void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    stroke(#42fa45);
    fill(#a2d2ff);
  } else {
    stroke(#03045e);
    fill(255, 255, 194);
  }
}

void brickLayout(int i) {
  if ( i < 7 ) {
    fill(248, 113, 113);
  } else if ( i > 6 && i < 14) {
    fill( 88, 80, 23);
  } else if ( i > 13 && i < 21) {
    fill(196, 181, 253);
  } else if (i > 20 && i < 28) {
    fill(74, 222, 128);
  } else if ( i > 26 && i < 35) {
    fill(254, 252, 243);
  }
  circle(x[i], y[i], brickd);
  //brick collisions
  if (dist (bx, by, x[i], y[i]) <= bd/2 + brickd/2) {
    vx = (bx - x[i])/9.75;
    vy = (by - y[i])/9.75;
    alive[i] = false;
    score += 1;
    success.rewind();
    success.play();
  }
}
