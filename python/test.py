a = {'a': 2, 'b': 2}

try:
	a['b']

except KeyError:
	print("Oops!")

else:
	print("WTF")