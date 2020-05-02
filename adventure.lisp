#!/usr/bin/clisp

(setq *print-case* :capitalize)

;;; Defining objects

(defvar *1* "Pfanne")
(defvar *2* "Küchenmesser")
(defvar *3* "Wasserflasche")
(defvar *4* "Verschimmeltes Butterbrot")

;;; Defining the rooms of the game: every room is a variable

(defvar *a* 
"------------------------------------------------------------------
| Du stehst im Treppenhaus des Hauses.                           | 
|----------------------------------------------------------------|
| Nach Osten geht es in die Küche, nach Westen ins Bad. Du	 |
| kannst die Treppe hoch oder runter gehen, in die anderen       |
| Etagen. Im Norden ist die Haustür.                             |
------------------------------------------------------------------")

(defvar *b* 
"------------------------------------------------------------------
| Du stehst in der Küche. An der einen Wand ist die Küchenzeile  |
| mit Herd, Spüle und einigen Schränken. In der Mitte des Raumes |
| steht ein Esstisch mit sechs Stühlen. Neben der Tür in den     |
| Flur ist der Kühlschrank. Aus dem Fenster hat man eine hervor- |
| ragende Sicht auf die Straße, man kann alle Passanten sehen.   |
| Leider funktioniert das auch andersherum.                      |
|----------------------------------------------------------------|
| Nach Süden geht es ins Esszimmer, nach Westen in den Flur.     |
------------------------------------------------------------------")
(defvar *bobjects* (list *1* *2* *3* *4*))

(defvar *c* 
"------------------------------------------------------------------
| Du stehst im Esszimmer. In der Mitte des Raumes steht ein	 |
| großer Tisch mit einer Eckbank, in den drei anderen Ecken ste- |
| hen ein Klavier, ein Vitrinenschrank mit Geschirr und ein 	 |
| Holzofen.							 |
|----------------------------------------------------------------|
| Nach Westen geht es ins Wohnzimmer, nach Norden in die Küche.  |
------------------------------------------------------------------")

(defvar *d* 
"------------------------------------------------------------------
| Das ist das Wohnzimmer. Die eine Wand nimmt ein Schrank ein,   |
| in dem unter anderem ein Flachbildfernseher und eine X-Box 	 |
| steht, die andere Seite des Raumes füllt das große Sofa. Über  |
| dem Durchgang ins Esszimmer ist ein Bücherregal. Ein Fenster   |
| ermöglicht den Blick auf den Hof und das Dach der Gästewohnung.|
|----------------------------------------------------------------|
| Nach Osten geht es ins Esszimmer.				 |
------------------------------------------------------------------")

(defvar *f* 
"------------------------------------------------------------------
| Du stehst im oberen Treppenhaus. 				 |
|----------------------------------------------------------------|
| Nach Norden schaut ein Fenster auf die Kreuzung vor dem Haus,  |
| nach Osten geht es in Ottis und Naomis Arbeitszimmer. Im  	 |
| Westen ist ein weiteres Badezimmer, im Süden schläft Prisca.   |
| Nach oben geht es zu Joel, nach unten kommst du in den Flur.   |
------------------------------------------------------------------")

(defvar *g* 
"------------------------------------------------------------------
| Das hier ist das Arbeitszimmer der Eltern.			 |
|----------------------------------------------------------------|
| Nach Norden schaut ein Fenster auf die Kreuzung vor dem Haus,  |
| im Süden ist das Schlafzimmer der Eltern. Im Westen geht's	 |
| wieder in den Flur.						 |
------------------------------------------------------------------")

(defvar *i* 
"------------------------------------------------------------------
| Prissys Schlafzimmer. Komplettes Chaos.			 |
|----------------------------------------------------------------|
| Richtung Norden kommst du hier wieder raus.			 |
------------------------------------------------------------------")

(defvar *k*
"------------------------------------------------------------------
| Der Flur im Keller. Von hier hast du auch einen guten Blick 	 |
| unter die Treppe. Es ist dreckig. Da steht eine Kiste mit al-	 |
| ten Kerzen.							 |
|----------------------------------------------------------------|
| Im Osten ist der erste Kellerraum, im Westen die Waschküche. 	 |
| Richtung Süden geht es weiter den Flur entlang.		 |
------------------------------------------------------------------")

(defvar *l* 
"------------------------------------------------------------------
| Der erste Kellerraum. Die Wände sind mit Regalen und Zeug ge-	 |
| säumt. Viel Zeug. Vermutlich findest du hier fast alles, was 	 |
| du dir wünschen kannst. Ein Gefrierschrank ist auch hier.	 |
|----------------------------------------------------------------|
| Nach Westen kommst du wieder raus.				 |
------------------------------------------------------------------")

(defvar *m* 
"------------------------------------------------------------------
| Die Waschküche. Eine Waschmaschine, ein Trockner, ein Wasch-	 |
| becken und eine Toilette. Sonst viele Waschmittel. Vielleicht  |
| findest du hier auch etwas Interessantes.			 |
|----------------------------------------------------------------|
| Nach Osten geht's wieder in den Flur.				 |
------------------------------------------------------------------")

(defvar *n* 
"------------------------------------------------------------------
| Der zweite Kellerraum. Die Wände sind leer, nicht einmal ge-	 |
| strichen. Hier steht ziemlich viel Gerümpel. Was du in dem 	 |
| anderen Kellerraum nicht findest, ist hier sicherlich da.	 |
|----------------------------------------------------------------|
| Nach Westen geht's wieder raus.				 |
------------------------------------------------------------------")

(defvar *o* 
"------------------------------------------------------------------
| Die Eintrittsschleuse des Kellers. Ein relativ großer Raum, an |
| der südlichen Wand steht ein großer Schrank.			 |
|----------------------------------------------------------------|
| Nach Norden geht's in den Kellerflur, nach Osten in den zwei-	 |
| ten Kellerraum. Im Westen ist eine Tür auf den Hof.		 |
------------------------------------------------------------------")

(defvar *p*
"------------------------------------------------------------------
| Du befindest dich auf dem Hof. Wilde ZAMis starren dich böse   |
| an. Du wünschst dir, nie das Haus verlassen zu haben. Schnell  |
| wieder zurück!						 |
|----------------------------------------------------------------|
| Im Osten erwartet dich die Sicherheit deiner vier Wände.	 |
------------------------------------------------------------------")

(defvar *q* 
"------------------------------------------------------------------
| Joels Zimmer. Ich würde schnell wieder rausgehen, wenn ich du  |
| wäre. Es sei denn, du hast Gummibärchen.			 |
|----------------------------------------------------------------|
| Runter ist raus.						 |
------------------------------------------------------------------")

;;; Inventory

(defvar *invent* (list "Taschenbibel"))

(defvar *stand* *a*)

(defun ort (*stand*)
  (format t "~a~%Was willst du tun?~%" *stand*))

(ort *stand*)

(defvar *x* (read))

(loop (cond ((eq *stand* *a*)
	 (cond ((eq *x* 'Norden)
		(setf *stand* "Du bist ausgeschlossen. Toll hast du das gemacht.")
		(ort *stand*))
	       ((eq *x* 'Sueden)
		(format t "Da ist 'ne Wand, du Hornochse!~%")
		(setf *x* (read)))
	       ((eq *x* 'Westen)
		(format t "Das Bad. Musst du mal? Sonst raus hier.~%")
		(setf *x* (read)))
	       ((eq *x* 'Osten)
		(setf *stand* *b*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'hoch)
		(setf *stand* *f*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'runter)
		(setf *stand* *k*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'I)
		(format t "~a~%" *invent*)
		(setf *x* (read)))
	       (t (format t "Dafür hast du nicht die notwendige Berechtigung.~%")
		  (setf *x* (read)))))
	((eq *stand* *b*)
	 (cond ((eq *x* 'Norden)
		(format t "Toll, jetzt hast du dir die Hand an der Herdplatte verbrannt! Mach das nicht nochmal!~%")
		(setf *x* (read)))
	       ((eq *x* 'Sueden)
		(setf *stand* *c*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'Westen)
		(setf *stand* *a*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'Osten)
		(format t "Nein, du kannst nicht aus dem Fenster springen!~%")
		(setf *x* (read)))
	       ((eq *x* 'Schau)
		(format t "Du siehst: ~a~%"*bobjects*)
		(setf *x* (read)))
	       ((eq *x* 'I)
		(format t "~a~%" *invent*)
		(setf *x* (read)))
	       (t (format t "Dafür hast du nicht die notwendige Berechtigung.~%")
		  (setf *x* (read)))))
	((eq *stand* *c*)
	 (cond ((eq *x* 'Norden)
		(setf *stand* *b*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'Sueden)
		(format t "Da ist 'ne Wand, du Hornochse!~%")
		(setf *x* (read)))
	       ((eq *x* 'Osten)
		(format t "Nein, du kannst nicht aus dem Fenster springen!~%")
		(setf *x* (read)))
	       ((eq *x* 'Westen)
		(setf *stand* *d*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'I)
		(format t "~a~%" *invent*)
		(setf *x* (read)))
	       (t (format t "Dafür hast du nicht die notwendige Berechtigung.~%")
		  (setf *x* (read)))))
	((eq *stand* *d*)
	 (cond ((eq *x* 'Norden)
		(format t "Da ist 'ne Wand, du Hornochse!~%")
		(setf *x* (read)))
	       ((eq *x* 'Sueden)
		(format t "Da ist 'ne Wand, du Hornochse!~%")
		(setf *x* (read)))
	       ((eq *x* 'Osten)
		(setf *stand* *c*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'Westen)
		(format t "Nein, du kannst nicht aus dem Fenster springen!~%")
		(setf *x* (read)))
	       ((eq *x* 'I)
		(format t "~a~%" *invent*)
		(setf *x* (read)))
	       (t (format t "Dafür hast du nicht die notwendige Berechtigung.~%")
		  (setf *x* (read)))))
	((eq *stand* *f*)
	 (cond ((eq *x* 'Norden)
		(format t "Nein, du kannst nicht aus dem Fenster springen!~%")
		(setf *x* (read)))
	       ((eq *x* 'Sueden)
		(setf *stand* *i*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'Westen)
		(format t "Das Bad. Musst du mal? Sonst raus hier.~%")
		(setf *x* (read)))
	       ((eq *x* 'Osten)
		(setf *stand* *g*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'hoch)
		(setf *stand* *q*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'runter)
		(setf *stand* *a*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'I)
		(format t "~a~%" *invent*)
		(setf *x* (read)))
	       (t (format t "Dafür hast du nicht die notwendige Berechtigung.~%")
		  (setf *x* (read)))))
	((eq *stand* *g*)
	 (cond ((eq *x* 'Norden)
		(format t "Hör endlich auf, aus allen Fenstern springen zu wollen!~%")
		(setf *x* (read)))
	       ((eq *x* 'Sueden)
		(format t "Hier hast du nichts zu suchen. Raus hier!~%")
		(setf *x* (read)))
	       ((eq *x* 'Westen)
		(setf *stand* *f*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'Osten)
		(format t "Hab ich gesagt, daß du da durchgehen kannst? Nein.~%")
		(setf *x* (read)))
	       ((eq *x* 'I)
		(format t "~a~%" *invent*)
		(setf *x* (read)))
	       (t (format t "Dafür hast du nicht die notwendige Berechtigung.~%")
		  (setf *x* (read)))))
	((eq *stand* *i*)
	 (cond ((eq *x* 'Norden)
		(setf *stand* *f*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'Sueden)
		(format t "Hier ist kein Durchkommen. Gib auf.~%")
		(setf *x* (read)))
	       ((eq *x* 'Westen)
		(format t "Hier ist kein Durchkommen. Gib auf.~%")
		(setf *x* (read)))
	       ((eq *x* 'Osten)
		(format t "Hier ist kein Durchkommen. Gib auf.~%")
		(setf *x* (read)))
	       ((eq *x* 'I)
		(format t "~a~%" *invent*)
		(setf *x* (read)))
	       (t (format t "Dafür hast du nicht die notwendige Berechtigung.~%")
		  (setf *x* (read)))))
	((eq *stand* *k*)
	 (cond ((eq *x* 'Norden)
		(format t "Da ist 'ne Wand. Geh woanders lang.~%")
		(setf *x* (read)))
	       ((eq *x* 'Sueden)
		(setf *stand* *o*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'Westen)
		(setf *stand* *m*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'Osten)
		(setf *stand* *l*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'Hoch)
		(setf *stand* *a*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'I)
		(format t "~a~%" *invent*)
		(setf *x* (read)))
	       (t (format t "Dafür hast du nicht die notwendige Berechtigung.~%")
		  (setf *x* (read)))))
	((eq *stand* *l*)
	 (cond ((eq *x* 'Norden)
		(format t "Da ist 'ne Wand. Geh woanders lang.~%")
		(setf *x* (read)))
	       ((eq *x* 'Sueden)
		(format t "Da ist 'ne Wand. Geh woanders lang.~%")
		(setf *x* (read)))
	       ((eq *x* 'Westen)
		(setf *stand* *k*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'Osten)
		(format t "Da ist 'ne Wand. Geh woanders lang.~%")
		(setf *x* (read)))
	       ((eq *x* 'I)
		(format t "~a~%" *invent*)
		(setf *x* (read)))
	       (t (format t "Dafür hast du nicht die notwendige Berechtigung.~%")
		  (setf *x* (read)))))
	((eq *stand* *m*)
	 (cond ((eq *x* 'Norden)
		(format t "Da ist 'ne Wand. Geh woanders lang.~%")
		(setf *x* (read)))
	       ((eq *x* 'Sueden)
		(format t "Da ist 'ne Wand. Geh woanders lang.~%")
		(setf *x* (read)))
	       ((eq *x* 'Westen)
		(format t "Da ist 'ne Wand. Geh woanders lang.~%")
		(setf *x* (read)))
	       ((eq *x* 'Osten)
		(setf *stand* *k*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'I)
		(format t "~a~%" *invent*)
		(setf *x* (read)))
	       (t (format t "Dafür hast du nicht die notwendige Berechtigung.~%")
		  (setf *x* (read)))))
	((eq *stand* *n*)
	 (cond ((eq *x* 'Norden)
		(format t "Da ist 'ne Wand. Geh woanders lang.~%")
		(setf *x* (read)))
	       ((eq *x* 'Sueden)
		(format t "Da ist 'ne Wand. Geh woanders lang.~%")
		(setf *x* (read)))
	       ((eq *x* 'Westen)
		(setf *stand* *o*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'Osten)
		(format t "Da ist 'ne Wand. Geh woanders lang.~%")
		(setf *x* (read)))
	       ((eq *x* 'I)
		(format t "~a~%" *invent*)
		(setf *x* (read)))
	       (t (format t "Dafür hast du nicht die notwendige Berechtigung.~%")
		  (setf *x* (read)))))
	((eq *stand* *o*)
	 (cond ((eq *x* 'Norden)
		(setf *stand* *k*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'Sueden)
		(format t "Da ist 'ne Wand. Geh woanders lang.~%")
		(setf *x* (read)))
	       ((eq *x* 'Westen)
		(setf *stand* *p*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'Osten)
		(setf *stand* *n*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'I)
		(format t "~a~%" *invent*)
		(setf *x* (read)))
	       (t (format t "Dafür hast du nicht die notwendige Berechtigung.~%")
		  (setf *x* (read)))))
	((eq *stand* *p*)
	 (cond ((eq *x* 'Osten)
		(setf *stand* *o*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'I)
		(format t "~a~%" *invent*)
		(setf *x* (read)))
	       (t (format t "Dafür hast du nicht die notwendige Berechtigung.~%")
		  (setf *x* (read)))))
	((eq *stand* *q*)
	 (cond ((eq *x* 'Runter)
		(setf *stand* *f*)
		(ort *stand*)
		(setf *x* (read)))
	       ((eq *x* 'I)
		(format t "~a~%" *invent*)
		(setf *x* (read)))
	       (t (format t "Dafür hast du nicht die notwendige Berechtigung.~%")
		  (setf *x* (read)))))))
