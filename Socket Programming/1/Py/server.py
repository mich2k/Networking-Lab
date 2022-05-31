#!/usr/bin/env python3

import sys
import time
import socket

HOST = '127.0.0.1'
PORT = int(sys.argv[1])

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    connection,client_addr = s.accept() # python permette di tornare più valori
    with connection as c:
        print(f'connection from {client_addr}')
        data = c.recv(1024) #max 1024 byte
        print('Here is the message: %s'% data.decode('utf-8'));
        c.sendall('I got your message'.encode('utf-8'))
        time.sleep(1)


#   python3 server.py 1025
#   python3 client.py 127.0.0.1 1025