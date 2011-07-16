void setup(){
  //Los pulsadores para los juegadores, se conectarán a:
  //A2=jugadir1, A3=jugador2, etc.
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  pinMode(A4, INPUT);
  pinMode(A5, INPUT);
  //Activamos pull-up
  digitalWrite(A2, HIGH);
  digitalWrite(A3, HIGH);
  digitalWrite(A4, HIGH);
  digitalWrite(A5, HIGH);
}

void loop(){
}
