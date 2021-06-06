echo Compressing abstr/
tar -I pbzip2 -cf abstr.tar.gz abstr

echo Compressing fmbibs/
tar -I pbzip2 -cf fmbibs.tar.gz fmbibs

echo Compressing html/
tar -I pbzip2 -cf html.tar.gz html

echo Compressing mml/
tar -I pbzip2 -cf mml.tar.gz mml