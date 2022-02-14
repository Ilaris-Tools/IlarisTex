> NOTE: Diese Datei so wie alle Inhalte dieses Ordners wurden von Xavier Stiensmeier erstellt:
> https://github.com/XaverStiensmeier/IlarisGlossaryEntries



# IlarisGlossaryEntries

Glossary entries for the ilaris rpg

## Use
Du kannst einfach die Datenbank deiner Wahl in den Ordner laden und createGlossary.py ausführen und die Ausgabe in glossary.tex umleiten. Dann musst du in der aktuellen Version einmal durchgehen und ein Ergebnis von "nichtfür..." entfernen (da ist eine Dopplung). Zuletzt kannst du glossaryExample.tex mit XeLaTeX ausführen. Dafür benötigst du die ilaris-tex Klasse, die es aktuell noch nicht zum Download gibt, weil die Lizenz unklar ist. Daher musst du dir selbst etwas konstruieren oder abwarten, bis ich mir was dazu einfallen lasse.

## Contribute
Ihr könnt gerne einfach selbst Glossary-Einträge schreiben und zur Einbindung vorschlagen. Dafür benötigt man kein Berufsgeheimnis ;)

```
\newglossaryentry{einzigartigeid}
{
    name={wunderschönerAnzeigeName},
    description={Beschreibung aus dem offiziellen Regelwerk mit sinnvollen Kürzungen/Umformulierungen, wo nötig oder angebracht.}
}
```

Dabei sollten Begriffe, die in der Beschreibung vorkommen auch schon verlinkt werden:
`\gls{begriff}` verlinkt den Begriff mit dem wunderschönerAnzeigeName. Manchmal ist die deutsche Grammatik da aber ein Hindernis und man muss den Fall anpassen. In dem Fall benutzt man `\glslink{begriff}{NeuerWunderschönerAnzeigenameFürDiesenFall}`

Eine Abkürzung kann über:
```
\newacronym{einzigartigeid}{Abkürzungsname}{\gls{iddeseigentlichenBegriffsmitErklärung}}
```

Beispiel:
```
\newglossaryentry{erfahrungspunkte}
{
    name={Erfahrungspunkte},
    description={Erfahrungspunkte sind die Währung, mit der du die Werte deines Charakters weiterentwickelst, sodass dein Charakter immer größere Herausforderungen bestehen kann.}}
    
\newacronym{ep}{EP}{\gls{erfahrungspunkte}}
```

## Use
1. https://ctan.org/pkg/glossaries?lang=en
2. https://en.wikibooks.org/wiki/LaTeX/Glossary
