#!/usr/bin/env python
#-*- coding:utf-8 -*-


import rospy
from std_msgs.msg import Float32
from rospy_tutorials.msg import Floats
import numpy as np
from rospy.numpy_msg import numpy_msg
rospy.init_node('random')
def plot(data):
	 signal  = np.array(data.data,dtype = np.int16)
	 for i in signal:
		pub.publish(float(i))
		


pub  = rospy.Publisher('/rand',Float32,queue_size = 1)
sub  = rospy.Subscriber('/wav',numpy_msg(Floats),plot)

try:
        rospy.spin()
except KeyboardInterrupt:
        rospy.loginfo("Stopping ")
