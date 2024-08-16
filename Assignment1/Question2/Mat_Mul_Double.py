import time
import numpy as np

def matrix_multiply_double(N):
    A = np.ones((N, N), dtype=float)
    B = np.ones((N, N), dtype=float)
    C = np.zeros((N, N), dtype=float)

    start = time.time()

    for i in range(N):
        for j in range(N):
            for k in range(N):
                C[i][j] += A[i][k] * B[k][j]

    end = time.time()

    print(f"Time taken for N={N} (double): {end - start:.6f} s")

if __name__ == "__main__":
    matrix_multiply_double(1024) # Hard Code N here for sizes = [64, 128, 256, 512, 1024]
