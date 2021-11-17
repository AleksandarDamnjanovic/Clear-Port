#!/usr/bin/env python3
import sys
import os
import string

args= sys.argv

if len(args)<2:
	print("You must provide port number to be released")
	exit()

command = f'fuser -k {args[1]}/tcp'
command1 = f'fuser -k {args[1]}/udp'
result= os.popen(command).read()
result1= os.popen(command1).read()

if result is '':
	print('There is no tcp process to be killed')
else:
	pid=result.split(':')
	pid=pid[0].strip()
	print(f'tcp process {pid} killed')

if result1 is '':
	print('There is no udp process to be killed')
else:
	pid=result1.split(':')
	pid=pid[0].strip()
	print(f'udp process {pid} killed')
print('Done')