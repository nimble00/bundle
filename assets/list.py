####################################################
# BE CAREFUL WITH THIS SCRIPT!                       #
# IF RAN AGAIN, IT CAN DELETE ALL PRODUCTS!        #
####################################################

import shutil
import os

source = '/Users/nimble00/Documents/codes/sahil/products/snd'
destination = '/path/to/list_folder'

# files = os.listdir(source)
# files = os.listdir(".")

for f in files:
    if f.endswith(".png"):
        arr = f.split("-")
        # print("filename: ", f)
        try:
            if f=='list.py':
                continue
            elif arr[-2]=='0':
                # print("filename: ", f)
                os.rename(f," ".join(arr[:-2]) + '.png')
            elif arr[-1].startswith("20"):
                os.rename(f," ".join(arr[:-1]) + '.png')
            else:
                os.remove(f)
        except Exception as e:
            os.remove(f)
    if f.endswith(".jpg"):
        arr = f.split("-")
        # print("filename: ", f)
        try:
            if f=='list.py':
                continue
            elif arr[-2]=='0':
                # print("filename: ", f)
                os.rename(f," ".join(arr[:-2]) + '.jpg')
            elif arr[-1].startswith("20"):
                os.rename(f," ".join(arr[:-1]) + '.jpg')
            else:
                os.remove(f)
        except Exception as e:
            os.remove(f)
    if f.endswith(".jpeg"):
        arr = f.split("-")
        # print("filename: ", f)
        try:
            if f=='list.py':
                continue
            elif arr[-2]=='0':
                # print("filename: ", f)
                os.rename(f," ".join(arr[:-2]) + '.jpeg')
            elif arr[-1].startswith("20"):
                os.rename(f," ".join(arr[:-1]) + '.jpeg')
            else:
                os.remove(f)
        except Exception as e:
            os.remove(f)
        