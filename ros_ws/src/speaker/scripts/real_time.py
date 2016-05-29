#!/usr/bin/env python
#-*- coding:utf-8 -*-
__author__ = 'daniel'
import roslib; roslib.load_manifest('speaker')
import rospy
from speaker.msg import record
from std_msgs.msg import String
import traceback
import numpy as np
import sys
from rospy_tutorials.msg import Floats
from rospy.numpy_msg import numpy_msg

sys.path.append('../my_speaker/gui/')
sys.path.append('../my_speaker/')

from utils import read_wav, write_wav, time_str, monophonic
from interface import ModelInterface


class RealTime():
	
	NODE_NAME = 'predict'
	INPUT_MODEL = '../my_speaker/new_model.out'
	NAMES = {'0':'None','1':'eyob','2':'naty','3':'wessi'}
	BG = "../my_speaker/bg2.wav"
	FS = 8000
	def __init__(self):
		
		self.backend = ModelInterface.load(self.INPUT_MODEL)
		try:
		    fs, signal = read_wav(self.BG)
		    self.backend.init_noise(fs, signal)
		except:
		    print "file not found!"
		self.pub  = rospy.Publisher('/speaker',String,queue_size = 10)
		self.sub  = rospy.Subscriber('/wav',numpy_msg(Floats),self.task_predict)


	def task_predict(self,frames): 
	   
	    #backend = ModelInterface.load(input_model)
	    signal  = np.array(frames.data,dtype = np.int16)
	    print "length: ",len(signal)
	    label = None	 
	    try:
		 signal = self.backend.filter(self.FS, signal)
		 #print signal ,len(signal)
		 if signal.shape[0] > 50:
			print "predicting"
		        label = self.backend.predict(self.FS, signal)
			if label is None:
	    			self.pub.publish(self.NAMES['0'])
			else:
				print self.NAMES[label]
				self.pub.publish(self.NAMES[label])	
	    except Exception as e:
		    print traceback.format_exc()
		    print str(e)
	    print '->', label  


if __name__ == '__main__':
	rospy.init_node(RealTime.NODE_NAME, anonymous=False)
	RealTime()
	try:
		rospy.spin()
	except KeyboardInterrupt:
		rospy.loginfo("Stopping " +NODE_NAME)


