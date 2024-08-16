import matplotlib.pyplot as plt

# Data
data = {
    64: {
        'cpp_int_sys': 0.00, 'cpp_int_user': 0.01, 'cpp_int_total': 0.01, 'cpp_int_meat': 0.004382,
        'cpp_double_sys': 0.00, 'cpp_double_user': 0.01, 'cpp_double_total': 0.01, 'cpp_double_meat': 0.004735,
        'py_int_sys': 0.04, 'py_int_user': 0.77, 'py_int_total': 0.81, 'py_int_meat': 0.158992,
        'py_double_sys': 0.04, 'py_double_user': 0.77, 'py_double_total': 0.81, 'py_double_meat': 0.162897
    },
    128: {
        'cpp_int_sys': 0.00, 'cpp_int_user': 0.03, 'cpp_int_total': 0.03, 'cpp_int_meat': 0.028547,
        'cpp_double_sys': 0.00, 'cpp_double_user': 0.03, 'cpp_double_total': 0.03, 'cpp_double_meat': 0.029449,
        'py_int_sys': 0.04, 'py_int_user': 1.89, 'py_int_total': 1.94, 'py_int_meat': 1.258701,
        'py_double_sys': 0.04, 'py_double_user': 1.86, 'py_double_total': 1.90, 'py_double_meat': 1.342157
    },
    256: {
        'cpp_int_sys': 0.00, 'cpp_int_user': 0.13, 'cpp_int_total': 0.13, 'cpp_int_meat': 0.12096,
        'cpp_double_sys': 0.00, 'cpp_double_user': 0.13, 'cpp_double_total': 0.13, 'cpp_double_meat': 0.125460,
        'py_int_sys': 0.06, 'py_int_user': 10.97, 'py_int_total': 10.97, 'py_int_meat': 10.219732,
        'py_double_sys': 0.05, 'py_double_user': 10.98, 'py_double_total': 11.07, 'py_double_meat': 10.616071
    },
    512: {
        'cpp_int_sys': 0.00, 'cpp_int_user': 0.80, 'cpp_int_total': 0.80, 'cpp_int_meat': 0.764032,
        'cpp_double_sys': 0.00, 'cpp_double_user': 0.80, 'cpp_double_total': 0.80, 'cpp_double_meat': 0.780690,
        'py_int_sys': 0.22, 'py_int_user': 83.13, 'py_int_total': 83.37, 'py_int_meat': 82.434273,
        'py_double_sys': 0.24, 'py_double_user': 85.21, 'py_double_total': 85.21, 'py_double_meat': 84.046852
    },
    1024: {
        'cpp_int_sys': 0.01, 'cpp_int_user': 6.09, 'cpp_int_total': 6.10, 'cpp_int_meat': 6.06976,
        'cpp_double_sys': 0.01, 'cpp_double_user': 6.97, 'cpp_double_total': 6.98, 'cpp_double_meat': 6.924790,
        'py_int_sys': 2.39, 'py_int_user': 857.13, 'py_int_total': 859.94, 'py_int_meat': 859.870626,
        'py_double_sys': 4.12, 'py_double_user': 844.71, 'py_double_total': 868.96, 'py_double_meat': 858.567721
    }
}

# List of matrix sizes
N_values = [64, 128, 256, 512, 1024]

# Create plots for C++ Integer and Double
for N in N_values:
    plt.figure(figsize=(10, 6))
    plt.bar(['System (Int)', 'User (Int)', 'Total (Int)', 'Meat (Int)',
            'System (Double)', 'User (Double)', 'Total (Double)', 'Meat (Double)'],
            [
                data[N]['cpp_int_sys'], data[N]['cpp_int_user'], data[N]['cpp_int_total'], data[N]['cpp_int_meat'],
                data[N]['cpp_double_sys'], data[N]['cpp_double_user'], data[N]['cpp_double_total'], data[N]['cpp_double_meat']
            ],
            color=['blue', 'green', 'black', 'red'] * 2,
            edgecolor='black')
    plt.xlabel('Metrics')
    plt.ylabel('Time (s)')
    plt.title(f'C++ Time Metrics for N = {N}')
    plt.xticks(rotation=45)
    plt.grid(True, axis='y')
    plt.tight_layout()
    plt.show()

# Create plots for Python Integer and Double
for N in N_values:
    plt.figure(figsize=(10, 6))
    plt.bar(['System (Int)', 'User (Int)', 'Total (Int)', 'Meat (Int)',
            'System (Double)', 'User (Double)', 'Total (Double)', 'Meat (Double)'],
            [
                data[N]['py_int_sys'], data[N]['py_int_user'], data[N]['py_int_total'], data[N]['py_int_meat'],
                data[N]['py_double_sys'], data[N]['py_double_user'], data[N]['py_double_total'], data[N]['py_double_meat']
            ],
            color=['blue', 'green', 'black', 'red'] * 2,
            edgecolor='black')
    plt.xlabel('Metrics')
    plt.ylabel('Time (s)')
    plt.title(f'Python Time Metrics for N = {N}')
    plt.xticks(rotation=45)
    plt.grid(True, axis='y')
    plt.tight_layout()
    plt.show()
