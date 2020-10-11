import os

source = '/Users/nimble00/Documents/codes/Madira/assets/products/'
destination = '/path/to/list_folder'

files = os.listdir(source)

for f in files:
	arr = f.split(" ")
	f_ = "-".join(arr)
	os.rename(f,f_)
