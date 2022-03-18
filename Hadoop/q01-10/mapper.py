import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
for row in sys.stdin:
  lista = row.split(',')
  credit_history = lista[2]
  sys.stdout.write(credit_history + '\t1\n')