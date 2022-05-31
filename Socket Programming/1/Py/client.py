#!/usr/bin/env python3

import sys
import socket

HOST = sys.argv[1]
PORT = int(sys.argv[2])

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST,PORT))
    msg = input("enter msg: ")
    s.sendall(msg.encode('utf-8'))
    data=s.recv(1024)
    s.close()
print(f"received: {data.decode('utf-8')}")
