import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
for line in sys.stdin:
  line = line.strip()
  letra = line.split('   ')[0]
  fecha = line.split('   ')[1]
  valor = line.split('   ')[2]
  sys.stdout.write("{}\t{}\t{}\n".format(letra,fecha,valor))