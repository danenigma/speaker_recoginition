#!/usr/bin/env python
#-*- coding:utf-8 -*-
__author__ = 'daniel'

import roslib; roslib.load_manifest('speaker')
import rospy
import wave
import pyaudio
import sys
from rospy_tutorials.msg import Floats
from rospy.numpy_msg import numpy_msg
import numpy as np
import traceback
import os
from speaker.msg import record
class Recording():
	CHUNK = 1
	FORMAT = pyaudio.paInt16
	CHANNELS = 1
	#RATE = 44100
	FS = 8000
	RECORD_SECONDS = 1.5
	NODE_NAME = 'recorder'
	def __init__(self):
		self.p = pyaudio.PyAudio()
		self.stream = self.p.open(format=self.FORMAT,
			channels=self.CHANNELS,
			rate=self.FS,
			input=True,
			frames_per_buffer=self.CHUNK)
		self.rec_publisher = rospy.Publisher('/wav',numpy_msg(Floats),queue_size =20)
	def run(self):	
		"""  publish recording """
		print "* Recording audio..."
		rospy.init_node(self.NODE_NAME,anonymous=False)
		self.rate  = rospy.Rate(2.5)
		while not rospy.is_shutdown():
				frames = []
				for j in range(0, int(self.FS/self.CHUNK * self.RECORD_SECONDS)):
					data = self.stream.read(self.CHUNK)
					i = ord(data[0]) + 256 * ord(data[1])
					if i > 32768:
						i -= 65536
					frames.append(i)
				frames = np.array(frames,dtype=np.float32)
			    	self.rec_publisher.publish(frames)
				self.rate.sleep() 	
		self.stream.stop_stream()
		self.stream.close()
		self.p.terminate()

if __name__=="__main__":
	r = Recording()
	r.run()

