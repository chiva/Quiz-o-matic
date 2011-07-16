#include <SD.h>
#include <TVout.h>
#include <fontALL.h>

#define LINEA1 75
#define LINEA2 90
#define PUNT_OFFSET 5
#define PUNT_SEPAR 30
#define W_MARCADO 14
#define H_MARCADO 9
#if defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
  #define PIN_PULS_INI 56
  #define PIN_PULS_FIN 59
#else
  #define PIN_PULS_INI 16
  #define PIN_PULS_FIN 19
#endif

TVout TV;
byte puntuacion[]={0,0,0,0};

void setup(){
  Serial.begin(9600);
  //Los pulsadores para los juegadores, se conectarán a:
  //A2=jugador1, A3=jugador2, etc.
  for (int i=PIN_PULS_INI;i<=PIN_PULS_FIN;i++){
    pinMode(i, INPUT);
  }
  //Activamos pull-up
  for (int i=PIN_PULS_INI;i<=PIN_PULS_FIN;i++){
    digitalWrite(i, HIGH);
  }
  TV.begin(PAL,120,96);
  TV.select_font(font6x8);
  TV.clear_screen();
  //TV.println("Quiz-o-matic");
  intro();
  TV.delay(3000);
}

void loop(){
  byte player;
  boolean respuesta,resultado;

  limpiaPantalla();
  TV.println(0,0,"En que ciudad se realiza la Campus Party 2011?");
  Serial.println("En que ciudad se realiza la Campus Party 2011?");
  player = jugador();
  Serial.print("Responde: ");
  Serial.println(player,DEC);
  marcarJugador(player);
  Serial.println(player,DEC);
  esperarTodos();
  while(digitalRead(player+(PIN_PULS_INI-1))==HIGH);
  limpiaPantalla();
  TV.println(0,0,"Valencia");
  Serial.println("Valencia");
  marcarJugador(player);
  esperarTodos();
  limpiaPantalla();
  marcarJugador(player);
  TV.println(0,0,"Valencia");
  Serial.println("Valencia");
  resultado = check(player);
  if (resultado) { masuno(player); }
  TV.delay(1000);
  limpiaPantalla();
  esperarTodos();
}

byte jugador(){
  for(;;){
    for(byte i=PIN_PULS_INI;i<=PIN_PULS_FIN;i++){
      if (digitalRead(i)==LOW){
        return i-(PIN_PULS_INI-1);
      }
    }
  }
}

boolean check(byte player){
  byte pulsado;
  pulsado = jugador();
  if (pulsado!=player){
    puntuacion[player-1] += 1;
    Serial.println("Acerto!");
    TV.println("Acerto!");
    return true;
  }
  else{
    Serial.println("Fallo!");
    TV.println("Fallo!");
    return false;
  }
}

void esperarJugador(byte player){
  while(digitalRead(player+(PIN_PULS_INI-1))==LOW);
}

void esperarTodos(){
  boolean suelto = false;
  while(!suelto){
    suelto = true;
    for(int i=PIN_PULS_INI;i<=PIN_PULS_FIN;i++){
      if (digitalRead(i)==LOW){
        suelto = false;
      }
    }
  }
}

void mostrarPuntuaciones(){
  TV.print(PUNT_OFFSET,LINEA1,"P1");
  TV.print(PUNT_OFFSET+PUNT_SEPAR,LINEA1,"P2");
  TV.print(PUNT_OFFSET+PUNT_SEPAR*2,LINEA1,"P3");
  TV.print(PUNT_OFFSET+PUNT_SEPAR*3,LINEA1,"P4");
  for(int i=0;i<4;i++){
    TV.print(PUNT_OFFSET+PUNT_SEPAR*i,LINEA2,puntuacion[i],DEC);
  }
}

void printMasuno(byte player){
  TV.print(PUNT_OFFSET+PUNT_SEPAR*(player-1)+10,LINEA2,"+1");
}

void masuno(byte player){
  printMasuno(player);
  TV.delay(1000);
}

void marcarJugador(byte player){
  switch (player){
  case 1:
    TV.draw_rect(PUNT_OFFSET-2,LINEA1-2,W_MARCADO-1,H_MARCADO,WHITE);
    break;
  case 2:
    TV.draw_rect(PUNT_OFFSET-2+PUNT_SEPAR,LINEA1-2,W_MARCADO,H_MARCADO,WHITE);
    break;
  case 3:
    TV.draw_rect(PUNT_OFFSET-2+PUNT_SEPAR*2,LINEA1-2,W_MARCADO,H_MARCADO,WHITE);
    break;
  case 4:
    TV.draw_rect(PUNT_OFFSET-2+PUNT_SEPAR*3,LINEA1-2,W_MARCADO,H_MARCADO,WHITE);
    break;
  }
}

void limpiaPantalla(){
  TV.clear_screen();
  mostrarPuntuaciones();
}

void intro(){
  char titulo[] = "Quiz-O-rama";
  byte w = sizeof(titulo)*6/sizeof(char);
  for(byte i=0;i<TV.vres()-8;i++){
    TV.print((TV.hres() - w)/2,i,titulo);
    TV.delay(50);
    TV.clear_screen();
  }
}
