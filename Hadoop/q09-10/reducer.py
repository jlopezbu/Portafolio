import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
minimo = []
orden = []
for line in sys.stdin:
  letra = line.split('\t')[0]
  fecha = line.split('\t')[1]
  valor = line.split('\t')[2]
  valor = int(valor)
  orden.append((letra,fecha,valor))
  orden.sort(key=lambda x: (x[2]))
  
for i in range(6):
  minimo.append(orden[i])
for letra,fecha,valor in minimo:
  sys.stdout.write("{}\t{}\t{}\n".format(letra,fecha,valor))