// ------ Info ------
#import "info.typ" as info

// Global Settings //
#set align(center)

// ------ College Logo ------

#figure(
  image("Pictures/FGV_logo.png", width: 25%)
)

#smallcaps()[Escola de Matemática Aplicada]

#line(start: (-5%, 0%), end: (105%, 0%), stroke: (thickness: 0.7pt))

//  ------ Header ------

// Title
#text(weight: "bold", size: 18pt)[#info.title]

Aluno: #text(style: "italic")[#info.author]


E-mail: #text(style: "italic")[#link("mailto:", info.email)]

Programa: #text(style: "italic")[Bacharelado em Matemática Aplicada]

Disciplina: #text(style: "italic")[#info.subject]

Professor: #text(style: "italic")[#info.teacher]

#line(start: (-5%, 0%), end: (105%, 0%), stroke: (thickness: 0.7pt))

// ------ Date ------

// Date (automatic) 
#let meses = ("janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro")

#let dia = info.date.day()
#let mês = info.date.month()
#let ano = info.date.year()

Data: #text(style: "italic")[#dia de #meses.at(mês - 1) de #ano]

// Date (manual)
// Data : 00 de AAAAA de 0000 

#line(start: (-5%, 0%), end: (105%, 0%), stroke: (thickness: 0.7pt))