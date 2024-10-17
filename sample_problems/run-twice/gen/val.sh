# 全員の validator を動かすスクリプト
# 使い方: gen/val.sh

if ! [ -d etc ]; then
    echo "directory 'etc' doe's not exists."
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
if ! g++ -std=c++2b -Wall -Wextra -O2 -o val gen/val_noya2.cpp; then
    echo "compile failed."
    exit 1
fi
for i in in/*; do
    echo $i
    if ! ./val < $i; then
        echo "validation failed : $i"
        rm val
        exit 1
    fi
done
rm val
for i in in/*; do
    if ! [ -f ${i/in/out} ]; then
        echo "extra input file : $i"
        exit 1
    fi
done
for i in out/*; do
    if ! [ -f ${i/out/in} ]; then
        echo "extra output file : $i"
        exit 1
    fi
done
echo "validated successfully."
