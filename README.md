## IlarisTex
Eine Latex-Klasse zum erstellen von Spielhilfen und Abenteuern für das alternative Ilaris Regelwerk.Dies Projekt ist als Alternative zu Ilaris-Latex entstanden, das zur Zeit nicht weiterentwickelt wird. Es ist noch unvollständig, aber bereits benutzbar. Mithilfe erwünscht.


### Vorschau

![preview.png](preview.png)

Ein richtiges Beispiel: [template.pdf](template.pdf) 


### Features
* Pergament-, Info-, Proben-, Bild- und Kreaturenkästen
* Seitenlayout, Spalten und Hintergrund
* Schriftarten, Überschriften, (Tabellen), Farben
* Einfache hübsche Einbindung von Bildern
* Optionale Plugins für Glossar und Datenbanken
* Latex-Paket für einfache Nutzung/Installation


### Geplant
* Tintensparende Druckversion
* Verbesserte Vorlagen für Handouts
* Mehr Kästen und Layout-Optionen
* Layout der Inhaltsverzeichnisse
* Anleitung und mehr Beispiele
* viele weitere Kleinigkeiten
* Minimalbeispiel zum Starten



## Installation

Es muss eine aktuelle TexLive Version installiert sein, oder das Paket tcolorbox manuell aktualisiert werden, damit teilweise transparente Hintergründe funktionieren. [Infos zum Aktualisieren](https://tex.stackexchange.com/questions/55437/how-do-i-update-my-tex-distribution).

### Latex-Paket für Nutzer

Für die neuste Version der Ilaris Latex-Klasse kann [hier](https://github.com/Ilaris-dev/IlarisTex/releases/tag/v0.0.2) die `texmf.tds.zip` heruntergeladen werden. Ihr inhalt wird in den Benutzerordner der Latex installation (`~/texmf/` unter Linux) entpackt. Falls der Ordner nicht existiert, kann er einfach erstellt werden. In diesem Ordner sollten sich nun mindestens die Unterordner `tex` und `fonts` befinden. Ab jetzt kann überall die Klasse von überall via `\documentclass{Ilaris}` verwendet werden. Siehe `template.tex` als Beispiel.


### Repository für Entwickler

Wer vor hat an dem Projekt mit zu arbeiten, oder mehrere verschiedene Versionen der Klasse verwenden will, kann sie auch in einem lokalen Ordner verwenden. Dazu diese Repository klonen (oder herunterladen und entpacken). 

```
git clone git@github.com:Ilaris-dev/IlarisTex.git
```

Die Klasse kann in .tex Dateien innerhalb dieses Ordner verwendet werden.


## Plugins

### Kreaturen
Die Kreaturenkästen stehen auch ohne die `kreaturen.tex` zur Verfügung. Allerdings stellt die automatisch aus der [IlarisDB](https://github.com/Ilaris-dev/IlarisDB) generierte Datei Kurzbefehle für sämtliche Kreaturen bereit. Eine Standardliste ist der Installation beigelegt und kann zB durch Befehle wie `\kreaturbaer` genutzt werden. Für eine eigene Kreaturenliste einfach eine Datei mit dem Namen `kreaturen.tex` neben der `template.tex` anlegen.

### Glossar
Die Datei `glossar.tex` ist Teil von [IlarisGlossaryEntries](https://github.com/XaverStiensmeier/IlarisGlossaryEntries) und wurde von Xaver Stiensmeier erstellt. Sie kann durch einzelne Einträge im jeweiligen Projekt ergänzt werden, oder durch eine vollkommen eigene/neuere Datei ersetzt werden, indem sie neben der zu bauenden `template.tex` Datei gespeichert wird.
Das Glossar wird automatisch geladen und Kurzbefehle zum Einbinden und Formatieren stehen durch `\include{extras-glossar.tex}` zur Verfügung.
Wenn ein Glossar nur für bestimmte Einträge verwendet werden soll, muss es mit `makeglossaries template` (ohne .tex) gebaut werden. Zum Beispiel durch folgende Befehle (nacheinander):
```
xelatex template.tex
makeglossaries template
xelatex template.tex
```

## Unterschiede zu Ilaris-Latex
* Ziel: Einfache selbsterklärende, deutsche Befehle statt Latex Tutorial
* Modulare Kreaturenkästen (mehrere einzelne statt einem komplizierten Befehl)
* Direkte Einbindung der IlarisDB (im Aufbau) und des IlarisGlossars
* (Noch) keine coole Druckversion

## Abweichungen zum Ilaris Layout
* Seitenzahlen fangen nach Inhaltsverzeichnis an
* Teilweise alternative Schriftarten mit passenderen Lizenzen
