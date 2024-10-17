#include "../etc/testlib.h"
#include <iostream>
#include <format>
#include <algorithm>
#include <numeric>
using namespace std;

const int Nmin = 2;
const int Nmax = 1'000;

struct testcase {
    int n;
    vector<int> p;
};


void output_testcase(ofstream &out, testcase test){
    out << test.n << '\n';
    for (int i = 0; i < test.n; i++){
        if (i != 0){
            out << ' ';
        }
        out << test.p[i];
    }
    out << '\n';
    out << flush;
}

// sample


vector<testcase> samples = 
{

};

void sample_input(){
    for (int t = 1; t <= 2; t++){
        ifstream in(std::format("../gen/raw/sample-{:02}.txt", t));
        int n; in >> n;
        vector<int> p(n);
        for (int i = 0; i < n; i++){
            in >> p[i];
        }
        samples.push_back(testcase{n,p});
    }
}

void sample_gen(){
	int t = 0;
	for (auto test : samples){
		t++;
		ofstream out(std::format("00-sample-{:03}.txt", t));
		output_testcase(out, test);
	}
}

// handmade


vector<testcase> handmades = 
{

};

void handmade_gen(){
	int t = 0;
	for (auto test : handmades){
		t++;
		ofstream out(std::format("01-handmade-{:03}.txt", t));
		output_testcase(out, test);
	}
}


void maxcase(int many = 3){
    while (many--){
        int n = Nmax;
        vector<int> p(n); iota(p.begin(), p.end(), 1);
        while (true){
            shuffle(p.begin(), p.end());
            bool ok = true;
            for (int i = 0; i < n; i++){
                if (p[i] == i+1){
                    ok = false;
                }
            }
            if (ok) break;
        }
        handmades.push_back(testcase{n, p});
    }
}


// random

vector<testcase> randomcases = {};

void random_gen(){
	int t = 0;
	for (auto test : randomcases){
		t++;
		ofstream out(std::format("02-random-{:03}.txt", t));
		output_testcase(out, test);
	}
}

void random_small(int many = 10){
    while (many--){
        int n = rnd.next(Nmin,20);
        vector<int> p(n); iota(p.begin(), p.end(), 1);
        while (true){
            shuffle(p.begin(), p.end());
            bool ok = true;
            for (int i = 0; i < n; i++){
                if (p[i] == i+1){
                    ok = false;
                }
            }
            if (ok) break;
        }
        randomcases.push_back(testcase{n, p});
    }
}

void random_large(int many = 10){
    while (many--){
        int n = rnd.next(21,Nmax);
        vector<int> p(n); iota(p.begin(), p.end(), 1);
        while (true){
            shuffle(p.begin(), p.end());
            bool ok = true;
            for (int i = 0; i < n; i++){
                if (p[i] == i+1){
                    ok = false;
                }
            }
            if (ok) break;
        }
        randomcases.push_back(testcase{n, p});
    }
}

int main(int argc, char** argv){
    registerGen(argc, argv, 0);

    // sample
    sample_input();
    sample_gen();

    // handmade
    maxcase();
    handmade_gen();

    // random
    random_small();
    random_large();
    random_gen();

    return 0;
}