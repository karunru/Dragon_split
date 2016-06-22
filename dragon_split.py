import numpy as np
import matplotlib.pyplot as plt
import wave
import glob
import time

files = glob.glob('./DragonEnglish_wav/*')

for i in range(0,99):
    time.sleep(3)

    wf = wave.open(files[i], "r")

    buf = wf.readframes(wf.getnframes())
    data = np.frombuffer(buf, dtype="int16")
    
    data.flags.writeable = True

    for j in data:
        if data[j] < 100 and data[j] > -100:
            data[j] = 0

    plt.plot(data)
    plt.show()
    break
