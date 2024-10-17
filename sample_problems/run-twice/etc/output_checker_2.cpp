#include "testlib.h"

using namespace std;


const int Nmin = 2;
const int Nmax = 1'000;

int main(int argc, char *argv[]) {
    setName("compare sequences of tokens");
    registerTestlibCmd(argc, argv);

    ouf.readToken("second");

    if (ouf.seekEof()) {
        quitf(_ok, "second run ok");
    } else {
        quitf(_wa, "Participant output contains extra tokens");
    }
}
