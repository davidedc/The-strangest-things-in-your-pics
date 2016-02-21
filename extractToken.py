import re
import fileinput



for line in fileinput.input():
	if "running on " in line:
		find = re.compile(r"running on (.*)")
		filename = re.search(find, line).group(1)

	if "(score" in line:
		find = re.compile(r"^[^ ,]*")
		print filename + ' , ' + re.search(find, line).group(0)
		break
