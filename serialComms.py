import serial;
from time import sleep;

port = "/dev/tty.usbmodem641"
ser = serial.Serial(port, 115200, timeout=0)
BPM =0

def loop():
	reading = readSerial()


def readSerial():
    data = ser.read(9999)
    if len(data) > 0:
        parseData(data)

def parseData(someData):
	someData = someData.strip()
	lines = someData.splitlines()
	for someLine in lines:
		if(len(someLine)):
			prefix = someLine[0]
			postfix = someLine[1:len(someLine)]
			if(prefix == 'B'):
				bpm = int(postfix)
				print 'new BPM: ' + postfix

while True:
	loop()
