#!/bin/bash
# For linux or macos machines
# populates contents of moniker-dir directory
# with, e.g., AbstractMoniker.pdf, CVMoniker.pdf, JobPaperMoniker.pdf

# For windows machines you must either do it by hand or write a bat file

latexmk -C
latexmk
latexmk -c
for file in *.pdf; do
    filename="${file%.*}"
    moniker="$(<.mymoniker)"
    outname="$filename""$moniker"
    cmd="cp $filename.pdf moniker-dir/$filename/$outname.pdf"
    echo "$cmd"
    eval "$cmd"
done

