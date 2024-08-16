#include <iostream>
#include <vector>
#include <ctime>
using namespace std;
void run_fibonacci_loop_memo() {
    vector<long long> fib(50);
    fib[0] = 0;
    fib[1] = 1;
    for (int i = 2; i < 50; i++) {
        fib[i] = fib[i - 1] + fib[i - 2];
    }
    for (int i = 0; i < 50; i++) {
        cout << i+1 << ": " << fib[i] << endl;
    }
    cout << endl;
}

int main() {
    struct timespec start, end;
    clock_gettime(CLOCK_MONOTONIC, &start);
    run_fibonacci_loop_memo();
    clock_gettime(CLOCK_MONOTONIC, &end);
    double time_taken = (end.tv_sec - start.tv_sec) * 1e9;
    time_taken = (time_taken + (end.tv_nsec - start.tv_nsec)) * 1e-9;
    cout << "Time taken by loop with memoization: " << time_taken << " seconds" << endl;
    return 0;
}
