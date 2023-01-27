unset PATH

for p in $baseInputs; do
    export PATH=$p/bin${PATH:+:}$PATH
done

mkdir $out 

ghc -o $out/simple $src