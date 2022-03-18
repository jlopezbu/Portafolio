import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
for line in sys.stdin:
  lista = line.strip('\n').split(',')
  letra = lista[0]
  numero = lista[1]
    
  sys.stdout.write('{},{}\n'.format(numero, letra))