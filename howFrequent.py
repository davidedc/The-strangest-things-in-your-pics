import re
import fileinput

inputLine = "".join(fileinput.input()).replace('\n', '')
splitInputLine = inputLine.rsplit(' ', 1)
token =  splitInputLine[1]

with open('count_1w.txt', 'r') as myfile:
    data=myfile.read()

matched_lines = [line for line in data.split('\n') if line.startswith(token + '\t')]
for x in matched_lines:
	print splitInputLine[0] + ' ' + x.replace('\t', ' , ')
