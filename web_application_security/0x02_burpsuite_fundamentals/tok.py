tokens = open("tokens.txt").read().splitlines()

values = []

for t in tokens:
    last12 = t[-12:]          # yalnız son 12 digit
    values.append(int(last12, 16))  # hex → int

values.sort()

for i in range(len(values) - 1):
    if values[i + 1] != values[i] + 1:
        skipped = values[i] + 1
        print("SKIPPED LAST 12:", hex(skipped)[2:].zfill(12))

