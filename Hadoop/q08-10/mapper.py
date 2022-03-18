import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
for row in sys.stdin:
  lista = row.strip('\n').split('   ')
  letra = lista[0]
  valor = lista[2]
    
  sys.stdout.write(letra + '\t' + valor +'\n')