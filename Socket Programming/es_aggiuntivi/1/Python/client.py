#!/usr/bin/env python3
import socket
import sys
HOST = sys.argv[1]
PORT = 2525
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST, PORT))
    #msg = input('Please enter the message: ')
    #s.sendall(msg.encode('utf-8'))
    data = s.recv(1024)
    s.close()
print('server sent you: %s' % data.decode('utf-8'))
