import time
import numpy as np

def matrix_multiply_int(N):
    A = np.ones((N, N), dtype=int)
    B = np.ones((N, N), dtype=int)
    C = np.zeros((N, N), dtype=int)

    start = time.time()

    for i in range(N):
        for j in range(N):
            for k in range(N):
                C[i][j] += A[i][k] * B[k][j]

    end = time.time()

    print(f"Time taken for N={N} (int): {end - start:.6f} s")

if __name__ == "__main__":
    matrix_multiply_int(1024) # Hardcode N here in sizes = [64, 128, 256, 512, 1024]
