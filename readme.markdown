Quiz-O-Matic es un juego de velocidad y cultura del tipo pregunta y respuesta.

Emplea la placa Arduino y la librer�a TVOut que saca una se�al PAL o NTSC hacia un dispositivo que permita este tipo de se�al de v�deo como entrada. Puede ser una pantalla CRT o LCD con entrada de v�deo o tambi�n un proyector con entrada de v�deo.

Actualmente el juego est� preparado para 4 jugadores.

## Funcionamiento

**Nota:** Esta versi�n del juego s�lo posee una �nica pregunta de prueba, aunque est� planeado el meter una peque�a cantidad de ellas.

1. Se extrae una pregunta de la base de datos
2. Muestra la pregunta a trav�s del dispositivo de salida de v�deo conectado al Arduino
3. En este momento espera la pulsaci�n del jugador m�s r�pido que accione el bot�n
4. �ste contestar� a viva voz la respuesta a la pregunta realizada
5. Una vez contestada, el jugador que gan� el turno deber� accionar de nuevo su pulsador y as� el juego mostrar� la respuesta correcta
6. Si la respuesta ha sido correcta uno de los otros tres jugadores deber� accionar su pulsador para dar la respuesta como correcta
7. En caso contrario el jugador que ha fallado deber� accionar su pulsador para dar la respuesta como incorrecta
8. El juego incrementar� en un punto la puntuaci�n del jugador que ha contestado si lo hizo correctamente
9. El juego comenzar� otra vez el ciclo de pregunta

Si quieres ver el desarrollo de una ronda con im�genes, est� disponible en [[Ronda]].

## Montaje

El montaje del hardware es bastante sencillo ya que el n�mero de componentes es bastante reducido y se ha intentado simplificar �ste todo lo posible.

Probablemente lo m�s complicado sea conectar el Arduino al cable RCA si no se tiene un conector hembra con los cables accesibles. El conector RCA es representado en el esquem�tico con una clema en la esquina inferior derecha.

![Esquema de montaje][i_esq_mont]

> Si quieres el esquem�tico de este proyecto, lo tenemos disponible para su [descarga][l_esqm]

La raz�n por la que los botones est�n conectados a las entradas anal�gicas es que se pueden utilizar como pines digitales y no son usados por el lector de tarjetas SD que viene en la Shield Ethernet, por lo que en un futuro se podr�a a�adir la lectura de preguntas desde ella sin tener que modificar el montaje.

El montaje finalizado te deber�a quedar algo as� en la VidaReal�:

![Montaje finalizado][i_esq_fin] ![Detalle conector v�deo][i_con_vid]

### Lista de materiales

| **Material**    | **Cantidad**|
| --------------- | -----------:|
| Placa Arduino   | 1           |
| Cable           | 1           |
| Conector RCA    | 1           |
| Botones         | 4           |
| Resistencia 470O| 1           |
| Resistencia 1kO | 1           |

El precio total de los componentes sin contar la placa de Arduino, no alcanza el euro, por lo que es un proyecto bastante econ�mico para las posibilidades que ofrece.

[i_esq_mont]: https://raw.github.com/chiva/Quiz-o-matic/media/quiz_o_matic.png
[i_esq_fin]: https://raw.github.com/chiva/Quiz-o-matic/media/IMGP9168.JPG
[i_con_vid]: https://raw.github.com/chiva/Quiz-o-matic/media/IMGP9166.JPG
[l_esqm]: http://fritzing.org/media/fritzing-repo/projects/q/quiz-o-matic/fritzing/quiz_o_matic.fz

## Conexi�n del v�deo

El juego hace uso de la librer�a [tvout][l_tvout], por lo que deber�s descargarla y a�adirla en la carpeta de librer�as de Arduino. En el momento de la realizaci�n, se us� la versi�n [Beta1][l_beta1].

El juego por defecto saca v�deo seg�n el est�ndar PAL (puede cambiarse el c�digo para obtener NTSC) y el formato de transmisi�n es mediante v�deo compuesto (el que va por el jack RCA), por lo que muchas televisiones tanto de tubo como TFT aceptan esta conexi�n, as� como proyectores, mini-televisores, reproductores de DVD port�til, etc.

La salida de video se obtiene seg�n el siguiente esquem�tico de conexionado:

![Conexi�n v�deo][i_esq_vid]

En la siguiente tabla encontrar�s los pines para las diferentes variantes de la placa que corresponden a los referenciados en el esquem�tico de conexionado.

| ***Arduino*** | **Sync**  | **Video** |
| ------------- | --------- | ---------:|
| **UNO**       | 9         | 7         |
| **Mega**      | 11        | 29        |

Si montas tu propio conector, ten en cuenta que el pin central deber�s conectarlo a la se�al de v�deo y el descentrado a masa.

![Conector RCA][i_con_det]

### �Alg�n problema?
Si la se�al de v�deo no aparece en la pantalla, puede bajarse el valor de la resistencia de 470O a 330O o menor.

Si de repente deja de verse, puede que necesites otra resistencia menor todav�a, ya que cuanto m�s caliente est� el chip del Arduino, menor deber� ser la resistencia.

Si ni a�n bajando el valor de la resistencia no consigues ver la se�al de v�deo, puede que sea por culpa de que la se�al que genera el Arduino no sea lo suficientemente buena y limpia como para que el dispositivo la acepte.

Puede que esta informaci�n est� desactualizada, puede que soluciones tu problema en la p�gina de la [librer�a][l_tvout].

[l_tvout]: http://code.google.com/p/arduino-tvout/
[l_beta1]: http://code.google.com/p/arduino-tvout/downloads/detail?name=TVoutBeta1.zip&can=2&q=
[i_esq_vid]: http://farm5.static.flickr.com/4087/5225072558_5f5f760037.jpg "Esquema conexi�n"
[i_con_det]: https://raw.github.com/chiva/Quiz-o-matic/media/IMGP9169.png

## Resultado final

Foto realizada durante el desarrollo del proyecto a lo largo de la Campus Party 2011 en Valencia

![Montaje](https://raw.github.com/chiva/Quiz-o-matic/media/DSC_3927.jpg)

# ToDo

- A�adir sonido al acertar o fallar la pregunta
- Almacenar las preguntas en la flash o tarjeta SD
- Poder seleccionar los pines para los pulsadores