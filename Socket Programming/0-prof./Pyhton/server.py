#!/usr/bin/env python3
import socket
import sys
import time
HOST = '127.0.0.1' # Loopback interface address (localhost)
PORT = int(sys.argv[1]) # Port to listen
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
 s.bind((HOST, PORT))
 s.listen()
 conn, addr = s.accept() #conn is a socket object
 with conn:
    #print('Connected by', addr)
    data = conn.recv(1024)
    print('Here is the message: %s'% data.decode('utf-8'));
    conn.sendall('I got your message'.encode('utf-8'))
    # socket must be closed by client (otherwise TIME_WAIT)
    time.sleep(1)