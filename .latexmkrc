#!/usr/bin/env perl
$latex            = 'docker run --rm -v $PWD:/workdir paperist/alpine-texlive-ja platex -synctex=1 -halt-on-error';
$latex_silent     = 'docker run --rm -v $PWD:/workdir paperist/alpine-texlive-ja platex -synctex=1 -halt-on-error -interaction=batchmode';
$bibtex           = 'pbibtex';
$dvipdf           = 'docker run --rm -v $PWD:/workdir paperist/alpine-texlive-ja dvipdfmx -f ptex-ipaex.map %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode	  = 3; # generates pdf via dvipdfmx

# Prevent latexmk from removing PDF after typeset.
# This enables Skim to chase the update in PDF automatically.
$pvc_view_file_via_temporary = 0;

# Use Skim as a previewer
$pdf_previewer    = "open -ga /Applications/Skim.app";
