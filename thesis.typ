#import "aucklandthesis.typ": auckland-thesis, thesis-dedication

#show: auckland-thesis.with(
  title: "A Platform for Large Scale Statistical Modelling Using R",
  // subtitle: "Optional Subtitle",
  author: "Jason Cairns",
  degree-sought: "Doctor of Philosophy",
  degree-discipline: "Statistics",
  degree-completion-year: "2025",
  // line-spacing: "onehalf",
  // chapter-style: "forder",
  // exam-copy: true,
  // partial-fulfilment: true,
  // draft: true,
)

#thesis-dedication[
  _To my family and friends_
]

#let x = "hello"

// Table of contents
#outline(
  title: "Contents",
  indent: auto
)

#pagebreak()

// Your thesis content starts here
= Introduction

This is the first chapter of your thesis. The chapter title will be formatted according to the chosen style (Forder or Sewell).

== Background

This is a section within the chapter. #x #x #x

#figure(
  image("img/argument-attain.svg"),
  caption: "hello"
) <argument-attain>

=== Subsection

iThis is a subsection according to @abelson1996sicp. See also @argument-attain.

==== Sub-subsection

This is a sub-subsection.

= Literature Review

This is the second chapter.

== Previous Work

Content of the literature review.

= Methodology

This is the third chapter.

= Results

This is the fourth chapter.

= Conclusion

This is the final chapter.
#pagebreak()
#bibliography("bibliography.yml")
