# t-SNE deutscher Parteien basierend auf deren Antworten zum Wahl-O-Mat der Bundestagswahl 2017.

32 Parteien beantworteten 38 Fragen zum Wahl-O-Mat der Bundestagswahl 2017. Diese wurden eingelesen und folgendermaßen kodiert:
- nein: -1
- neutral: 0
- ja: 1

Das "t-distributed stochastic neighbor embedding" - Verfahren wird verwendet um hochdimensionale Datensätze zweidimensional darzustellen. Die 38 Fragen werden so auf 2 Dimensionen reduziert, wobei möglichst viel der statistischen Ähnlichkeit zwischen den ursprünglichen Daten erhalten bleiben soll. Da tSNE einen Zufallsgenerator verwendet weichen die Ergebnisse je nach Initialisierung des ZFGs ab. Obwohl dies zu Unterschieden fuehrt sind sich die meisten Ergebnisse sehr äahnlich.

## Quellen
- *Wahl-O-Mat*: https://www.wahl-o-mat.de/bundestagswahl2017/PositionsvergleichBundestagswahl2017
- *Rtsne*: https://cran.r-project.org/web/packages/Rtsne/