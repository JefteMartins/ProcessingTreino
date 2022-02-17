PImage nave,universo, meteoro, celula, celula1;
float x=0, y=0, dX=5, naveX=1, naveY=799, dY=5, score=0;
float navegadorX, navegadorY;
float local=int(random(width)),cair,contando=0;
boolean chuvinha = true;
int[][] mapa = { 
  {1, 1, 0, 0, 0, 0, 0, 0, 1, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 1, 0, 0, 0, 0, 0, 0, 1, 1} };
void setup() {
  universo = loadImage("espaco.png");
  nave = loadImage("navezinha64.png");
  meteoro = loadImage("meteoro.png");
  celula = loadImage("celula.png");
  celula1 = loadImage("celula1.png");
  size(800, 600);
}
void draw() {
  noStroke();
  navegadorX=width/2+x;
  navegadorY=width/2+y;
  background(0);
  ellipse(naveX, 20, 10, 10);
  naveX+=dX;
  naveY+=dY;
  ellipse(naveY, height-20, 10, 10);
  if (naveX>=width||naveX<=0) {
    dX=-dX;
  }
  if (naveY>=width||naveY<=0) {
    dY=-dY;
  }
  imageMode(CENTER);
  image(universo,width/2,height/2);
  image(nave,navegadorX, navegadorY);
  navegarNave();
  mostraMapa();
  for (int i=0;i<5;i++){
    if(contando>300){
    local = int(random(0,width));
    contando=0;
    }
    contando++;
    checarColisao();
  criarMeteoritos();
  }
}
void mostraMapa() {
  fill(255,(int)random(256),0);
  for (int i=0; i<mapa.length; i++) {
    for (int j=0; j<mapa.length; j++) {
      if(mapa[i][j]==0) {
        int randomizar = int(random(2));
        if(randomizar==1){
        image(celula,100+i*65, 100+j*40);
        } else{
        image(celula1,100+i*65, 100+j*40);
        }
      }
      if (dist(navegadorX, navegadorY, 100+i*65, 100+j*40)<=10) {
        mapa[i][j]=1;
      }
    }
  }
} 
void navegarNave() {
  if ((keyPressed == true) && (keyCode == UP)) {
    y-=5;
  } else if ((keyPressed == true) && (keyCode == DOWN)) {
    y+=5;
  } else if ((keyPressed == true) && (keyCode == LEFT)) {
    x-=5;
  } else if ((keyPressed == true) && (keyCode == RIGHT)) {
    x+=5;
  }
}
void criarMeteoritos(){
  fill(144);
image(meteoro,local,cair);
cair+=2;
if(cair>height){
  cair=0;
}
}
void checarColisao(){
  if(dist(local,cair,navegadorX,navegadorY)<30){
  fill(0);
    rect(0,0,width,height);
    fill(255);
//    textMode(CENTER);
    textSize(72);
    text("FIM DE JOGO", 200,height/2);
    stop();
  }
}
