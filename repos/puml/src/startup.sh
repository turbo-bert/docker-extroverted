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

done
