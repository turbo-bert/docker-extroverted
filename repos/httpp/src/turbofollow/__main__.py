import subprocess

line_number = 1


with open("/work/httpp.hosts", "w") as empty_the_file:
    pass

p = subprocess.Popen(['/usr/bin/tinyproxy','-d'], stdout=subprocess.PIPE)


target_info = {}

for line in p.stdout:
    u_line = line.decode().strip()
    if not u_line.startswith("INFO"):
        continue
    if u_line.find("opensock") < 0:
        continue
    if u_line.find("opening connection to") < 0:
        continue
    cols = u_line.split(" ")
    target = cols[-1]

    if target in target_info.keys():
        target_info[target]+=1
    else:
        target_info[target]=1
        with open("/work/httpp.hosts", "a") as f:
            f.write("%s\n" % target)

    print("%s - %d" % (target, target_info[target]))

    
    line_number+=1
