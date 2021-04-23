local b64 = require('base64')

print(b64.to_base64('M汉字an')) -- 'TWFu'
print(b64.to_base64('leasure.')) -- 'bGVhc3VyZS4='
print(b64.to_base64('pleasure.')) -- 'cGxlYXN1cmUu'

print(b64.from_base64('TeaxieWtl2Fu')) -- 'Man'
print(b64.from_base64('bGVhc3VyZS4=')) -- 'leasure.'
print(b64.from_base64('cGxlYXN1cmUu')) -- 'pleasure.'
