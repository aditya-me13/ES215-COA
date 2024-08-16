#include <iostream>
#include <vector>
#include <ctime>

using namespace std;

void matrix_multiply_double(int N) {
    vector<vector<double> > A(N, vector<double>(N, 1.0));
    vector<vector<double> > B(N, vector<double>(N, 1.0));
    vector<vector<double> > C(N, vector<double>(N, 0.0));

    clock_t start = clock();

    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            for (int k = 0; k < N; ++k) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }

    clock_t end = clock();
    double diff = static_cast<double>(end - start) / CLOCKS_PER_SEC;
    cout << "Time taken by double matrix multiplication: " << diff << " seconds" << endl;
}

int main() {    
    matrix_multiply_double(1024); // Hard Code N here in  [64, 128, 256, 512, 1024]
    return 0;
}
