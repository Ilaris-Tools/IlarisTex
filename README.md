## Benutzen
Es muss eine aktuelle TexLive version installiert sein, oder das paket tcolorbox manuell aktualisert werden, damti teilweise transparente Hintergründe funktionieren. [Infos zum updaten](https://tex.stackexchange.com/questions/55437/how-do-i-update-my-tex-distribution).

Falls ein Glossar gebaut werden soll (template ggf. durch entsprechenden Dateinamen ersetzen):
```
xelatex template.tex
makeglossaries template
pdflatex template.tex
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