void reset() {
  mode = INTRO;
  music.rewind();
  gameover.rewind();
  //initialize paddle (floats above the bottom)
  px = width/2;
  py = height - 160;
  pd = 120;            //paddle width
  ph = 24;             //paddle height
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

  //drop every ball back in at a fresh random spot/speed
  for (int i = 0; i < n; i++) {
    respawn(i);
    alive[i] = true;
  }
}

//send ball i back above the screen at a new random spot, size and speed
void respawn(int i) {
  ballSize[i] = random(30, 90);                          //random size (30-90, capped so it stays dodge-able)
  x[i] = random(ballSize[i]/2, width - ballSize[i]/2);   //random left-right spot (kept fully on screen)
  y[i] = random(-height, -ballSize[i]);                  //start somewhere above the top of the screen
  speed[i] = random(4, 9);                               //random falling speed
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
  //give each ball a colour (cycles through 5 colours)
  if ( i % 5 == 0 ) {
    fill(248, 113, 113);
  } else if ( i % 5 == 1) {
    fill( 88, 80, 223);
  } else if ( i % 5 == 2) {
    fill(196, 181, 253);
  } else if (i % 5 == 3) {
    fill(74, 222, 128);
  } else {
    fill(254, 252, 243);
  }
  circle(x[i], y[i], ballSize[i]);
  //did this ball hit the player?
  //true only when the ball and paddle overlap left-to-right AND up-and-down
  if (abs(x[i] - px) < pd/2 + ballSize[i]/2 && abs(y[i] - py) < ph/2 + ballSize[i]/2) {
    lives -= 1;
    failure.rewind();
    failure.play();
    respawn(i);
  }
}
