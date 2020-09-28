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
+ Nimm + Zahl (fügt etwas deinem Inventar hinzu)		+
+ Schau (zeigt den Raum noch einmal)				+
+ Homer + Ilias/Odyssee (Druckt das Proöm des jeweiligen Werks)	+
+ Schluss (verlässt das Spiel)					+
+ Hilfe (druckt diesen Text noch einmal ab)			+
+---------------------------------------------------------------+
+ Groß- und Kleinschreibung ist egal, Umlaute müssen immer mit	+
+ zwei Buchstaben geschrieben werden, d.h. ä ist ae etc.	+
+---------------------------------------------------------------+
+ Viel Spaß!							+
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
