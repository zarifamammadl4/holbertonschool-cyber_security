import base64

cipher = base64.b64decode("Dz58FDUpaSo8EAoSEm4cPC1yBm85GzEVHg==")

key = b"_"

plain = bytes([b ^ key[0] for b in cipher])

print(plain.decode())

