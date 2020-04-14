import sys
import pygame as py
import os
import time
import requests
from requests.auth import HTTPDigestAuth


auth = HTTPDigestAuth('admin','RosUsr1!')

py.init()
py.joystick.init()

if not py.joystick.get_init():
	print("Error initializing controller, exiting.")
	exit()

j = py.joystick.Joystick(0)
j.init()

#axes 3 horizontal (-1 - 1), 2 vertical (0 - 1)

while True:
	for event in py.event.get():
		#print("#####################")
		#for i in range(axes):
		#	if event.type == py.JOYBUTTONDOWN:
		#		print("Button: " + str(i) + " " + str(j.get_button(i)))
		#print("#####################")

		#if event.type == py.JOYAXISMOTION:
		if j.get_axis(3) < -0.2:
			requests.get('http://192.168.131.108/cgi-bin/ptz.cgi?action=start&channel=1&code=Left&arg1=0&arg2=6&arg3=0',auth=auth)
			time.sleep(0.2)
			requests.get('http://192.168.131.108/cgi-bin/ptz.cgi?action=stop&channel=1&code=Left&arg1=0&arg2=6&arg3=0',auth=auth)
		if j.get_axis(3) > 0.2:
			requests.get('http://192.168.131.108/cgi-bin/ptz.cgi?action=start&channel=1&code=Right&arg1=0&arg2=6&arg3=0',auth=auth)
			time.sleep(0.2)
			requests.get('http://192.168.131.108/cgi-bin/ptz.cgi?action=stop&channel=1&code=Right&arg1=0&arg2=6&arg3=0',auth=auth)
		if j.get_axis(2) > 0.80:
			requests.get('http://192.168.131.108/cgi-bin/ptz.cgi?action=start&channel=1&code=Up&arg1=0&arg2=6&arg3=0',auth=auth)
			time.sleep(0.1)
			requests.get('http://192.168.131.108/cgi-bin/ptz.cgi?action=stop&channel=1&code=Up&arg1=0&arg2=6&arg3=0',auth=auth)
		if j.get_axis(2) < 0.3:
			requests.get('http://192.168.131.108/cgi-bin/ptz.cgi?action=start&channel=1&code=Down&arg1=0&arg2=6&arg3=0',auth=auth)
			time.sleep(0.1)
			requests.get('http://192.168.131.108/cgi-bin/ptz.cgi?action=stop&channel=1&code=Down&arg1=0&arg2=6&arg3=0',auth=auth)
		py.event.clear()
