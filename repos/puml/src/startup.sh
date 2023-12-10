#!/bin/bash


for f in "$(ls *.uml)"; do
    ff=${f%%.uml}
    set -x
    (
        echo "@startuml"
        echo "skinparam monochrome true"
        echo "skinparam dpi 150"
        cat "$f"
        echo "@enduml"
    ) | plantuml -progress -tpng -p >$ff.png

    (
        echo "@startuml"
        echo "skinparam monochrome true"
        echo "skinparam dpi 150"
        cat "$f"
        echo "@enduml"
    ) | plantuml -progress -tsvg -p >$ff.svg

    (
        echo "@startuml"
        echo "skinparam monochrome true"
        echo "skinparam dpi 150"
        cat "$f"
        echo "@enduml"
    ) | plantuml -progress -tpdf -p >$ff.pdf

    (
        echo "@startuml"
        echo "skinparam monochrome true"
        echo "skinparam dpi 150"
        cat "$f"
        echo "@enduml"
    ) | plantuml -progress -ttxt -p >$ff.txt

    (
        echo "@startuml"
        echo "skinparam monochrome true"
        echo "skinparam dpi 150"
        cat "$f"
        echo "@enduml"
    ) | plantuml -progress -tutxt -p >$ff.utxt

done
