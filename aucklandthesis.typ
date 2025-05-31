// University of Auckland thesis template for Typst
// Simplified and modified from the original aucklandthesis.cls
// written by Alistair Kwan, Centre for Learning & Research in Higher Education University of Auckland
//
// This template accommodates theses for PhD and other degrees

#let auckland-thesis(
  // Required fields
  title: none,
  author: none,
  degree-sought: none,
  degree-discipline: none,
  degree-completion-year: none,
  
  // Optional fields
  subtitle: none,
  
  // Options
  line-spacing: "onehalf", // "single", "onehalf", "double"
  exam-copy: false,
  partial-fulfilment: false,
  draft: false,
  
  // Chapter style options
  chapter-style: "forder", // "forder" or "sewell"
  
  // Content
  body
) = {
  
  // Validate required fields
  assert(title != none, message: "Title is required")
  assert(author != none, message: "Author is required")
  assert(degree-sought != none, message: "Degree sought is required")
  assert(degree-discipline != none, message: "Degree discipline is required")
  assert(degree-completion-year != none, message: "Degree completion year is required")
  
  // Page setup - equivalent to memoir page dimensions
  set page(
    paper: "a4",
    margin: (
      left: 4cm,
      right: 4cm,
      top: 3cm,
      bottom: 4cm
    ),
    header-ascent: 2em,
    footer-descent: 1em,
  )
  
  // Set line spacing
  let spacing-multiplier = if line-spacing == "single" {
    1.0
  } else if line-spacing == "double" {
    2.0
  } else {
    1.5 // default to one-and-half
  }
  
  set par(leading: spacing-multiplier * 0.65em)
  
  // Typography settings
  set text(
    size: 11pt,
    font: "New Computer Modern", // Computer Modern font
  )
  
  // Heading numbering depth (equivalent to setsecnumdepth{subsubsection})
  set heading(numbering: "1.1.1.1")
  
  // Title page
  page(
    header: none,
    footer: none,
    margin: (
      left: 4cm,
      right: 4cm,
      top: 2cm,
      bottom: 2cm
    )
  )[
    // Top rule
    #line(length: 100%, stroke: 0.5pt)
    
    #v(1fr)
    
    // Title section
    #align(center)[
      #text(size: 24pt)[#title]
      
      #if subtitle != none [
        #v(0.5em)
        #text(size: 18pt)[#subtitle]
      ]
    ]
    
    #v(1fr)
    
    // Author section
    #align(center)[
      #text(size: 14pt)[#author]
    ]
    
    #v(1fr)

    
    // Degree information
    #align(center)[
      A thesis submitted in #if partial-fulfilment [partial ] fulfilment \
      of the requirements for the degree of
      
      #text(weight: "bold")[#degree-sought] in #degree-discipline,
      
      The University of Auckland, #degree-completion-year.
      
      #if exam-copy [
        #v(1em)
        #text(weight: "bold")[
          This thesis is for examination purposes only, \
          and is confidential to the examination process.
        ]
      ]
    ]

    #v(0.5fr)

    
    // Bottom rule
    #line(length: 100%, stroke: 0.5pt)
  ]
  
  // Set up page numbering and headers for main content
  counter(page).update(1)

  let draft-footer = if draft {
    context {
      align(left)[#emph[Draft]]
      h(1fr)
      align(center)[#counter(page).display()]
      h(1fr)
      align(right)[#emph[#datetime.today().display()]]
    }
  } else {
    none
  }

  let forder-header = context {
    // Even pages (left side)
    if calc.even(here().page()) {
      align(left)[
        #context {
          let headings = query(heading.where(level: 1))
          if headings.len() > 0 {
            let current-chapter = headings.last()
            [#counter(page).display() #h(1em) #emph[#current-chapter.body]]
          } else {
            counter(page).display()
          }
        }
      ]
    } else {
      // Odd pages (right side)
      align(right)[
        #context {
          let headings = query(heading.where(level: 2))
          if headings.len() > 0 {
            let current-section = headings.last()
            [#emph[#current-section.body] #h(1em) #counter(page).display()]
          } else {
            counter(page).display()
          }
        }
      ]
    }
  }

  set page(
      header: forder-header,
      footer: draft-footer,
    )
    
    // Forder chapter style
    show heading.where(level: 1): it => {
      pagebreak(weak: true)
      v(50pt)
      
      align(center)[
        #text(size: 14pt)[
          #smallcaps[--- Chapter #counter(heading).display("i") ---]
        ]
      ]
      
      v(20pt)
      
      align(center)[
        #text(size: 24pt)[
          #smallcaps[#it.body]
        ]
      ]
      
      v(60pt)
    }
    
    // Forder section styles - hanging section numbers
    show heading.where(level: 2): it => {
      v(1.5em)
      
      // Hanging section number
      let section-num = counter(heading).display("1")
      
      block[
        #text(size: 14pt)[
          #smallcaps[#section-num. #it.body]
        ]
      ]
      
      v(0.5em)
    }
    
    show heading.where(level: 3): it => {
      v(1em)
      text(size: 12pt, weight: "bold")[
        #counter(heading).display("1.1") #it.body
      ]
      v(0.5em)
    }
    
    show heading.where(level: 4): it => {
      v(1em)
      text(style: "italic")[
        #counter(heading).display("1.1.1") #it.body
      ]
      v(0.5em)
    }

  
  body
}

// Dedication page helper function
#let thesis-dedication(content) = {
  page(
    header: none,
    footer: none,
    margin: (
      left: 4cm,
      right: 4cm,
      top: 3cm,
      bottom: 4cm
    ),
  )[
    #v(1fr)
    #align(center)[#content]
    #v(2fr)
  ]
}
