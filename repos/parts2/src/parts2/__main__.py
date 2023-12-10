import subprocess
import os.path


if os.path.isfile('main.scad'):
    print("found")
    subprocess.check_call("openscad -o build.scad.stl build.scad", shell=True, universal_newlines=True)

for m in range(2,100):
    print(m)
