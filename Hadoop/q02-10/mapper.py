import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
import sys

for row in sys.stdin:
  lista = row.split(',')
  purpose = lista[3]
  amount = lista[4]
    
  sys.stdout.write(purpose + '\t' + amount +'\n')