#include <iostream>
#include <ctime>
using namespace std;

long long fibonacci_loop(int n) {
    if (n <= 1) return (long long)n;
    long long a = 0, b = 1, next;
    for (int i = 0; i < n; i++) {
            next = a + b;
            a = b;
            b = next;
    }
    return next;
}

void run_fibonacci_loop() {
    for(int i=0; i<50; i++) {
        cout << i+1 << ": " << fibonacci_loop(i) << endl;
    }
}

int main() {
    struct timespec start, end;
    cout << "Fibonacci Loop Program" << endl;
    clock_gettime(CLOCK_MONOTONIC, &start);
    run_fibonacci_loop();
    clock_gettime(CLOCK_MONOTONIC, &end);
    double time_taken = (end.tv_sec - start.tv_sec) * 1e9;
    time_taken = (time_taken + (end.tv_nsec - start.tv_nsec)) * 1e-9;
    cout << "Time taken by loop: " << time_taken << " seconds" << endl;
    return 0;
}
