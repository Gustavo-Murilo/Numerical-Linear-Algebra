// ------ Imports ------
#import "info.typ" as info

// ------ Global Settings ------

#set text(lang: "pt", size: 12pt)
#set text(ligatures: false)
#set text(font: "FreeSerif")

#set document(date: info.date,
              author: info.author)

// ------ Settings for Body ------

// Set spacing
#set par(leading: 0.7em, first-line-indent: 1.0em, justify: true)
#show par: set block(spacing: 1.4em)

#show heading.where(level: 1): set block(above: 2em, below: 1em)
#show heading.where(level: 2): set block(above: 1.85em, below: 1em)
#show heading.where(level: 3): set block(above: 1.75em, below: 1em)
#show heading.where(level: 4): set block(above: 1.55em, below: 1em)

// Header and footer content
#let headercont = align(horizon)[
  #smallcaps[#info.title #h(1fr)]
  #counter(page).display()
  #v(-0.5em)
  #line(start: (-5%,0%), end: (105%, 0%), stroke: (thickness: 0.5pt) )
]

#let footercont = align(horizon)[
  #line(start: (-5%,0%), end: (105%, 0%), stroke: (thickness: 0.5pt) )
  #v(-0.5em)
  #counter(page).display() #h(1fr)
  #smallcaps[#info.author ]
]

// Add headera and footer to pages, except for the first one
#set page(
  header: locate(
    loc => {
      if loc.page() > 1 {headercont}
    }
  ), 
  
  footer: locate(
    loc => {
      if loc.page() > 1 {footercont}
    }
  ),
  
  numbering: "1"
)

// Set numbering mode
#set math.equation(numbering: none)
#set heading(numbering: none)

// Set link blue
#show link: set text(fill: rgb(20%, 20%, 100%))

// Put code blocks into pretty blocks
// #show raw.where(block: true): it => {
//   block(
//     width: 100%,
//     fill: rgb(248, 248, 255),
//     inset: 10pt,
//     radius: 5pt,
//     breakable: true,
//     it
//   )
// }

#set math.mat(delim: "[")

// ------ Cover Page ------
#counter(page).update(0) // Set page number to start at 0
#include "cover_page.typ"

// ------ Content ------

// Table of contents.
#outline(
  title: {
    text(22pt, weight: 700, "Sumário")
    v(5mm)
  },
  indent: 2em,
  depth: 3
)

// --- Sections ---
#pagebreak(weak: false)
#include "Sections/problem_1.typ"

#pagebreak(weak: false)
#include "Sections/problem_2.typ"

#pagebreak(weak: false)
#include "Sections/problem_3.typ"

#pagebreak(weak: false)
#include "Sections/problem_4.typ"

#pagebreak(weak: false)
#include "Sections/problem_5.typ"


// --- Appendixes ---

// --- Bibliography ---