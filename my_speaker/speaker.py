#!/usr/bin/env python2
# -*- coding: UTF-8 -*-
# File: speaker-recognition.py
# Date: Sun Feb 22 22:36:46 2015 +0800
# Author: Yuxin Wu <ppwwyyxxc@gmail.com>

import argparse
import sys
import glob
import os
import itertools
import scipy.io.wavfile as wavfile

sys.path.append(os.path.join(
    os.path.dirname(os.path.realpath(__file__)),
    'gui'))
from gui.interface import ModelInterface
from gui.utils import read_wav
from filters.silence import remove_silence

#def get_args():
#    desc = "Speaker Recognition Command Line Tool"
#    epilog = """
#Wav files in each input directory will be labeled as the basename of the directory.
#Note that wildcard inputs should be *quoted*, and they will be sent to glob.glob module.

#Examples:
#    Train (enroll a list of person named person*, and mary, with wav files under corresponding directories):
#    ./speaker-recognition.py -t enroll -i "/tmp/person* ./mary" -m model.out

#    Predict (predict the speaker of all wav files):
#    ./speaker-recognition.py -t predict -i "./*.wav" -m model.out
#"""
#    parser = argparse.ArgumentParser(description=desc,epilog=epilog,
#                                    formatter_class=argparse.RawDescriptionHelpFormatter)

#    parser.add_argument('-t', '--task',
#                       help='Task to do. Either "enroll" or "predict"',
#                       required=True)

#    parser.add_argument('-i', '--input',
#                       help='Input Files(to predict) or Directories(to enroll)',
#                       required=True)

#    parser.add_argument('-m', '--model',
#                       help='Model file to save(in enroll) or use(in predict)',
#                       required=True)

#    ret = parser.parse_args()
#    return ret

def task_enroll(output_model):
    m = ModelInterface()
    train_data  = range(1,4)
    for i in train_data:
	wav = "./data/train/"+str(i)+".wav"
	print wav
	label = str(i)
        fs, signal = read_wav(wav)
        m.enroll(label, fs, signal)
    m.train()
    m.dump(output_model)

def task_predict(input_model):
    m = ModelInterface.load(input_model)
    test_data  = range(1,4)
    for f in test_data:
	wav = "./data/test/"+str(f)+".wav"
	print wav 
        fs, signal = read_wav(wav)
        label = m.predict(fs, signal)
        print f, '->', label

if __name__ == '__main__':
    task_enroll("new_model.out")
    task_predict("new_model.out")
