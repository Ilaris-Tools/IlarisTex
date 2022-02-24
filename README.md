## Installation

### Latex Paket

### Entwicklungs-Modus

## Benutzen
Es muss eine aktuelle TexLive version installiert sein, oder das paket tcolorbox manuell aktualisert werden, damti teilweise transparente Hintergründe funktionieren. [Infos zum updaten](https://tex.stackexchange.com/questions/55437/how-do-i-update-my-tex-distribution).


## Plugins

### Kreaturen
Die Kreaturenboxen stehen auch ohne die `kreaturen.tex` zur Verfügung. Allerdings stellt die automatisch aus der [IlarisDB](https://github.com/Ilaris-dev/IlarisDB) generierte Datei Kurzbefehle für sämtliche Kreaturen bereit. Eine Standardliste ist der Installation beigelegt und kann zB durch Befehle wie `\kreaturbaer` genutzt werden. Für eine eigene Kreaturenliste einfach eine Datei mit dem namen `kreaturen.tex` neben der `template.tex` anlegen.

### Glossar
Die Datei `glossar.tex` ist Teil von [IlarisGlossaryEntries](https://github.com/XaverStiensmeier/IlarisGlossaryEntries) und wurde von Xaver Stiensmeier erstellt. Sie kann durch einzelne Einträge im jeweligen Projekt ergänzt werden, oder durch eine volkommen eigene/neuere Datei ersetzt werden, indem sie neben der zu bauenden `template.tex` datei gespeichert wird.
Das Glossar wird automatisch geladen und Kurzbefehle zum Einbinden und Formatieren stehen durch `\include{extras-glossar.tex}` zur Verfügung.
Wenn ein Glossar nur für bestimmte Einträge verwendet werden soll, muss es mit `makeglossaries template` (ohne .tex) gebaut werden. Zum Beispiel durch folgende Befehle (nacheinander):
```
xelatex template.tex
makeglossaries template
xelatex template.tex
```

## Unterschiede zu Ilaris-Latex
*  Ziel: Einfache selbsterklärende, deutsche Befehle (`extras.tex`) statt Latex Tutorial
* Wer Latex kann oder lernen möchte, kann direkt die Klasse verwenden, die weitestgehend Ilaris-Latex entspricht

## Abweichungen zum Ilaris Layout
* Seitenzahlen fangen nach inhaltsverzeichnis an

## extras.tex Beispiele
```
\kasten{
    Dieser Text steht im Kasten
}

\geschichte{
    Dieser Text steht eingerückt und kursiv als IT-Text mit Angabe einer Autorin.
}{Alrike von Beispielstein}
```
