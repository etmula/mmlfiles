#!/bin/bash

if [[ $* = *html* ]] ; then
    if [ ! -d html ] ; then
        mkdir temp
        echo 'Downloading...'
        wget https://ftp.icm.edu.pl/packages/mizar/xmlmml/html_abstr.5.57.1355.tar.gz -O temp/html.tar.gz -q --show-progress
        tar -zxf temp/html.tar.gz -C temp
        mv -i temp/html html
        rm -r temp
        echo 'finished html/'
    else
        echo 'html/ already exist'
    fi
fi

if [[ $* == *mml* ]] || [[ $* == *fmbibs* ]] || [[ $* == *abstr* ]] || [[ $* == *vct* ]] || [[ $* == *ini* ]] || [[ $* == *lar* ]]; then
    mkdir temp
    echo 'Downloading ...'
    wget http://mizar.uwb.edu.pl/~softadm/current/mizar-8.1.09_5.57.1355-arm-linux.tar -O temp/mizar.tar -q --show-progress
    tar -xf temp/mizar.tar -C temp
    tar -zxf temp/mizshare.tar.gz -C temp
    if [[ $* == *mml* ]] ; then
        if [ ! -d mml ] ; then
            mkdir mml
            mv temp/mml/*.miz mml/
            echo 'finished mml/'
        else
            echo 'mml/ already exist. Remove old directory.'
        fi
    fi

    if [[ $* == *fmbibs* ]] ; then
        if [ ! -d fmbibs ] ; then
            tar -zxf temp/mizdoc.tar.gz -C temp
            unzip -q temp/fmbibs.zip -d fmbibs
            echo 'finished fmbibs/'
        else
            echo 'fmbibs/ already exist. Remove old directory.'
        fi
    fi

    if [[ $* == *abstr* ]] ; then
        if [ ! -d abstr ] ; then
            mkdir abstr
            mv temp/abstr/*.abs abstr/
            echo 'finished abstr/'
        else
            echo 'abstr/ already exist. Remove old directory.'
        fi
    fi

    if [[ $* == *vct* ]]; then
        if [ ! -f mml.vct ]; then
            mv temp/mml.vct mml.vct
            echo 'finished mml.vct'
        else
            echo 'mml.vct already exist. Remove old file.'
        fi
    fi

    if [[ $* == *ini* ]]; then
        if [ ! -f mml.ini ] ; then
            mv temp/mml.ini mml.ini
            echo 'finished mml.ini'
        else
            echo 'mml.ini already exist. Remove old file.'
        fi
    fi

    if [[ $* == *lar* ]]; then
        if [ ! -f mml.lar ]; then
            mv temp/mml.lar mml.lar
            echo 'finished mml.lar'
        else
            echo 'mml.vct already exist. Remove old file.'
        fi
    fi
    rm -r temp
fi
