#include <iostream>
#include <vector>

int main(){
    int n; std::cin >> n;
    std::vector<int> p(n);
    for (int i = 0; i < n; i++){
        std::cin >> p[i];
    }

    bool first = true;
    for (int i = 0; i < n; i++){
        if (p[i] == i+1){
            first = false;
        }
    }
    if (first){
        std::cout << "first" << std::endl;
        std::vector<int> q(n);
        for (int i = 0; i < n; i++){
            q[i] = i+1;
        }
        for (int i = 0; i < n; i++){
            if (i != 0){
                std::cout << ' ';
            }
            std::cout << q[i];
        }
        std::cout << std::endl;
    }
    else {
        std::cout << "second" << std::endl;
    }
}