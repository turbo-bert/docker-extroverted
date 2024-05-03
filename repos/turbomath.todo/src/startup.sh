#!/bin/bash



for F in $(ls *.math); do
    FF=${F%%.math}
    echo "$FF"


    D=$(mktemp -d /tmp/math-XXXXXXXXXXX)
    (
        echo -en '$$'
        head -1 $F | tr -d '\n'
        echo -en '$$'
    ) >$D/main.tex
    cp /lit.tex $D

    ( cd $D && pdflatex -interaction=nonstopmode lit.tex 1>o 2>e)
    ec=$?
    #( cd $D && pdflatex -interaction=nonstopmode lit.tex )
    #( cd $D && pdflatex -interaction=nonstopmode lit.tex )
    ( cd $D && convert -density 600 lit.pdf -trim -bordercolor white -border 5 lit.png )


    #cat $D/lit.pdf >$FF.pdf
    cat $D/lit.png >$FF.png
    if [[ ! $ec = "0" ]]; then
        cat $D/o >$FF.o.txt
        cat $D/e >$FF.e.txt
        echo "error!!!"
    fi

    rm -fr $D

done



#set -x
#if [[ -f main.tex ]]; then
#    rm -f lit.aux lit.log lit.out lit.pdf
#    if [[ ! -f lit.tex ]]; then
#        cp /lit.tex .
#        for I in $(seq 1 3); do
#            pdflatex -interaction=nonstopmode lit.tex
#            ec=$?
#            if [[ ! $ec = "0" ]]; then
#                echo "LATEX ERROR"
#                exit 1
#            fi
#        done
#    else
#        echo "conflicting file lit.tex found..., press ENTER to continue"
#        read
#        exit 2
#    fi
#    rm -f lit.tex lit.aux lit.log lit.out # lit.pdf
#else
#    echo "no main.tex found in CWD, press ENTER to continue"
#    read
#fi
#