## About
This is a [Speaker Recognition](https://en.wikipedia.org/wiki/Speaker_recognition) 
project adapted from [Speaker Recognition](https://github.com/ppwwyyxx/speaker-recognition.git) to work with ROS.
## Dependencies

+ [SciPy](http://www.scipy.org/)
+ [scikit-learn](http://scikit-learn.org/)
+ [scikits.talkbox](http://scikits.appspot.com/talkbox)
+ [pyssp](https://pypi.python.org/pypi/pyssp)
+ [PyQt](http://sourceforge.net/projects/pyqt/)
+ [PyAudio](http://people.csail.mit.edu/hubert/pyaudio/)
+ (Optional)[bob](http://idiap.github.io/bob/).

## Installation / Compilation

You should understand that real-time speaker recognition is extremely hard, because we only use corpus of about 1 second length to identify the speaker.
Therefore the real-time system doesn't work very perfect.
## Command Line Tools
```sh
usage: speaker-recognition.py [-h] -t TASK -i INPUT -m MODEL

Speaker Recognition Command Line Tool

optional arguments:
  -h, --help            show this help message and exit
  -t TASK, --task TASK  Task to do. Either "enroll" or "predict"
  -i INPUT, --input INPUT
                        Input Files(to predict) or Directories(to enroll)
  -m MODEL, --model MODEL
                        Model file to save(in enroll) or use(in predict)

Wav files in each input directory will be labeled as the basename of the directory.
Note that wildcard inputs should be *quoted*, and they will be sent to glob module.

Examples:
    Train:
    ./speaker-recognition.py -t enroll -i "./new_data/train/*" -m model.out
    Test:
    ./speaker-recognition.py -t predict -i "./new_data/test/*.wav" -m model.out

ROS
-there are 2 Nodes in this package.
	1.record :
		Continuously record voice and publish the audio as a numpy array on the topic /wav
	2.predict:
		subscribes to the topic /wav and if  voice activity is detected it tries to predict the speaker.
		publishes  on the topic /speaker the speaker it predicts
	
running ROS
	source ./ros_ws/devel/setup.bash
	roslaunch speaker speaker_reco.launch


