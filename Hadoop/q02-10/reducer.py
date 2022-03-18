import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
purpose_1={}

for line in sys.stdin:
  line = line.strip()
  purpose = line.split('\t')[0]
  amount = line.split('\t')[1]
  amount=int(amount)

  if purpose in purpose_1.keys():
    purpose_1[purpose].append(amount)
  else:
    purpose_1[purpose]=[]
    purpose_1[purpose].append(amount)

for purpose in purpose_1.keys():
  max_value = max(purpose_1[purpose])
  sys.stdout.write("{}\t{}\n".format(purpose, max_value))