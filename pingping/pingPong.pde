int bolaY, bolaX, bastaoY=250, bolaX1=10, bastaoY1=250;
int contador1=0, contador2=0;
int dY = 5, dX = 5;
void setup() {
  size(800, 600);
  bolaY=height/2;
  bolaX=width/2;
}
void draw() {

  background(0);
  fill(255);
  textSize(32);
  text(contador1, width/4, 50);
  text(contador2, width*0.75, 50);
  stroke(255);
  line(width/2, 0, width/2, height);
  ellipse(bolaX, bolaY, 20, 20);
  bolaY = bolaY + dY;
  if (bolaY>=height-10 || bolaY<=10)
    dY=-dY;
  bolaX = bolaX + dX;
  if ((bolaX<=50)&& (bolaY>bastaoY1) && (bolaY<bastaoY1+100))
    dX=-dX;
  else if (bolaX>=(width-30) && (bolaY>bastaoY) && (bolaY<bastaoY+100))
    dX=-dX;
  else if (bolaX>=width+100) {
    bolaX=400;
    bolaY=300;
    dX=-dX;
    contador1++;
  } else if (bolaX<-100) {
    bolaX=400;
    bolaY=300;
    dX=-dX;
    contador2++;
  }
  rect(width-30, bastaoY, 20, 100);
  rect(30, bastaoY1, 20, 100);
  if (keyPressed) {
    if (keyCode==DOWN) { 
      if (bastaoY<=500) 
        bastaoY+=7;
    } else if (keyCode==UP)
      if (bastaoY>=0)
        bastaoY-=7;
  }
  if (keyPressed) {
    if (key=='s'||key=='S') {
      if (bastaoY1<=500) 
        bastaoY1+=7;
    } else if (key=='W'||key=='w') {
      bastaoY1-=7;
      if (bastaoY1<0) {
        bastaoY1=0;
      }
    }
  }
}
