## About

This is a [Speaker Recognition](https://en.wikipedia.org/wiki/Speaker_recognition) 
project adapted from "TODO"
## Dependencies

+ [SciPy](http://www.scipy.org/)
+ [scikit-learn](http://scikit-learn.org/)
+ [scikits.talkbox](http://scikits.appspot.com/talkbox)
+ [pyssp](https://pypi.python.org/pypi/pyssp)
+ [PyQt](http://sourceforge.net/projects/pyqt/)
+ [PyAudio](http://people.csail.mit.edu/hubert/pyaudio/)
+ (Optional)[bob](http://idiap.github.io/bob/).

## Installation / Compilation

### (Optional) Bob:

See [here](https://github.com/idiap/bob/wiki/Packages) for instructions on bob core library installation.

Bob python bindings are available on [PyPI](https://pypi.python.org/pypi).
You may need to install bob packages in the following order:
+ bob.extension
+ bob.blitz (require blitz++)
+ bob.core
+ bob.sp
+ bob.ap

Note: We also have MFCC feature implemented on our own,
which will be used as a fallback when bob is unavailable.
But it's not so efficient as the C implementation in bob.

### (Optional) GMM

Run `make -C src/gmm` to compile our fast gmm implementation. Require gcc >= 4.7.

It will be used as default, if successfully compiled.

## Algorithms Used

_Voice Activity Detection_(VAD):
+ [Long-Term Spectral Divergence](http://www.sciencedirect.com/science/article/pii/S0167639303001201) (LTSD)

_Feature_:
+ [Mel-Frequency Cepstral Coefficient](http://en.wikipedia.org/wiki/Mel-frequency_cepstrum) (MFCC)
+ [Linear Predictive Coding](http://en.wikipedia.org/wiki/Linear_predictive_coding) (LPC)

_Model_:
+ [Gaussian Mixture Model](http://en.wikipedia.org/wiki/Mixture_model#Gaussian_mixture_model) (GMM)
+ [Universal Background Model](http://www.sciencedirect.com/science/article/pii/S1051200499903615) (UBM)
+ Continuous [Restricted Boltzman Machine](https://en.wikipedia.org/wiki/Restricted_Boltzmann_machine) (CRBM)
+ [Joint Factor Analysis](http://speech.fit.vutbr.cz/software/joint-factor-analysis-matlab-demo) (JFA)

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


