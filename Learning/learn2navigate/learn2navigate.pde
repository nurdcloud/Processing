Navigation n;

void setup(){
  size(300,500);
  n=new Navigation();
}

void draw(){
  background(255,255,255);
  n.update();
  n.render();
}

// Set new direction
void mouseReleased() {
 n.set();
}

// Pause
void keyPressed() {
  final int k = keyCode;

  if (k == 'P')
    if (looping)  noLoop();
    else          loop();
}
