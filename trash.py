N, M = map(int, input().split())

g = [[] for i in range(N)]
for i in range(M):
    u, v, l, p = input().split()
    u, v, l = map(int, [u, v, l])
    p = float(p)
    u -= 1
    v -= 1
    g[u].append([v, l, p])
    g[v].append([u, l, p])


mx_len = 0
mx_path = []
mx_prob = 0

def dfs(curr, path, curr_prob, curr_len):
    new_path = path + [curr]

    for next_v, length, prob in g[curr]:
        if next_v not in new_path:
            dfs(next_v, new_path, curr_prob * prob, curr_len + length)
        else:
            global mx_len, mx_prob, mx_path
            if len(new_path) > mx_len and curr_prob >= 0.5:
                mx_len = len(new_path)
                mx_prob = curr_prob
                mx_path = new_path.copy()
            if len(new_path) == mx_len and curr_prob >= 0.5:
                mx_prob = max(curr_prob, mx_prob)

for i in range(N):
    dfs(i, [], 1, 0)

print(*list(map(lambda x: int(x) + 1, mx_path)), mx_len, mx_prob)
