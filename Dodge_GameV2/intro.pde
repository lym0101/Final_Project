void intro() {
  //music.play();

  drawIntro();

  strokeWeight(1);
  fill(255,255,0);
  textSize(52);
  text("DODGE IT!", width/2, 300);

  tactile(300, 550, 200, 100); // not working currently
  fill(10, 0, 216, 190);
  stroke(255);
  textSize(36);
  rect(width/2, 550, 200, 100, 20);
  fill(255);
  text("START", width/2, 550);
  
  fill(10,0,216,190);
  stroke(255);
  tactile(300,650,200,100);
  rect(400,700,200,100,20);
  fill(0);
  text("RULES", 400, 700);

  noFill();
}

void introClicks () {
  if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > 500 && mouseY < 600) {
    mode = GAME;
    music.pause();
    music.rewind();
  }
  if (mouseX > 300 && mouseX < 500 && mouseY > 650 && mouseY < 750) {
    mode = RULES;
  }
}

void drawIntro() {
  image(gif[f],0,0,width,height);
  f++;
  if (f == numberOfFrames) f=0;
}
