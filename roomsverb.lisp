;;;; A simple text adventure

(setq *print-case* :capitalize)

;;; Describing the rooms of the game and their walls

(defvar *averb* 
"------------------------------------------------------------------
| Du stehst im Treppenhaus des Hauses.                           | 
|----------------------------------------------------------------|
| Nach Osten geht es in die Küche, nach Westen ins Bad. Du	 |
| kannst die Treppe hoch oder runter gehen, in die anderen       |
| Etagen. Im Norden ist die Haustür.                             |
------------------------------------------------------------------")
(defvar *awalls* (list *sueden*))

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
(defvar *bwalls* (list *norden* *osten* *hoch* *runter*))

(defvar *cverb* 
"------------------------------------------------------------------
| Du stehst im Esszimmer. In der Mitte des Raumes steht ein	 |
| großer Tisch mit einer Eckbank, in den drei anderen Ecken ste- |
| hen ein Klavier, ein Vitrinenschrank mit Geschirr und ein 	 |
| Holzofen.							 |
|----------------------------------------------------------------|
| Nach Westen geht es ins Wohnzimmer, nach Norden in die Küche.  |
------------------------------------------------------------------")
(defvar *cwalls* (list *sueden* *osten* *hoch* *runter*))

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
(defvar *dwalls* (list *sueden* *westen* *norden* *hoch* *runter*))

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
(defvar *fwalls* (list *norden*))

(defvar *gverb* 
"------------------------------------------------------------------
| Das hier ist das Arbeitszimmer der Eltern.			 |
|----------------------------------------------------------------|
| Nach Norden schaut ein Fenster auf die Kreuzung vor dem Haus,  |
| im Süden ist das Schlafzimmer der Eltern. Im Westen geht's	 |
| wieder in den Flur.						 |
------------------------------------------------------------------")
(defvar *gwalls* (list *norden* *osten* *hoch* *runter*))

(defvar *iverb* 
"------------------------------------------------------------------
| Das Schlafzimmer deiner Schwester. Komplettes Chaos.		 |
|----------------------------------------------------------------|
| Richtung Norden kommst du hier wieder raus.			 |
------------------------------------------------------------------")
(defvar *iwalls* (list *osten* *westen* *sueden* *hoch* *runter*))

(defvar *kverb*
"------------------------------------------------------------------
| Der Flur im Keller. Von hier hast du auch einen guten Blick 	 |
| unter die Treppe. Es ist dreckig. Da steht eine Kiste mit al-	 |
| ten Kerzen.							 |
|----------------------------------------------------------------|
| Im Osten ist der erste Kellerraum, im Westen die Waschküche. 	 |
| Richtung Süden geht es weiter den Flur entlang. Nach oben geht |
| es wieder in den Flur.					 |
------------------------------------------------------------------")
(defvar *kwalls* (list *norden* *runter*))

(defvar *lverb* 
"------------------------------------------------------------------
| Der erste Kellerraum. Die Wände sind mit Regalen und Zeug ge-	 |
| säumt. Viel Zeug. Vermutlich findest du hier fast alles, was 	 |
| du dir wünschen kannst. Ein Gefrierschrank ist auch hier.	 |
|----------------------------------------------------------------|
| Nach Westen kommst du wieder raus.				 |
------------------------------------------------------------------")
(defvar *lwalls* (list *norden* *osten* *sueden* *hoch* *runter*))

(defvar *mverb* 
"------------------------------------------------------------------
| Die Waschküche. Eine Waschmaschine, ein Trockner, ein Wasch-	 |
| becken und eine Toilette. Sonst viele Waschmittel. Vielleicht  |
| findest du hier auch etwas Interessantes.			 |
|----------------------------------------------------------------|
| Nach Osten geht's wieder in den Flur.				 |
------------------------------------------------------------------")
(defvar *mwalls* (list *norden* *westen* *sueden* *hoch* *runter*))

(defvar *nverb* 
"------------------------------------------------------------------
| Der zweite Kellerraum. Die Wände sind leer, nicht einmal ge-	 |
| strichen. Hier steht ziemlich viel Gerümpel. Was du in dem 	 |
| anderen Kellerraum nicht findest, ist hier sicherlich da.	 |
|----------------------------------------------------------------|
| Nach Westen geht's wieder raus.				 |
------------------------------------------------------------------")
(defvar *nwalls* (list *norden* *osten* *sueden* *hoch* *runter*))

(defvar *overb* 
"------------------------------------------------------------------
| Die Eintrittsschleuse des Kellers. Ein relativ großer Raum, an |
| der südlichen Wand steht ein großer Schrank.			 |
|----------------------------------------------------------------|
| Nach Norden geht's in den Kellerflur, nach Osten in den zwei-	 |
| ten Kellerraum. Im Westen ist eine Tür auf den Hof.		 |
------------------------------------------------------------------")
(defvar *owalls* (list *sueden* *hoch* *runter*))

(defvar *pverb*
"------------------------------------------------------------------
| Du befindest dich auf dem Hof. Wilde ZAMis starren dich böse   |
| an. Du wünschst dir, nie das Haus verlassen zu haben. Schnell  |
| wieder zurück!						 |
|----------------------------------------------------------------|
| Im Osten erwartet dich die Sicherheit deiner vier Wände.	 |
------------------------------------------------------------------")
(defvar *pwalls* (list *hoch* *runter*))

(defvar *qverb* 
"------------------------------------------------------------------
| Das Zimmer deines Bruders. Ich würde schnell wieder rausgehen, |
| wenn ich du wäre. Es sei denn, du hast Gummibärchen.		 |
|----------------------------------------------------------------|
| Runter ist raus.						 |
------------------------------------------------------------------")
(defvar *qwalls* (list *norden* *sueden* *osten* *westen* *hoch*))

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

;;; Lists for each room, containing the room's number, verbose description, objects and walls in this order

(defvar alist (list *a* *averb* *aobjects* *awalls*))
(defvar blist (list *b* *bverb* *bobjects* *bwalls*))
(defvar clist (list *c* *cverb* *cobjects* *cwalls*))
(defvar dlist (list *d* *dverb* *dobjects* *dwalls*))
(defvar flist (list *f* *fverb* *fobjects* *fwalls*))
(defvar glist (list *g* *gverb* *gobjects* *gwalls*))
(defvar ilist (list *i* *iverb* *iobjects* *iwalls*))
(defvar klist (list *k* *kverb* *kobjects* *kwalls*))
(defvar llist (list *l* *lverb* *lobjects* *lwalls*))
(defvar mlist (list *m* *mverb* *mobjects* *mwalls*))
(defvar nlist (list *n* *nverb* *nobjects* *nwalls*))
(defvar olist (list *o* *overb* *oobjects* *owalls*))
(defvar plist (list *p* *pverb* *pobjects* *pwalls*))
(defvar qlist (list *q* *qverb* *qobjects* *qwalls*))
