
# Übersicht Latex Befehle

Die Latex-Klasse basiert auf, bzw. erweitert die scrbook-Klasse. Dementsprechend sind alle Befehle dieser Klasse in Ilaris-Dokumenten ebenfalls verfügbar. In diesem Dokument sollen die Befehle vollständig aufgelistet und erklärt werden. Im template.tex bzw. template.pdf sieht man die meisten der Befehle als Beispiel in Aktion. Da sich viele der Befehle die die Klasse bereitstellt im Englischen mit Befehlen aus Latex oder dessen Paketen streiten müsste und die Klasse
so flexibel bleiben soll wie möglich, sind alle neuen Definitionen in deutsch. An einigen Stellen sind die deutschen Befehle direkte Aliase für ihre englischen originale. Diese zu benutzen kann den Vorteil haben, dass ein Dokument besser kompatibel zu zukünftigen Versionen bleibt, falls diese sich inhaltlich ändern. 
Die im Folgenden aufgelisteten Befehle sind zwar grob in Kategorienunterteilt, ansonsten aber alphabetisch aufgelistet. Sie sind zum schnellen Nachschlagen gedacht. Wenn du eher Beispiele suchst welche Befehle man wie benutzen kann, schau lieber mal ins [Template](https://github.com/Ilaris-Tools/IlarisTex/blob/main/template.tex), dass dem IlarisTex Download beiliegt.

## Allgemein/Struktur

### `\anfang`
`\anfang`, `\hauptteil`, `\schluss` Diese Unterteilung ist optional, hilft aber 
dabei das Seitenlayout automatisch anzupassen und beispielsweise die Nummerierung 
der Seiten erst mit dem Hauptteil zu beginnen. Für einfache kurze Spielhilfen mag dies 
Überflüssig sein. Diese Befehle basieren auf dem Prinzip von 
`\frontmatter`, `\mainmatter` und `\backmatter` aus der scrbook-Klasse.

### `\documentclass`
Der Befehl selbst wird zwar nicht von der Ilaris Klasse gestellt muss aber mit dem 
Parameter `Ilaris` benutzt werden um sie zu laden. Dieser Befehl sollte am Anfang
des Dokuments stehen: `\documentclass{Ilaris}`


- `\spaltenanfang`, `\dreispaltenanfang`, `\spaltenende` können benutzt werden um das Spaltenlayout ein/aus zu schalten. Achtung: Wenn ein Anfang benutzt wird, muss auch spätestens am Ende des Dokuments das Ende angegeben werden. Wer mehr als drei Spalten braucht kann dies mit `\begin{multicols}{5}` und `\end{multicols}` tun. Wobei 5 ein beliebiges Beispiel ist.

- `\kapitel{ÜBERSCHRIFT1}`, `\abschnitt{ÜBERSCHRIFT2}`, `\absatz{ÜBERSCHRIFT3}`, `\skapitel{ÜBERSCHRIFT1}`, `\kapitelihvz{ÜBERSCHRIFT1}{EINTRAGINHALTSVZ}` Erstellt Überschriften der Stufen 1-3. Da Kapitelüberschriften in der Regel, das übliche Zweispaltenlayout unterbrechen, gibt es dafür den `\skapitel`-Befehl, der eine Kurzschreibweise für `\spaltenende\kapitel{KAPITEL}\spaltenanfang` ist. Mit dem `\kapitelihvz` kann im zweiten Argument ein seperater Text angegeben werden, der anstelle der Überschrift im Inhalstverzeichnis auftaucht. Dies kann zB eine Abkürzung sein oder ggf. manuelle Zeilenumbrüche ignorieren.

- `\platz` ist ein Alias für `\vfill` es füllt vertikal den zur Verfügung stehenden Platz auf. Er kann mehrfach verwendet werden um einen Bereich zu gewichten. Alle `\platz`-Befehle auf einer Seite füllen in der Summe immer den gesamten freien Platz. Auf einer ansonsten leeren Seite würde
  `\platz\titel{TITEL}` zum Beispiel dafür sorgen, dass der Titel ganz unten auf der Seite steht. Mit `\platz\titel{TITEL}\platz` stünde er in der Mitte und mit `\platz\titel{TITEL}\platz\platz` wäre unter dem Titel doppelt so viel Platz wie darüber (er stünde also im oberen Drittel).

## Titelseite

- `\titelfarbe{FARBE}`, `\titelschattenfarbe{FARBE}` Eine passende Farbe des Schriftzugs, hängt stark vom Hintergrund ab. Damit die Schrift auch auf kontrastreichen Hintergründen lesbar ist, wurde ein automatsicher Schatten hinzugefügt. Für beides können Farben im HTML-Hexcode, englische Namen der Latex-Farben oder die in der Klasse definierten Farben (siehe Kapitel Farben) verwendet werden. Zum Beispiel `\titelfarbe{braun}`.
- `\titelseite{INHALT}` Generiert die Titelseite des Dokuments aus den vorher gesetzten Einstellungen (vorherige Befehle). Innerhalb des Befehls kann alles angegeben werden, was auf der ersten Seite stehen soll. Üblicherweise schließt das das `\titelbild{}`, den `\titel{}`, die `\autorin{}`, und ggf. das `\fanprodukt`-Logo mit ein. Die einzelnen Elemente sind automatisch Zentriert und können mit beliebig vielen `\platz`-Haltern vertikal angeordnet werden. Auf dem Titelbild wird keine Seitenzahl angezeigt.
- `\titel{TITEL}`, `\titelzwei{ZEILE1}{ZEILE2}`, `\titeldrei{ZEILE1}{ZEILE2}{ZEILE3}` gibt den Titel des Dokuments auf der Titelseite aus. Der Titel wird auch automatisch in die Metadaten der PDF geschrieben. Automatische Umbrüche im Titel vertragen sich leider nicht mit dem Textschatten. Zwei- oder Dreizeilige Titel sollten daher manuell getrennt durch den passenden Befehl (`\titelzwei` oder `\titeldrei`) angegeben werden.
- `\autorin{NAME}`

## Weitere Seiten

- `\inahltsverzeichnis`, `\grobesinhaltsverzeichnis` generiert automatisch ein Inhaltsverzeichnis aus den Kapitel- und Absatzüberschriften im Dokument (siehe Struktur).
- `\neueseite`, `\seitenumbruch` fügt einen manuellen Seitenumbruch ein, egal wieviel Platz auf der Seite noch frei ist.
- `\leereseite` fügt zusätzlich zum manuellen Umbruch eine leere Seite (ohne Inhalt) mit ein. Kann mit `\ohnehintergrund` kombiniert werden um eine weiße Seite zu erzeugen.
- `\ohnehintergrund`

## Farben

Um ein wiederkehrendes Farbschema einzuhalten wurden einige Farben definiert, die so für Schrift- und Rahmenfarben etc, verwendet werden können:

- dunkelrot: #450c15
- dunkelbraun: #39220d
- braun: #6f5843
- hellrot: #450c15
- beige: #e7d1b3
- kampf: #c86400
- profan: #655743
- magie: #425a66
- karma: #8e5d6f

## Kästen

### \probe
`\probe[]{Titel}{Text}`
optionale argumente:

Eigene Bilder benutzen: in `/gfx/proben/<name>.jpg` ablegen.

## Sonstige Befehle

- `\fanprodukt`
- `\linie`
- `\link`
- `\begriff`
- `\geschichte`
