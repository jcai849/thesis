///////////////////////////////////////////////////////////////////////////////
 
#set page(numbering: "1")

#let title(title, name) = {
  grid(
    columns: (1fr, 1fr),
    align: (left, right),
    heading(title, level: 1),
    [
      #emph(name) \
      #datetime.today().display()
    ]
  )
  line(length: 100%)
}

#let commit(hash) = {
  let url = "https://github.com/jcai849/thesis/commit/" + hash
  let hash_disp = link(url, highlight(fill: green, extent: 2pt, raw("#" + hash.slice(0,8))))
  [Commit #hash_disp]
}

#let pkg_action_artifact(pkg, run, artifact) = {
  let pkg_url = "https://github.com/jcai849/" + pkg
  let action_url = pkg_url + "/actions/runs/" + run
  let artifact_url = action_url + "/artifacts/" + artifact
  let action_disp = link(action_url, highlight(fill: green, extent: 2pt, raw("#" + run)))
  let artifact_disp = link(artifact_url, highlight(fill: green, extent: 2pt, raw("#" + artifact)))
  [/ #link(pkg_url, pkg): Action #action_disp \; Check Artifact #artifact_disp]
}


///////////////////////////////////////////////////////////////////////////////

 
#title([Doctoral Thesis Revision], [Jason Cairns])

#outline() \
#line(length: 100%)

== Corrections

N.B. Corrections that have been made are indicated with hyperlinks to the git commits, as, e.g., #commit("12345678")

=== Reviewer 1

+ Floating point arithmetic is non-associative. #commit("517aae20944bc35cf5fa4775bdef1862e77f65fe").
+ Mathematical description of LASSO should match the implementation. #commit("fb4fdf608185010c73a37d80f54243b0af551352").
+ ```R c < a + b``` should be ```R c <- a + b```. #commit("0862e9ee9b3a04baf2656485513c2c8d1d076890")
+ "nectar cluster" needs to be defined. #commit("60450784fcf4b4541482fd78cc42e4f546e272a4")
+ Use "Worker" instead of "Slave": #commit("1e15f4db93d49da47e5fe5ed4995ac0922a54a5d").
+ Crash is not an appropriate term for a lack-of-memory error: #commit("17c44d5958e978392a966dfcde290e253955bb2a")
+ Explicitly define what is meant by a statistical algorithm in this thesis. #commit("058f69c370c910d8a930935564a7498a41c875bd")
+ Be more formal -- Norman Matloff, not Norm. #commit("4e399bb5090a171a01ed8467c8746174e318c71b")

=== Reviewer 2

