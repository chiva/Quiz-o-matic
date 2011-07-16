#include <SD.h>
#include <TVout.h>
#include <fontALL.h>

TVout TV;

void setup(){
  //Los pulsadores para los juegadores, se conectarán a:
  //A2=jugador1, A3=jugador2, etc.
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  pinMode(A4, INPUT);
  pinMode(A5, INPUT);
  //Activamos pull-up
  digitalWrite(A2, HIGH);
  digitalWrite(A3, HIGH);
  digitalWrite(A4, HIGH);
  digitalWrite(A5, HIGH);
  
  TV.begin(PAL,120,96);
  TV.select_font(font6x8);
  TV.println("Quiz-o-matic");
  TV.delay(3000);
}

void loop(){
  TV.clear_screen();
}
