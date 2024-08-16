#include <iostream>
#include <ctime>
using namespace std;

long long fibonacci_recursive(int n) {
    if (n <= 1) return (long long)n;
    return fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2);
}
void run_fibonacci_recursive() {
    for (int i = 0; i < 50; i++) {
        cout << i+1 << ": " << fibonacci_recursive(i) << endl;
    }
    cout << endl;
}
int main() {
    struct timespec start, end;
    cout << "Fibonacci Recursive Program" << endl;
    clock_gettime(CLOCK_MONOTONIC, &start);
    run_fibonacci_recursive();
    clock_gettime(CLOCK_MONOTONIC, &end);
    double time_taken = (end.tv_sec - start.tv_sec) * 1e9;
    time_taken = (time_taken + (end.tv_nsec - start.tv_nsec)) * 1e-9;
    cout << "Time taken by recursion: " << time_taken << " seconds" << endl;
    return 0;
}
