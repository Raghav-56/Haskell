#include <iostream>
using namespace std;

int fact(int n) {
    if (n == 0) 
        return 1;
    else
        return n * fact(n - 1);
}

int main() {
    int a;
    cout<<"Enter number: "<<endl;
    cin>>a;
    cout<<fact(a)<<endl;
    return 0;
}