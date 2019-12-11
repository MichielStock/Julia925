import numpy as np

def gradient_descent(P, q, x0, alpha=0.1,
                maxiter=1000, epsilon=1e-5):
    x = np.copy(x0)
    grad_x = P.dot(x) + q
    iter = 0
    while np.linalg.norm(grad_x) > epsilon or\
               iter <= maxiter:
        iter += 1
        x -= alpha * grad_x
        grad_x[:] = P.dot(x) + q
    return x

P = np.array([[10, -1],
              [-1, 1]])
q = np.array([[0], [-10]])
x0 = np.zeros((2, 1))

gradient_descent(P, q, x0)
