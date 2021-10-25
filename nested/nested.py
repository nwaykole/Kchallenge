def findkey(dit, b):
    for key,value in dit.items():
        #print(key) # trying to print key
        b1 = b.split('/')
        #print(b1) #test
        if key == b1[0]:
            #print('inside if')
            for k, v in value.items():
                if k == b1[1]:
                    for k1, v1 in v.items():
                        if k1 == b1[2]:
                            return (v1)

z='x/y/z'
#d = {"a":{"b":{"c":"d"}}}
d = {"x":{"y":{"z":"A"}}}
c = findkey(d,z)
print(c)
