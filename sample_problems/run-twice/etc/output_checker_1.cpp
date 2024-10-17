#include "testlib.h"

using namespace std;


const int Nmin = 2;
const int Nmax = 1'000;

int main(int argc, char *argv[]) {
    setName("compare sequences of tokens");
    registerTestlibCmd(argc, argv);

    int N = inf.readInt(Nmin, Nmax);
    vector<int> P = inf.readIntegers(N);
    string s = ouf.readToken("first");
    ensure(s == "first");
    vector<int> Q = ouf.readIntegers(N);
    for (int i = 0; i < N; i++){
        if (P[i] == Q[i]){
            quitf(_wa, "Wrong Answer: P[i] != Q[i] must be hold");
        }
    }
    cout << N << endl;
    for (int i = 0; i < N; i++){
        if (i != 0){
            cout << ' ';
        }
        cout << Q[i];
    }
    cout << endl;

    if (ouf.seekEof()) {
        quitf(_ok, "first run ok");
    } else {
        quitf(_wa, "Participant output contains extra tokens");
    }
}