+ Drop “Figure showing …” from captions. #commit("3488fa8ceb9d760a854e240791bee27a2b71ae83")
+ Figure and Equation references should not be abbreviated, e.g. ‘fig. 2.1’ #sym.arrow ‘figure 2.1’ and ‘eq. (2.2)’ #sym.arrow ‘Equation (2.2)’. #commit("dc0c9ff985c07da6d4a6c8580f586008c2a07f3b").
+ Listings should prefix by chapter, e.g. ‘Listing 68’ #sym.arrow ‘Listing 5.11’. #commit("d6b619b18702e91e4da1b170b88bfbe9d4766fd3").
+ Capitalise references to chapters, tables, figures, etc., e.g. ‘Chapter 5’, ‘Figure 2.1’, ‘Table 3.1’, and ‘Equation (3)’. #commit("dc0c9ff985c07da6d4a6c8580f586008c2a07f3b").
+ Add legends to figures, preferably to the captions. e.g. Figure 4.1 has symbols ‘C’, ‘Q’, and ‘S’ without description. #commit("aa661fc958c149726ca12c8fb63b9a8b77ad0c87").
+ Consistent capitalization of captions, e.g. “Figure 4.1: Logical time diagram of chunk assignment for server-originated chunk ID” and “Figure 4.2: Space-Time Diagram of Client-Originated Chunk ID”. #commit("8498dfc8ba7afff703e7253f609ca4a3e11f83de").
+ Specify properties of the underlying algorithm, not the listing. e.g. “Figures 7.6 and 7.8 both have the potential to alter the state of availability as marked on computational prerequisite chunks.”, or “Listing 25 simply won’t work.”; it’s not the listing that works - it’s the code or the call that doesn’t work. #commit("7ea857ee2bead79f4afdd342336959220295effb").
+ Don’t use contraction in scientific text; instead spell them out, e.g. "won’t" #sym.arrow "will not". #commit("7fe3c106191393dfb419ebc4abecaea72e89894f").
+ Consistently precede “respectively” at the end sentences with a comma, e.g. "… corresponding to the listings listing 66 and listing 67[,] respectively." #commit("984f1d61e4a9d668a658f43f535fa66fca929584")
+ Remove reference to "document" or "report", e.g. Section 4.2.2.4: "This document serves ...": #commit("3322b6b27ea55fab78c1970baa071bc899247e10")
+ Table 4.2: There is in “‘origin’ must be supplied’ error in this output. #commit("70df4a5aeac84ec932adc9daa1da1972fb06336c").
+ Fix grammatical errors:
  + Fix incomplete sentence "With this particular demonstration of distributed LASSO dependent on proofs ofseparability for partitioned block matrices using rows as observations, and minor ADMM optimisations, as described in Boyd et al. [30]." #commit("5ca1db86b214643aaa093699cf37370f1e248cbb")
  + "compared to and" #sym.arrow "compared to an". #commit("b6090223bf094ef0cf98f6f4f9a5317982a4b301").
  + "perform a function [call] at the". #commit("b6090223bf094ef0cf98f6f4f9a5317982a4b301").
  + 'which' #sym.arrow 'that', e.g. "examining some of the provided functionality which aids the creation of custom models". #commit("b6090223bf094ef0cf98f6f4f9a5317982a4b301").
  + 'chunks references' -> 'chunk references'. #commit("b6090223bf094ef0cf98f6f4f9a5317982a4b301").
  + 'in reduces wait time’ -> 'in reduced wait time'. #commit("b6090223bf094ef0cf98f6f4f9a5317982a4b301").
  + "job ID's” -> “job IDs” or “job ID”. Same for “chunk ID's”. #commit("b6090223bf094ef0cf98f6f4f9a5317982a4b301").
  + "listing 26 is the” -> “Listing 26 is the” (capitalization). #commit("dc0c9ff985c07da6d4a6c8580f586008c2a07f3b").
  + "figure fig. 4.2.”. #commit("b6090223bf094ef0cf98f6f4f9a5317982a4b301").
  + "listing listing 2” and “listing listing 5”. #commit("d6b619b18702e91e4da1b170b88bfbe9d4766fd3").
  + "from on location” -> “from one location”. #commit("b6090223bf094ef0cf98f6f4f9a5317982a4b301").
  + "proofs ofseparability” -> “proofs of separability”. #commit("5ca1db86b214643aaa093699cf37370f1e248cbb").
  + "largescaleobjects_primitives" -> “largescaleobjects primitives”. #commit("1b4f03435e7720c2badbccc4bdfed2cd59f88424").
  + "that is is the”. #commit("b6090223bf094ef0cf98f6f4f9a5317982a4b301").
  + "… a three billion length integer.” -> “… a three billion length integer vector”. #commit("b6090223bf094ef0cf98f6f4f9a5317982a4b301").
  + "be a a sample”. #commit("b6090223bf094ef0cf98f6f4f9a5317982a4b301").
  + "which is just treated as just a list of symbols”. #commit("b6090223bf094ef0cf98f6f4f9a5317982a4b301").
  + Drop comma in “… in the following section 3.3, on computation.” #commit("b6090223bf094ef0cf98f6f4f9a5317982a4b301").
  + “… along with the relevant libraries and functions”: “libraries” -> “packages”. #commit("b6090223bf094ef0cf98f6f4f9a5317982a4b301").
