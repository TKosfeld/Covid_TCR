import pandas as pd
import glob

def intersection(lst1, lst2): 
        return list(set(lst1) & set(lst2)) 

#names = glob.glob("*.tsv")
df = pd.read_csv("Covid_Data.csv")
nums = []
samples = df.sample_name.to_list()
for i in range(len(samples)):
    samples[i] = samples[i] + '.tsv'
#print(names)
print(samples)

for sample in samples:
    num_lines = sum(1 for line in open(sample)) - 1
    nums.append(num_lines)
with open('Capstone_numbers.csv', 'w') as filehandle:
        for i in range(len(nums)):
                    filehandle.write(samples[i] + ', ' + str(nums[i]) + '\n')
print(nums)
print(len(nums), len(samples))
#print(intersection(samples, names)) 
