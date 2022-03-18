import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
for row in sys.stdin:
  tabla = row.split('\t')
  letra = tabla[0][0]
  sys.stdout.write(letra + '\t1\n')