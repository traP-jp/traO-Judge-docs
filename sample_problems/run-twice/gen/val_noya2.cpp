#include"../etc/testlib.h"
#include <iostream>

const int Nmin = 2;
const int Nmax = 1'000;

int main(){
    registerValidation();

    int N = inf.readInt(Nmin, Nmax);
    inf.readEoln();
    std::vector<int> p(N);
    for (int i = 1; i <= N; i++){
        if (i != 1){
            inf.readSpace();
        }
        p[i-1] = inf.readInt(1, N);
    }
    inf.readEoln();
    std::sort(p.begin(), p.end());

    for (int i = 1; i <= N; i++){
        inf.ensuref(p[i-1] == i, "P is permutation");
    }

    inf.readEof();
}