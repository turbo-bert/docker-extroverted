import subprocess

line_number = 1


with open("/work/httpp.hosts", "w") as empty_the_file:
    pass

p = subprocess.Popen(['/usr/bin/tinyproxy','-d'], stdout=subprocess.PIPE)

for line in p.stdout:
    u_line = line.decode()
    print("%d %s" % (line_number, u_line))

    with open("/work/httpp.hosts", "a") as f:
        f.write("%s\n" % u_line)
    
    line_number+=1
