Quiz-O-Matic es un juego de velocidad y cultura del tipo pregunta y respuesta.

Emplea la placa Arduino y la librería TVOut que saca una señal PAL o NTSC hacia un dispositivo que permita este tipo de señal de vídeo como entrada. Puede ser una pantalla CRT o LCD con entrada de vídeo o también un proyector con entrada de vídeo.

Actualmente el juego está preparado para 4 jugadores.

## Funcionamiento

**Nota:** Esta versión del juego sólo posee una única pregunta de prueba, aunque está planeado el meter una pequeña cantidad de ellas.

1. Se extrae una pregunta de la base de datos
2. Muestra la pregunta a través del dispositivo de salida de vídeo conectado al Arduino
3. En este momento espera la pulsación del jugador más rápido que accione el botón
4. Éste contestará a viva voz la respuesta a la pregunta realizada
5. Una vez contestada, el jugador que ganó el turno deberá accionar de nuevo su pulsador y así el juego mostrará la respuesta correcta
6. Si la respuesta ha sido correcta uno de los otros tres jugadores deberá accionar su pulsador para dar la respuesta como correcta
7. En caso contrario el jugador que ha fallado deberá accionar su pulsador para dar la respuesta como incorrecta
8. El juego incrementará en un punto la puntuación del jugador que ha contestado si lo hizo correctamente
9. El juego comenzará otra vez el ciclo de pregunta

Si quieres ver el desarrollo de una ronda con imágenes, está disponible en [[Ronda]].

## Montaje

El montaje del hardware es bastante sencillo ya que el número de componentes es bastante reducido y se ha intentado simplificar éste todo lo posible.

Probablemente lo más complicado sea conectar el Arduino al cable RCA si no se tiene un conector hembra con los cables accesibles. El conector RCA es representado en el esquemático con una clema en la esquina inferior derecha.

![Esquema de montaje][i_esq_mont]

> Si quieres el esquemático de este proyecto, lo tenemos disponible para su [descarga][l_esqm]

La razón por la que los botones están conectados a las entradas analógicas es que se pueden utilizar como pines digitales y no son usados por el lector de tarjetas SD que viene en la Shield Ethernet, por lo que en un futuro se podría añadir la lectura de preguntas desde ella sin tener que modificar el montaje.

El montaje finalizado te debería quedar algo así en la VidaReal™:

![Montaje finalizado][i_esq_fin] ![Detalle conector vídeo][i_con_vid]

### Lista de materiales

| **Material**    | **Cantidad**|
| --------------- | -----------:|
| Placa Arduino   | 1           |
| Cable           | 1           |
| Conector RCA    | 1           |
| Botones         | 4           |
| Resistencia 470O| 1           |
| Resistencia 1kO | 1           |

El precio total de los componentes sin contar la placa de Arduino, no alcanza el euro, por lo que es un proyecto bastante económico para las posibilidades que ofrece.

[i_esq_mont]: https://raw.github.com/chiva/Quiz-o-matic/media/quiz_o_matic.png
[i_esq_fin]: https://raw.github.com/chiva/Quiz-o-matic/media/IMGP9168.JPG
[i_con_vid]: https://raw.github.com/chiva/Quiz-o-matic/media/IMGP9166.JPG
[l_esqm]: http://fritzing.org/media/fritzing-repo/projects/q/quiz-o-matic/fritzing/quiz_o_matic.fz

## Conexión del vídeo

El juego hace uso de la librería [tvout][l_tvout], por lo que deberás descargarla y añadirla en la carpeta de librerías de Arduino. En el momento de la realización, se usó la versión [Beta1][l_beta1].

El juego por defecto saca vídeo según el estándar PAL (puede cambiarse el código para obtener NTSC) y el formato de transmisión es mediante vídeo compuesto (el que va por el jack RCA), por lo que muchas televisiones tanto de tubo como TFT aceptan esta conexión, así como proyectores, mini-televisores, reproductores de DVD portátil, etc.

La salida de video se obtiene según el siguiente esquemático de conexionado:

![Conexión vídeo][i_esq_vid]

En la siguiente tabla encontrarás los pines para las diferentes variantes de la placa que corresponden a los referenciados en el esquemático de conexionado.

| ***Arduino*** | **Sync**  | **Video** |
| ------------- | --------- | ---------:|
| **UNO**       | 9         | 7         |
| **Mega**      | 11        | 29        |

Si montas tu propio conector, ten en cuenta que el pin central deberás conectarlo a la señal de vídeo y el descentrado a masa.

![Conector RCA][i_con_det]

### ¿Algún problema?
Si la señal de vídeo no aparece en la pantalla, puede bajarse el valor de la resistencia de 470O a 330O o menor.

Si de repente deja de verse, puede que necesites otra resistencia menor todavía, ya que cuanto más caliente esté el chip del Arduino, menor deberá ser la resistencia.

Si ni aún bajando el valor de la resistencia no consigues ver la señal de vídeo, puede que sea por culpa de que la señal que genera el Arduino no sea lo suficientemente buena y limpia como para que el dispositivo la acepte.

Puede que esta información esté desactualizada, puede que soluciones tu problema en la página de la [librería][l_tvout].

[l_tvout]: http://code.google.com/p/arduino-tvout/
[l_beta1]: http://code.google.com/p/arduino-tvout/downloads/detail?name=TVoutBeta1.zip&can=2&q=
[i_esq_vid]: http://farm5.static.flickr.com/4087/5225072558_5f5f760037.jpg "Esquema conexión"
[i_con_det]: https://raw.github.com/chiva/Quiz-o-matic/media/IMGP9169.png

## Resultado final

Foto realizada durante el desarrollo del proyecto a lo largo de la Campus Party 2011 en Valencia

![Montaje](https://raw.github.com/chiva/Quiz-o-matic/media/DSC_3927.jpg)

# ToDo

- Añadir sonido al acertar o fallar la pregunta
- Almacenar las preguntas en la flash o tarjeta SD
- Poder seleccionar los pines para los pulsadores