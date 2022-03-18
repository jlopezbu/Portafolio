import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

  curkey = None
  total = 0

for line in sys.stdin:
  key, val = line.strip('\n').split(',')
  curkey = key
  total = val
  sys.stdout.write('{},{}\n'.format(total, curkey))