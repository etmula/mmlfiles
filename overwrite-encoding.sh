#!/bin/bash
ulimit -n 2048

if [[ $* == *mml* ]]; then
    if [ -d mml ]; then
        nkf -w --overwrite mml/*.miz
        echo 'finished mml'
    else
        echo 'mml/ does not exist'
    fi
fi

if [[ $* == *fmbibs* ]]; then
    if [ -d fmbibs ]; then
        nkf -w --overwrite fmbibs/*.bib
        echo 'finished fmbibs'
    else
        echo 'fmbibs/ does not exist'
    fi
fi

if [[ $* == *abstr* ]]; then
    if [ -d abstr ]; then
        nkf -w --overwrite abstr/*.abs
        echo 'finished abstr'
    else
        echo 'abstr/ does not exist'
    fi
fi

if [[ $* == *vct* ]]; then
    if [ -f mml.vct ]; then
        nkf -w --overwrite mml.vct
        echo 'finished mml.vct'
    else
        echo 'mml.vct does not exist'
    fi
fi

if [[ $* == *ini* ]]; then
    if [ -f mml.ini ]; then
        nkf -w --overwrite mml.ini
        echo 'finished mml.vct'
    else
        echo 'mml.ini does not exist'
    fi
fi

if [[ $* == *lar* ]]; then
    if [ -f mml.lar ]; then
        nkf -w --overwrite mml.lar
        echo 'finished mml.lar'
    else
        echo 'mml.lar does not exist'
    fi
fi

if [[ $* == *html* ]]; then
    if [ -d html ]; then
        echo 'processing .html'
        count=1
        file_count=$( find html/*.html -type f | wc -l )
        find html/*.html -type f | while read FILE
        do
            if [[ ! $(nkf -g ${FILE}) == ASCII ]]; then
                nkf -wd --overwrite ${FILE}
            fi
            count=$(expr $count + 1)
            BAR="$(yes . | head -n $((count * 100 / file_count)) | tr -d '\n')"
            printf "\r[%d/%d][%3d/100] %s" ${count} ${file_count}  $((count * 100 / file_count)) ${BAR}
        done
        printf "\n"

        echo 'processing proofs'
        count=1
        file_count=$( find html/proofs -type f | wc -l )
        find html/proofs -type f | while read FILE
        do
            if [[ ! $(nkf -g ${FILE}) == ASCII ]]; then
                nkf -wd --overwrite ${FILE}
            fi
            count=$(expr $count + 1)
            BAR="$(yes . | head -n $((count * 100 / file_count)) | tr -d '\n')"
            printf "\r[%d/%d][%3d/100] %s" ${count} ${file_count}  $((count * 100 / file_count)) ${BAR}
        done
        printf "\n"

        echo 'processing refs'
        count=1
        file_count=$( find html/refs -type f | wc -l )
        find html/refs -type f | while read FILE
        do
            if [[ ! $(nkf -g ${FILE}) == ASCII ]]; then
                nkf -wd --overwrite ${FILE}
            fi
            count=$(expr $count + 1)
            BAR="$(yes . | head -n $((count * 100 / file_count)) | tr -d '\n')"
            printf "\r[%d/%d][%3d/100] %s" ${count} ${file_count}  $((count * 100 / file_count)) ${BAR}
        done
        printf "\n"
    else
        echo 'html/ does not exist'
    fi
fi
