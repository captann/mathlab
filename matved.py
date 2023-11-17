def find_Bm(Ub):
    return Ub * 1.16

Ub_v1 =[0.76, 3.61, 13, 73.5, 266, 620, 718, 762, 780]
Hm_v1 = [25, 100, 250, 500, 1000, 2000, 2800, 3500, 3900]
Bm_v1 = [find_Bm(Ub_v1[i])for i in range(len(Ub_v1))]
print(Bm_v1)

for i in range(len(Ub_v1)):
    print(find_Bm(Ub_v1[i]), find_Bm(Ub_v1[i]) / Hm_v1[i])