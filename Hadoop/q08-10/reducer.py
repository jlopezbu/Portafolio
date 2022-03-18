import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
from statistics import mean

letra_1={}

for line in sys.stdin:
  line = line.strip()
  letra = line.split('\t')[0]
  valor = line.split('\t')[1]
  valor=float(valor)

  if letra in letra_1.keys():
    letra_1[letra].append(valor)
  else:
    letra_1[letra]=[]
    letra_1[letra].append(valor)

for letra in letra_1.keys():
  suma = sum(letra_1[letra])
  promedio = mean(letra_1[letra])
  sys.stdout.write("{}\t{}\t{}\n".format(letra, suma, promedio))