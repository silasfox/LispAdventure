#!/usr/bin/clisp

;;;; A simple text adventure

(setq *print-case* :capitalize)

;;; Defining objects as variables

(defvar *1* "Pfanne")
(defvar *2* "Küchenmesser")
(defvar *3* "Wasserflasche")
(defvar *4* "Verschimmeltes Butterbrot")

;;; Describing the rooms of the game

(defvar *averb* 
"------------------------------------------------------------------
| Du stehst im Treppenhaus des Hauses.                           | 
|----------------------------------------------------------------|
| Nach Osten geht es in die Küche, nach Westen ins Bad. Du	 |
| kannst die Treppe hoch oder runter gehen, in die anderen       |
| Etagen. Im Norden ist die Haustür.                             |
------------------------------------------------------------------")

(defvar *bverb* 
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

(defvar *cverb* 
"------------------------------------------------------------------
| Du stehst im Esszimmer. In der Mitte des Raumes steht ein	 |
| großer Tisch mit einer Eckbank, in den drei anderen Ecken ste- |
| hen ein Klavier, ein Vitrinenschrank mit Geschirr und ein 	 |
| Holzofen.							 |
|----------------------------------------------------------------|
| Nach Westen geht es ins Wohnzimmer, nach Norden in die Küche.  |
------------------------------------------------------------------")

(defvar *dverb* 
"------------------------------------------------------------------
| Das ist das Wohnzimmer. Die eine Wand nimmt ein Schrank ein,   |
| in dem unter anderem ein Flachbildfernseher und eine X-Box 	 |
| steht, die andere Seite des Raumes füllt das große Sofa. Über  |
| dem Durchgang ins Esszimmer ist ein Bücherregal. Ein Fenster   |
| ermöglicht den Blick auf den Hof und das Dach der Gästewohnung.|
|----------------------------------------------------------------|
| Nach Osten geht es ins Esszimmer.				 |
------------------------------------------------------------------")

(defvar *fverb* 
"------------------------------------------------------------------
| Du stehst im oberen Treppenhaus. 				 |
|----------------------------------------------------------------|
| Nach Norden schaut ein Fenster auf die Kreuzung vor dem Haus,  |
| nach Osten geht es ins Arbeitszimmer der Eltern. Im Westen  	 |
| ist ein weiteres Badezimmer, im Süden wohnt deine Schwester.	 |
| Nach oben geht es zum kleinen Bruder, nach unten kommst du in  |
| den Flur.							 |
------------------------------------------------------------------")

(defvar *gverb* 
"------------------------------------------------------------------
| Das hier ist das Arbeitszimmer der Eltern.			 |
|----------------------------------------------------------------|
| Nach Norden schaut ein Fenster auf die Kreuzung vor dem Haus,  |
| im Süden ist das Schlafzimmer der Eltern. Im Westen geht's	 |
| wieder in den Flur.						 |
------------------------------------------------------------------")

(defvar *iverb* 
"------------------------------------------------------------------
| Das Schlafzimmer deiner Schwester. Komplettes Chaos.		 |
|----------------------------------------------------------------|
| Richtung Norden kommst du hier wieder raus.			 |
------------------------------------------------------------------")

(defvar *kverb*
"------------------------------------------------------------------
| Der Flur im Keller. Von hier hast du auch einen guten Blick 	 |
| unter die Treppe. Es ist dreckig. Da steht eine Kiste mit al-	 |
| ten Kerzen.							 |
|----------------------------------------------------------------|
| Im Osten ist der erste Kellerraum, im Westen die Waschküche. 	 |
| Richtung Süden geht es weiter den Flur entlang.		 |
------------------------------------------------------------------")

(defvar *lverb* 
"------------------------------------------------------------------
| Der erste Kellerraum. Die Wände sind mit Regalen und Zeug ge-	 |
| säumt. Viel Zeug. Vermutlich findest du hier fast alles, was 	 |
| du dir wünschen kannst. Ein Gefrierschrank ist auch hier.	 |
|----------------------------------------------------------------|
| Nach Westen kommst du wieder raus.				 |
------------------------------------------------------------------")

(defvar *mverb* 
"------------------------------------------------------------------
| Die Waschküche. Eine Waschmaschine, ein Trockner, ein Wasch-	 |
| becken und eine Toilette. Sonst viele Waschmittel. Vielleicht  |
| findest du hier auch etwas Interessantes.			 |
|----------------------------------------------------------------|
| Nach Osten geht's wieder in den Flur.				 |
------------------------------------------------------------------")

(defvar *nverb* 
"------------------------------------------------------------------
| Der zweite Kellerraum. Die Wände sind leer, nicht einmal ge-	 |
| strichen. Hier steht ziemlich viel Gerümpel. Was du in dem 	 |
| anderen Kellerraum nicht findest, ist hier sicherlich da.	 |
|----------------------------------------------------------------|
| Nach Westen geht's wieder raus.				 |
------------------------------------------------------------------")

(defvar *overb* 
"------------------------------------------------------------------
| Die Eintrittsschleuse des Kellers. Ein relativ großer Raum, an |
| der südlichen Wand steht ein großer Schrank.			 |
|----------------------------------------------------------------|
| Nach Norden geht's in den Kellerflur, nach Osten in den zwei-	 |
| ten Kellerraum. Im Westen ist eine Tür auf den Hof.		 |
------------------------------------------------------------------")

(defvar *pverb*
"------------------------------------------------------------------
| Du befindest dich auf dem Hof. Wilde ZAMis starren dich böse   |
| an. Du wünschst dir, nie das Haus verlassen zu haben. Schnell  |
| wieder zurück!						 |
|----------------------------------------------------------------|
| Im Osten erwartet dich die Sicherheit deiner vier Wände.	 |
------------------------------------------------------------------")

(defvar *qverb* 
"------------------------------------------------------------------
| Das Zimmer deines Bruders. Ich würde schnell wieder rausgehen, |
| wenn ich du wäre. Es sei denn, du hast Gummibärchen.		 |
|----------------------------------------------------------------|
| Runter ist raus.						 |
------------------------------------------------------------------")

;;;Defining rooms as numbers

(defvar *a* 0)
(defvar *b* -133)
(defvar *c* -1134)
(defvar *d* -1001)
(defvar *e* 133)
(defvar *f* 2)
(defvar *g* -131)
(defvar *h* -1132)
(defvar *i* -999)
(defvar *j* 135)
(defvar *k* -2)
(defvar *l* -135)
(defvar *m* 131)
(defvar *n* -1136)
(defvar *o* -1003)
(defvar *p* -870)
(defvar *q* 4)

;;; Inventory

(defvar *invent* (list "Taschenbibel"))

;;; Your position

(defvar *stand* *a*)

#||
;;; Defining movement as mathematical functions

(defun westen (*stand*) (setq *stand* (+ *stand* 133)))
(defun osten (*stand*) (defvar *stand* (- *stand* 133)))
(defun norden (*stand*) (setf *stand* (+ *stand* 1001)))
(defun sueden (*stand*) (setf *stand* (- *stand* 1001)))
(defun hoch (*stand*) (setf *stand* (+ *stand* 2)))
(defun runter (*stand*) (setf *stand* (- *stand* 2)))
||#

;;; This function prints your position and appends a "Was willst du tun?", i.e. "What do you want to do?"

(defun ort (*stand*)
  (cond 
    ((eq *stand* *a*)
     (format t "~a~%" *averb*))
    ((eq *stand* *b*)
     (format t "~a~%" *bverb*)
     (format t "Du siehst: ~a~%" *bobjects*))
    ((eq *stand* *c*)
     (format t "~a~%" *cverb*))
    ((eq *stand* *d*)
     (format t "~a~%" *dverb*))
    ((eq *stand* *e*)
     (format t 
"------------------------------------------------------------------
| Das Bad. Musst du mal? Nein? Dann raus hier.			 |
------------------------------------------------------------------~%"))
    ((eq *stand* *f*)
     (format t "~a~%" *fverb*))
    ((eq *stand* *g*)
     (format t "~a~%" *gverb*))
    ((eq *stand* *h*)
     (format t "~a~%" *hverb*))
    ((eq *stand* *i*)
     (format t "~a~%" *iverb*))
    ((eq *stand* *j*)
     (format t 
"------------------------------------------------------------------
| Du bist ganz gut im bäderfinden. Aber auch hier hast du nichts |
| zu suchen.							 |
------------------------------------------------------------------~%"))
    ((eq *stand* *k*)
     (format t "~a~%" *kverb*))
    ((eq *stand* *l*)
     (format t "~a~%" *lverb*))
    ((eq *stand* *m*)
     (format t "~a~%" *mverb*))
    ((eq *stand* *n*)
     (format t "~a~%" *nverb*))
    ((eq *stand* *o*)
     (format t "~a~%" *overb*))
    ((eq *stand* *p*)
     (format t "~a~%" *pverb*))
    ((eq *stand* *q*)
     (format t "~a~%" *qverb*)))
  (format t "Was willst du tun?~%" *stand*))

(ort *stand*)

;;; A variable that takes the player's input

(setq *x* (read))

(loop
  (cond
    ((eq *x* 'westen)
     (setf *stand* (+ *stand* 133))
     (ort *stand*))
    ((eq *x* 'osten)
     (setf *stand* (- *stand* 133))
     (ort *stand*))
    ((eq *x* 'norden)
     (setf *stand* (+ *stand* 1001))
     (ort *stand*))
    ((eq *x* 'sueden)
     (setf *stand* (- *stand* 1001))
     (ort *stand*))
    ((eq *x* 'hoch)
     (setf *stand* (+ *stand* 2))
     (ort *stand*))
    ((eq *x* 'runter)
     (setf *stand* (- *stand* 2))
     (ort *stand*))
    ((eq *x* 'schau)
     (ort *stand*))
    ((eq *x* 'i)
     (format t "~a~%Was willst du tun?~%" *invent*))
    ((eq *x* 'schluss)
     (quit)))
  (setf *x* (read)))
