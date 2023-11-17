class Matrix:
    def __init__(self, ls):

        self.matrix = ls
        self.height = len(ls)
        self.width = len(ls[0])

    def transpose(self):
        for i in range(self.height):
            for j in range(self.width):
                self.matrix[i][j] = self.matrix[j][i]

    def __mul__(self, other):
        multiResult = []
        for m in range(self.height):
            multiResult.append([0] * other.width)
            for n in range(other.width):
                for o in range(other.height):
                    multiResult[m][n] += self.matrix[m][o] * other.matrix[o][n]  # Storing multiplication
        return multiResult

    def adj_Matrix(self):
        U = self.zeros(self.height, self.width)
        for i in range(self.height):
            for j in range(self.width):
                U.matrix[i][j] = ((-1) ^ (i + j)) * self.minor(i, j)
        return U

    def minor(self, i, j):
        M = self.zeros(self.height - 1, self.width - 1)
        ha = 0
        hm = 0
        while (ha <= self.height):
            ha = ha + 1
            hm = hm + 1
            if (ha == i):
                ha = ha + 1
            if (ha > self.height):
                break
            la = 0
            lm = 0
            while (la <= self.width):
                la = la + 1
                lm = lm + 1
                if (la == j):
                    la = la + 1
                if (la > self.width):
                    break
                M.matrix[hm][lm] = self.matrix[ha][la]
        return M.det()

    def det(self):
        pass
        


    def zeros(self, m, n):
        s = [[0] for i in range(n)]
        r = [s for i in range(m)]
        return Matrix(r)




A = Matrix([[5, 4, 3],
            [2, 4, 6],
            [4, 7, 9]])
B = Matrix([[3, 2, 4], [4, 3, 6], [2, 7, 5]])
print(A * B)


def lab_01_gauss_seidel(A, b, x0, eps, kmax):
    ok = False
    x = x0
    return ok, x


A = [[1, -0.2589, 4],
     [-0.2589, 1, -0.2705],
     [-0.3093, -0.2705, 1]
     ]

b = [[1],
     [1],
     [1]]

x0 = [[0],
      [0],
      [0]]

ok, x = lab_01_gauss_seidel(A=A, b=b, x0=x0, eps=10e-6, kmax=1000)
