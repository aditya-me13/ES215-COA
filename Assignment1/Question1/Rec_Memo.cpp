#include <iostream>
#include <vector>
#include <ctime>
using namespace std;


long long fibonacci_recursive_memo(int n, vector<long long>& memo) {
    if (memo[n] != -1) return memo[n];
    if (n <= 1) return n;
    memo[n] = fibonacci_recursive_memo(n - 1, memo) + fibonacci_recursive_memo(n - 2, memo);
    return memo[n];
}
void run_fibonacci_recursive_memo() {
    vector<long long> memo(50, -1);
    for (int i = 0; i < 50; i++) {
        cout << i+1 << ": " << fibonacci_recursive_memo(i, memo) << endl;
    }
    cout << endl;
}
int main() {
    struct timespec start, end;
    clock_gettime(CLOCK_MONOTONIC, &start);    
    run_fibonacci_recursive_memo();
    clock_gettime(CLOCK_MONOTONIC, &end);
    double time_taken = (end.tv_sec - start.tv_sec) * 1e9;
    time_taken = (time_taken + (end.tv_nsec - start.tv_nsec)) * 1e-9;
    cout << "Time taken by recursion with memoization: " << time_taken << " seconds" << endl;
    return 0;
}
