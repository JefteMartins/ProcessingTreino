float x=0;
boolean criarArvore= true;
void setup() {
  background(153, 204, 50);
  size(500, 500, P3D);
}
void draw() {
  if (criarArvore) {
    for (int i=0; i<=height; i+=40) {
      for (int j=320; j<=480; j+=40) {
        int aleatorio = int(random(10));
        if (aleatorio<8) {
          int variar= int(random(-10,20));
          desenhaArvore(i+variar, j+variar);
        }
      }
      if (i==480) {
        criarArvore=false;
      }
    }
  }
  rectMode(CENTER);
  noStroke();
  fill(0, 0, 255);
  rect(width/2, height/4, width, height/4);
  x+=1.6;
  if (x>width+30) {
    x=-100;
  }
  fill(50);
  rect(width/2, 245, width, 60);
  for ( int i=0; i<width; i+=30) {
    fill(255, 155, 20);
    rect(0+i, 245, 20, 4);
  }  
  fill(255);
  rect(50+x, 250, 60, 15);
  rect(40+x, 237, 30, 10);

  fill(0);
  rect(33+x, 237, 10, 6);
  rect(46+x, 237, 10, 6);
  ellipse(30+x, 258, 12, 12);
  ellipse(70+x, 258, 12, 12);

  fill(255);
  ellipse(30+x, 258, 4, 4);
  ellipse(70+x, 258, 4, 4);
}
void desenhaArvore(int arvoreX, int arvoreY)
{
  noStroke();
  fill(165, 42, 42);
  rectMode(CENTER);
  rect(arvoreX, arvoreY, 10, 40);
  fill(42, 255, 42);
  ellipse(arvoreX, arvoreY-20, 30, 30);
}
