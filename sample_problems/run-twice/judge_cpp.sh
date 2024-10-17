# 手元で C++ の sol をジャッジします
# 使い方: judge_cpp.sh sol/ac_tatyam.cpp

name=${1/.cpp/}

if ! g++ -std=c++2b -Wall -Wextra -O2 -o $name $1; then
    echo "compile failed."
    exit 1
fi

if ! g++ -std=c++2b -Wall -Wextra -O2 -o checker1 etc/output_checker_1.cpp; then
    echo "checker1 compile failed."
    exit 1
fi

if ! g++ -std=c++2b -Wall -Wextra -O2 -o checker2 etc/output_checker_2.cpp; then
    echo "checker2 compile failed."
    exit 1
fi

for i in in/*; do
    echo $i
    time ./$name < $i > output.txt
    if ! ./checker1 $i output.txt ${i/in/out} > output2.txt; then
        continue
    fi
    time ./$name < output2.txt > output.txt
    ./checker2 $i output.txt ${i/in/out}
done

rm output.txt
rm output2.txt
rm $name
rm checker1
rm checker2
