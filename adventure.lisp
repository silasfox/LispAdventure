#!/usr/bin/clisp

;;;; A simple text adventure

(setq *print-case* :capitalize)

;;; An introductory message to the player

(defvar *intro*
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ Eine kurze Einführung						+
+ Es gibt folgende Befehle:					+
+ Norden (geht einen Raum nach Norden)				+
+ Sueden (geht einen Raum nach Süden)				+
+ Osten (du verstehst...)					+
+ Westen							+
+ Hoch								+
+ Runter							+
+ I (öffnet dein Inventar)					+
+ Schau (zeigt den Raum noch einmal)				+
+ Schluss (verlässt das Spiel)					+
+ Hilfe (druckt diesen Text noch einmal ab)			+
+---------------------------------------------------------------+
+ Groß- und Kleinschreibung ist egal, Umlaute müssen immer mit	+
+ zwei Buchstaben geschrieben werden, d.h. ä ist ae etc.	+
+---------------------------------------------------------------+
+ Viel Spaß!							+
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")

;;; Defining objects as variables

(defvar *0* (list "Nichts"))
(defvar *1* (list "Pfanne"))
(defvar *2* (list "Küchenmesser"))
(defvar *3* (list "Wasserflasche"))
(defvar *4* (list "Verschimmeltes Butterbrot"))
(defvar *5* (list "Schere"))
(defvar *6* (list "Weinglas"))
(defvar *7* (list "Gitarre"))
(defvar *8* (list "X-Box Controller"))

;;; Making a list per room containing this rooms objects

(defvar *aobjects* (list *0*))
(defvar *bobjects* (list *1* *2* *3* *4*))
(defvar *cobjects* (list *5* *6*))
(defvar *dobjects* (list *7* *8*))
(defvar *fobjects* (list *0*))
(defvar *gobjects* (list *0*))
(defvar *iobjects* (list *0*))
(defvar *kobjects* (list *0*))
(defvar *lobjects* (list *0*))
(defvar *mobjects* (list *0*))
(defvar *nobjects* (list *0*))
(defvar *oobjects* (list *0*))
(defvar *pobjects* (list *0*))
(defvar *qobjects* (list *0*))

;;; Describing the rooms of the game and the objects in them

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

;;; Defining rooms as numbers

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

;;; Lists for each room

(defvar alist (list *a* *averb* *aobjects*))
(defvar blist (list *b* *bverb* *bobjects*))
(defvar clist (list *c* *cverb* *cobjects*))
(defvar dlist (list *d* *dverb* *dobjects*))
(defvar flist (list *f* *fverb* *fobjects*))
(defvar glist (list *g* *gverb* *gobjects*))
(defvar ilist (list *i* *iverb* *iobjects*))
(defvar klist (list *k* *kverb* *kobjects*))
(defvar llist (list *l* *lverb* *lobjects*))
(defvar mlist (list *m* *mverb* *mobjects*))
(defvar nlist (list *n* *nverb* *nobjects*))
(defvar olist (list *o* *overb* *oobjects*))
(defvar plist (list *p* *pverb* *pobjects*))
(defvar qlist (list *q* *qverb* *qobjects*))

;;; Inventory

(defvar *invent* (list "Taschenbibel"))

;;; Your position

(defvar *stand* *a*)

;;; Your position with a list of everything in it

(defvar *standlist* alist)

;;; A function to keep standlist up to date with stand

(defun update (*stand*)
  (cond ((eq *stand* *a*)
	 (setf *standlist* alist))
	((eq *stand* *b*)
	 (setf *standlist* blist))
	((eq *stand* *c*)
	 (setf *standlist* clist))
	((eq *stand* *d*)
	 (setf *standlist* dlist))
	((eq *stand* *e*)
	 (setf *standlist* elist))
	((eq *stand* *f*)
	 (setf *standlist* flist))
	((eq *stand* *g*)
	 (setf *standlist* glist))
	((eq *stand* *h*)
	 (setf *standlist* hlist))
	((eq *stand* *i*)
	 (setf *standlist* ilist))
	((eq *stand* *j*)
	 (setf *standlist* jlist))
	((eq *stand* *k*)
	 (setf *standlist* klist))
	((eq *stand* *l*)
	 (setf *standlist* llist))
	((eq *stand* *m*)
	 (setf *standlist* mlist))
	((eq *stand* *n*)
	 (setf *standlist* nlist))
	((eq *stand* *o*)
	 (setf *standlist* olist))
	((eq *stand* *p*)
	 (setf *standlist* plist))
	((eq *stand* *q*)
	 (setf *standlist* qlist))))

#||
This function compares your position to the numbered rooms,  prints the corresponding verbose description of the room, 
and appends a list of the objects in the room and a "Was willst du tun?", i.e. "What do you want to do?"
||#

(defun ort (*x*)
  (update *stand*)
  (format t "~a~%" (cadr *standlist*))
  (format t "Du siehst: ~a~%" (caddr *standlist*))
  (format t "Was willst du tun?~%"))

;;; A function to take something and put it into your inventory

(defvar *y* 1)

(defun nimm (*y*)
  (setf *y* (read))
  (cond ((eq *y* '1)
	 (setf *invent* (append *invent* (car (caddr *standlist*)))))
	((eq *y* '2)
	 (setf *invent* (append *invent* (cadr (caddr *standlist*)))))
	((eq *y* '3)
	 (setf *invent* (append *invent* (caddr (caddr *standlist*)))))
	((eq *y* '4)
	 (setf *invent* (append *invent* (cadddr (caddr *standlist*)))))))

;;; The game begins

(format t "~a~%~%~%" *intro*)

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
    ((eq *x* 'nimm)
     (nimm *y*))
    ((eq *x* 'schluss)
     (quit))
    ((eq *x* 'hilfe)
     (format t "~a~%~%~%" *intro*)))
  (setf *x* (read)))