+ Nomenclature: (#commit("4e399bb5090a171a01ed8467c8746174e318c71b"))
  + 'csv' #sym.arrow 'CSV' (also worth spelling out at first use)
  + 'ssh' #sym.arrow 'SSH' (also worth spelling out at first use)
  + 'UC, Davis' -- spell out
  + 'docker' #sym.arrow 'Docker'
  + 'facebook' #sym.arrow 'Facebook'
  + 'lisp' #sym.arrow 'Lisp'
  + 'openmpi' #sym.arrow 'OpenMPI'
  + 'openMPI' #sym.arrow 'OpenMPI'
  + 'python' #sym.arrow 'Python'
  + 'redis' #sym.arrow 'Redis'
  + 'dask' #sym.arrow 'Dask' (the framework)
  + Package is ‘Rmpi’ - not ‘rmpi’
+ Consistent capitalisation (#commit("50b37c33b7358f513e50b1c503da3a469e157ee2")):
  + ‘i/o' and 'I/O'
  + ‘lasso' and 'LASSO'
  + ‘tidyverse' and 'Tidyverse'
+ Term Consistency (#commit("8a6d621562e4956e7a38b09a31f0bf6fb81764a3")):
  + "NYC TLC dataset", "NYC taxi dataset", and "NYC Taxi data".
  + "Data Frame", "Data frame", “data frame", and "data.frame".
+ Define terms (#commit("1affba37c45ef5fbdd8bd32b55d0ef67f0cf670f")):
  + "continuations"
  + "coroutines"
  + "foreign keys"
  + "marshall” / “unmarshall"
  + "RSclient"
  + "Rserve"
  + "tail-call elimination"
  + "tail-recursive functions"
+ Define Acronyms (#commit("049219e5be4795ea5a439b0490c6404279f8468c")):
  + 'ATLAS'
  + 'AWS'
  + 'BLAS'
  + 'DAG'
  + 'ECS'
  + 'ER' (Entity-Relationship)
  + 'GLM'
  + 'iid'
  + 'LAPACK'
  + 'LASSO'
  + 'PCA'
  + 'RDS'
  + 'REPL'
  + 'REST'
  + 'RPC'
  + 'RWLS'
  + 'SPMD'
  + 'TCP'
  + 'UML'
+ Correct Units (#commit("a7809a5d8961c1c71581f71e64b80a010dbe8860")):
  + Specify currency, e.g. “\$146M” NZD or USD
  + 'Mb' #sym.arrow 'MiB' (or 'MB'?)
  + 'Gb' #sym.arrow 'GiB' (or 'GB'?)
+ Consistent pluralisation (#commit("e7d5f5d15a1452624ee88c1a3b5c76263d9f68d3")):
  + singular/plural "data are" / "data is"
  + singular/plural "maximums" / "maxima"
+ Complete sentence for Section 1.4: "First, to gain context."
+ Fix outdated information (#commit("77565e21bd88dcffe10cfc79383ffc8bdb997783")):
  + "The package is authored by Matt Dowle, currently an employee at H2O.ai"
  + "... Davis Vaughn, an employee at RStudio"
  + "foreach is managed by Revolution Analytics"
  + https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page moved to PARQUET files as of 2022-05-13.
  + Remove temporal references like "Current System", "New Structures", "Current Structures", and "Existing Systems". #commit("a7a9cdee5b394fb68754ed00b4079f141fe93429")
  + Avoid "present" in "This dataset consists of measures relating to all taxi and limousine trips in New York City from January 2009 to present"
+ ```R %when%``` doesn't exist in foreach, but externally defined. #commit("63dd975a6bf5aba9562df9ecb53685aaa847f897").
+ Fix Section 2.3.1.1: "has 5 primary services" #sym.arrow "has five primary services". #commit("0480879653cddd19fd4fdb453763f70b25d9347a").
+ Fill missing references (#commit("310e63dd56edf281db6a337c0c31fc67105f1a5e")):
  + 'True Cluster' in Section 2.4.6.
  + 'serialize package' in Section 2.5.8
  + Section 7.4.1: Add reference for the "taxicab dataset".
  + R package ‘distObj’ lacks a reference.
  + R package ‘RSclient’ lacks a reference.
  + R package ‘Rserve’ lacks a reference, e.g. “Rserve (authored by Simon Urbanek)”.
  + R package ‘dplyr’ lacks a reference.
+ Listings corrections (#commit("bd116aadf88d8663a1c7975a9fa448fa81c52afc")):
  + Listing 3: “return0”, “return1”
  + Listing 49: The code uses ```R d_1```, ```R d_2```, and ```R d_3```, whereas the text uses d1, d2, and d3
  + "```R 100:130``` translated to ```R 1:30```" #sym.arrow ```R 1:31```
+ Equation (6.4): Missing "... and analogously for $g$". #commit("ffe2b819651bc643016cb5412352586863575a50").
+ Equation (6.5): Clarify the dimension of $A$, e.g. "$A in RR^(M crossmark n) "with" M=m_i$". Also, clarify "... consisting of $N$ sub-matrices, each with $n$ columns." #commit("2fc030df2ffacfd759613c484a6ec16744019bc6").
+ Drop "flawed" in "... R has both visibly slipped in the (flawed) TIOBE index of use ...". #commit("684420946b61d06ce439c3f2d69c70a81e3ef1ab").
+ Avoid source-code comments such as ```R # don’t do this in production code``` without an explanation. #commit("11528f30881d9d6dbf55592f9e6c19e8005cdb34").

== R Packages

All R packages now have CI pipelines using GitHub Actions, which performs:

```sh
R CMD build .
R CMD check --as-cran *.tar.gz
```

All packages have been amended based on this check to no longer trigger any warnings.
See:

#pkg_action_artifact("largescalemodels", "15807116690", "3377940120")
#pkg_action_artifact("largescaleobjects", "15806884962", "3377881813")
#pkg_action_artifact("chunknet", "15806562272", "3377809193")
#pkg_action_artifact("orcv", "15806010939", "3377686037")

== Other Revisions

+ Acknowledgements section. #commit("5c8a71e2094d51bc06cd858b8c12c2b1dbeb949c")
+ Reproducible Build. #commit("06c6ce6548b43113d9ad58e19281da3fc71f6581").

== Further Suggestions

These further suggestions have been noted for potential future research, but are not considered corrections as required for final thesis submission.

=== Reviewer 1

+ Use Kahan Summation for large additive operations (w.l.o.g re. other arithmetic operations).
+ A more principled approach to RNG.
+ Limited view of statistical analysis -- consider MCMC as another example.
+ Consider iterative solvers for lm, rather than sequential.
+ It might be useful to have ways to guard against inadvertent large memory/time operations, in particular in interactive use.
+ Redundancy/caching of non-mutable data could be considered.
+ Local version of LASSO should mirror distributed version more closely, using generics.
+ LASSO code should be chunked, with complete working code in appendix.

=== Reviewer 2

+ Add Glossary of all acronyms and terms with their descriptions and definitions.
+ Add index of all “own” functions, packages, created, discussed, and mentioned.
+ Mention some of the known limitations of ‘foreach’.
+ Add line numbers to code snippets.
+ Reference the specific lines of code which are sent to nodes in, Section 3.5.

== Suggested Code Improvements

+ Use ```R TRUE``` and ```R FALSE```; avoid ```R T``` and ```R F```
+ Use consistent spacing, e.g. ```R quiet = TRUE```, ```R bldim=2```, and ```R quote({ chunk + 1})```.
+ Use named argument calls, e.g. ```R serialize(msg, NULL , T)``` #sym.arrow ```R serialize(msg, connection = NULL , ascii= TRUE)``` and ```R get("JOB_ID", x)``` #sym.arrow ```R get("JOB_ID", envir = x)```
+ Use consistent indentation; currently either four or eight positions.
+ Using ```R ::``` in more places to help the reader to understand where the different functions are coming from, and which are in-house.
+ Remove stray semicolons at the end of some lines.
