# UTF-8 Format für Umlaute
Sys.setlocale("LC_ALL", "German")

wahlomat_tsne = function(seed) {
  
  # Quelle: https://www.wahl-o-mat.de/bundestagswahl2017/PositionsvergleichBundestagswahl2017
  # einlesen der Antworten der Partein auf die Wahl-O-Mat Fragen 2017
  wahlomat = read.csv("wahlomat.csv")
  
  # nein = 0 -> -1
  wahlomat[wahlomat==0] = -1
  
  # neutral = _ -> 0
  wahlomat[is.na(wahlomat)] = 0
  
  # volle Namen der Partein
  parteinamen = c(
    "CDU/CSU",
    "SPD",
    "DIE LINKE",
    "GRÜNE",
    "FDP",
    "AfD",
    "PIRATEN",
    "NPD",
    "FREIE WÄHLER",
    "Tierschutzpartei",
    "ÖDP",
    "Die PARTEI",
    "BP",
    "Volksabstimmung",
    "PDV",
    "MLPD",
    "BüSo",
    "SGP",
    "DIE RECHTE",
    "Allianz Deutscher Demokraten",
    "Tierschutzallianz",
    "B*",
    "BGE",
    "DiB",
    "DKP",
    "DM",
    "Die Grauen",
    "du.",
    "MENSCHLICHE WELT",
    "Die Humanisten",
    "Gesundheitsforschung",
    "V-Partei³"
  )
  
  # Quelle: https://cran.r-project.org/web/packages/Rtsne/
  # https://cran.r-project.org/web/packages/Rtsne/README.html
  # tSNE embedding mit perplexity von 5 und default seed von 42
  library(Rtsne)
  set.seed(seed) 
  tsne_out <- Rtsne(t(as.matrix(wahlomat)), perplexity=5)
  
  # plot der Partein
  pdf(paste0("parteien_tsne", seed,".pdf"), 14, 10)
  
  # anpassen der Ränder und Überschirft
  par(mar = c(2,2,2,2), oma = c(2,2,2,2))
  mins = apply(tsne_out$Y,2,min) * 1.1
  maxs = apply(tsne_out$Y,2,max) * 1.1
  plot(c(mins[1], maxs[1]), c(mins[2], maxs[2]), type="n", ylab='', xlab='', axes=FALSE, cex.main=1.3, font=2,
       main= "tSNE deutscher Parteien basierend auf Wahl-O-Mat Fragen zur Bundestagswahl 2017")
  
  # plotten der tsne Werte
  points(tsne_out$Y, col="steelblue2", pch=15)
  
  # plotten der Parteinamen
  text(tsne_out$Y, labels=parteinamen, pos = 1, cex= 1.2, col="gray30", font=2)
  
  # Gitter
  grid(10, lwd=2)
  
  # ursprüngliches git Projekt
  text(mins[1] * 0.8, mins[2], "https://github.com/jklanger/btw2017", font=3, cex=0.75)
  dev.off()
  
}

for (seed in c(1, 5, 42, 123)) {
  wahlomat_tsne(seed)
}
