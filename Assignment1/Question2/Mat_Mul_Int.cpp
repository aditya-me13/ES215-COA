#include <iostream>
#include <vector>
#include <ctime>
using namespace std;

void matrix_multiply_int(int N) {
    vector<vector<int> > A(N, vector<int>(N, 1));
    vector<vector<int> > B(N, vector<int>(N, 1));
    vector<vector<int> > C(N, vector<int>(N, 0));

    clock_t start = clock();

    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            for (int k = 0; k < N; ++k) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }

    clock_t end = clock();
    double diff = double(end - start) / CLOCKS_PER_SEC;

    cout << "Time taken for N=" << N << " (int): " << diff << " s\n";
}

int main() {
    matrix_multiply_int(1024); // Hardcode N here for [64, 128, 256, 512, 1024]
    return 0;
}
