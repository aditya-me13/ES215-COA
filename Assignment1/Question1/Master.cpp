#include <iostream>
#include <vector>
#include <ctime>
using namespace std;

// 1. Fibonacci using Recursion
long long fibonacci_recursive(int n) {
    if (n <= 1) return n;
    return fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2);
}

void run_fibonacci_recursive() {
    for (int i = 0; i < 50; i++) {
        cout << i+1 << ": " << fibonacci_recursive(i) << endl;
    }
    cout << endl;
}

// 2. Fibonacci using Loop
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

// 3. Fibonacci using Recursion with Memoization
vector<long long> memo(50, -1);

long long fibonacci_recursive_memo(int n) {
    if (memo[n] != -1) return memo[n];
    if (n <= 1) return n;
    memo[n] = fibonacci_recursive_memo(n - 1) + fibonacci_recursive_memo(n - 2);
    return memo[n];
}

void run_fibonacci_recursive_memo() {
    for (int i = 0; i < 50; i++) {
        cout << i+1 << ": " << fibonacci_recursive_memo(i) << endl;
    }
    cout << endl;
}

// 4. Fibonacci using Loop with Memoization
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

// Measure speedup
void measure_speedup() {
    struct timespec start, end;

    // 1. Recursion
    clock_gettime(CLOCK_MONOTONIC, &start);
    run_fibonacci_recursive();
    clock_gettime(CLOCK_MONOTONIC, &end);
    double time_recursion = (end.tv_sec - start.tv_sec) * 1e9 + (end.tv_nsec - start.tv_nsec);
    cout << "Time taken by recursion: " << time_recursion * 1e-9 << " seconds" << endl;

    // 2. Loop
    clock_gettime(CLOCK_MONOTONIC, &start);
    run_fibonacci_loop();
    clock_gettime(CLOCK_MONOTONIC, &end);
    double time_loop = (end.tv_sec - start.tv_sec) * 1e9 + (end.tv_nsec - start.tv_nsec);
    cout << "Time taken by loop: " << time_loop * 1e-9 << " seconds" << endl;

    // 3. Recursion with Memoization
    memo.assign(50, -1); // reset memoization array
    clock_gettime(CLOCK_MONOTONIC, &start);
    run_fibonacci_recursive_memo();
    clock_gettime(CLOCK_MONOTONIC, &end);
    double time_recursive_memo = (end.tv_sec - start.tv_sec) * 1e9 + (end.tv_nsec - start.tv_nsec);
    cout << "Time taken by recursion with memoization: " << time_recursive_memo * 1e-9 << " seconds" << endl;

    // 4. Loop with Memoization
    clock_gettime(CLOCK_MONOTONIC, &start);
    run_fibonacci_loop_memo();
    clock_gettime(CLOCK_MONOTONIC, &end);
    double time_loop_memo = (end.tv_sec - start.tv_sec) * 1e9 + (end.tv_nsec - start.tv_nsec);
    cout << "Time taken by loop with memoization: " << time_loop_memo * 1e-9 << " seconds" << endl;

    // Calculate and print speedups
    cout << "Speedup (Loop / Recursion): " << time_recursion / time_loop << endl;
    cout << "Speedup (Recursion + Memoization / Recursion): " << time_recursion / time_recursive_memo << endl;
    cout << "Speedup (Loop + Memoization / Recursion): " << time_recursion / time_loop_memo << endl;
}

int main() {
    measure_speedup();
    return 0;
}
