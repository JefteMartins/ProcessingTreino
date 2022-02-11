float a=0.5, b=0.3, c=0.4;// estabelecendo a rodação
float x=240, y=240, z=240, p=0; // variaveis para alterar os lados e as cores do cubo
boolean primeiromudar = true, primeiroreverter=false, segundomudar=false, segundoreverter=false, terceiromudar=false, terceiroreverter=false;
//booleanos para estabelecer "estados" de mudança e reverter essa mudança
void setup() {
  size(700, 700, P3D);
}
void draw() {
  background(153, 51, 153);
  translate(350, 350);
  rotateX(a);
  rotateY(b);
  rotateZ(c);
  a+=0.005;//incrementos das rotações para que o cubo fique se movento
  b+=0.003;
  c+=0.004;
  box(x, y, z);// como os lados estariam em constante mudança, seria melhor retratar as dimensões com variáveis

  p=(x/40)*(y/40)*(z/40);  
  /*"p" é a variável que definirá a cor do cubo. Estabeleci dessa forma pois como os lados do cubo são 240
   dividindo por 40 ficaria 6^3, que resulta em 236. Decidi por 6, pois seria o maior inteiro que 
   elevado ao cubo, ficaria abaixo de 255, valor maximo do sistema RGB. O intuito da mudança de cor
   é mostrar que quanto maior a área, mais branco o cubo ficaria. Nota-se na questão em que p, também corresponde
   a área do cubo 40x menor, mantendo a proporcionalidade*/
  if (p<236) {
    fill(p);
  }
  if (p==236) {//para chegar ao branco, de fato, em seu máximo, decidi por o 255 quando o cubo chegasse em sua área máxima

    fill(255);
  }
  if (primeiromudar) { /* esse modo ja inicia verdadeiro, aumentando a primeira variavel que corresponde a
   um lado do cubo e diminuindo a segunda.*/
    x+=2;
    y-=2; 
    if (x==480) /* a ideia aqui, é que para que o perímetro se mantenha, eu tire o valor de um lado e incremente este em outro
     dessa forma, quando este lado perder todo seu valor, chegando a 0, o outro lado terá o dobro, e assim,
     parará de crescer, o mesmo ocorre nas outros estados que fazem o cubo mudar*/
    {
      primeiromudar = false;// assim que o objetivo é atingido, o mudar se torna falso
      primeiroreverter = true;// em seguida, esta ação se torna verdadeira, revertendo o passo anterior para que o cubo volte a sua forma original
    }
  }
  if (primeiroreverter) {
    x-=2;        //operação inversa para recuperar a forma original do cubo
    y+=2;
    if (x==240) //quando o lado voltar ao que era antes, o reverter para, e começa um novo ciclo
    {
      segundomudar = true;
      primeiroreverter=false;
    }
  }
  if (segundomudar) { //início do novo ciclo, desta vez, alterando a segunda e terceira variável dos lados do cubo
    y+=2;
    z-=2; 
    if (y==480)
    {
      segundomudar = false;
      segundoreverter = true;
    }
  }
  if (segundoreverter) {// reverter a mudança da segunda e terceira variável
    y-=2;
    z+=2;
    if (y==240)
    {
      terceiromudar = true;
      segundoreverter=false;
    }
  }
  if (terceiromudar) { //mudar a terceira e primeira variável dos lados do cubo
    z+=2;
    x-=2; 
    if (z==480)
    {
      terceiromudar = false;
      terceiroreverter = true;
    }
  }
  if (terceiroreverter) { //reverter as mudanças do terceiro e primeiro lado
    z-=2;
    x+=2;
    if (z==240)
    {
      primeiromudar = true; //votlar ao primeiro estado em que altera a primeira e segunda variável
      terceiroreverter=false;
    }
  }
}
