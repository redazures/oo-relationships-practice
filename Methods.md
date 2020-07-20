pets=["dog", "dog","cat","bird","chinchilla","rat","hamster","dog","rat","bird","cat","giraffe","cat","dog","snake","hamster","mouse"]
x=pets
freq=x.inject(Hash.new(0)){|hashing,keys| hashing[keys]+=1; hashing} #This produces a hash with the 
# freq=x.inject(Hash.new(0)){|h,v| h[v]+=1; h}
name=x.max_by{|v|freq[v]}
namer=x.min_by{|v|freq[v]}
lowest_value=freq[namer]
new_pets=freq.delete_if{|k,v|v!=lowest_value}
new_pets.count
[5, 100].inject(0){|sum,x|sum+x} #this is a summary of an array I found on the internet