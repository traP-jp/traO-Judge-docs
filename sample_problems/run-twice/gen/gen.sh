# すべての gen を動かして validation もする
# 使い方: gen/gen.sh

if ! [ -d etc ]; then
    echo "directory 'etc' doe's not exists."
    exit 1
fi
if ! [ -d gen ]; then
    echo "directory 'gen' doe's not exists."
    exit 1
fi
if ! [ -d in ]; then
    echo "directory 'in' doe's not exists."
    exit 1
fi
if ! [ -d out ]; then
    echo "directory 'out' doe's not exists."
    exit 1
fi
rm in/*
rm out/*
# cp gen/raw/* in
mkdir -p out
if ! g++ -std=c++2b -Wall -Wextra -O2 -o gen/gen gen/gen_noya2.cpp; then
    echo "compile failed."
    exit 1
fi
echo "generating input."
cd in
../gen/gen
cd ..
rm gen/gen
if ! g++ -std=c++2b -Wall -Wextra -O2 -o sol/a sol/ac_noya2.cpp; then
    echo "compile failed."
    exit 1
fi
echo "generating output."
for i in in/*; do
    echo $i
    time sol/a < $i > ${i/in/out}
done
rm sol/a
echo "validating..."
gen/val.sh
