#include <TVout.h>
#include <fontALL.h>

#define LINEA1 75
#define LINEA2 90

TVout TV;
byte puntuacion[]={0,0,0,0};

void setup(){
  Serial.begin(9600);
  //Los pulsadores para los juegadores, se conectarán a:
  //A2=jugador1, A3=jugador2, etc.
  for (int i=16;i<=19;i++){
    pinMode(i, INPUT);
  }
  //Activamos pull-up
  for (int i=16;i<=19;i++){
    digitalWrite(i, HIGH);
  }
  TV.begin(PAL,120,96);
  TV.select_font(font6x8);
  TV.clear_screen();
  TV.println("Quiz-o-matic");
  delay(3000);
}

void loop(){
  byte player;
  boolean respuesta;


  TV.clear_screen();
  TV.println("En que ciudad se realiza la Campus Party 2011?");
  Serial.println("En que ciudad se realiza la Campus Party 2011?");
  player = jugador();
  Serial.print("Responde: ");
  TV.print("Responde: ");
  TV.println(player,DEC);
  Serial.println(player,DEC);
  esperarTodos();
  while(digitalRead(player+15)==HIGH);
  TV.println("Valencia");
  Serial.println("Valencia");
  esperarTodos();
  TV.delay(300);
  check(player);
  mostrarPuntuaciones();
  TV.delay(3000);
  esperarTodos();
}

byte jugador(){
  for(;;){
    for(byte i=16;i<=19;i++){
      if (digitalRead(i)==LOW){
        return i-15;
      }
    }
  }
}

void check(byte player){
  byte pulsado;
  pulsado = jugador();
  if (pulsado!=player){
    puntuacion[player-1] += 1;
    Serial.println("Acerto!");
    TV.println("Acerto!");
  }
  else{
    Serial.println("Fallo!");
    TV.println("Fallo!");
  }
}

void esperarJugador(byte player){
  while(digitalRead(player+15)==LOW);
}

void esperarTodos(){
  for(;;){
    if ((digitalRead(16)==HIGH) && (digitalRead(17)==HIGH) && (digitalRead(18)==HIGH) && (digitalRead(19)==HIGH)){
      return;
    }
  }
}

void mostrarPuntuaciones(){
  TV.print(5,LINEA1,"P1");
  TV.print(35,LINEA1,"P2");
  TV.print(65,LINEA1,"P3");  
  TV.print(95,LINEA1,"P4");
  TV.print(5,LINEA2,puntuacion[0],DEC);
  TV.print(35,LINEA2,puntuacion[1],DEC);
  TV.print(65,LINEA2,puntuacion[2],DEC);
  TV.print(95,LINEA2,puntuacion[3],DEC);
}


