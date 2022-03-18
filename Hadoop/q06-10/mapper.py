import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
for row in sys.stdin:
  lista = row.split('\t')
  letra = lista[0][0:1]
  valor = lista[0][17:21]
    
  sys.stdout.write(letra + '\t' + valor +'\n')