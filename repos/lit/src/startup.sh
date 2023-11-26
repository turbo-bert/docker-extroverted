#!/bin/bash


set -x
if [[ -f main.tex ]]; then
    rm -f lit.aux lit.log lit.out lit.pdf
    if [[ ! -f lit.tex ]]; then
        cp /lit.tex .
        for I in $(seq 1 3); do
            pdflatex -interaction=nonstopmode lit.tex
            ec=$?
            if [[ ! $ec = "0" ]]; then
                echo "LATEX ERROR"
                exit 1
            fi
        done
    else
        echo "conflicting file lit.tex found..., press ENTER to continue"
        read
        exit 2
    fi
    rm -f lit.tex lit.aux lit.log lit.out # lit.pdf
else
    echo "no main.tex found in CWD, press ENTER to continue"
    read
fi
