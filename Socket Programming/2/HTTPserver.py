#!/usr/bin/env python3

import socket
import os
from sqlite3 import connect
import sys
import time

HOST= '127.0.0.1'
PORT = 8081 # http alternative 8080
HTDOCS = './htdocs'
MIMETYPES = [
    ('.gif', '/image/gif'),
    ('.png', '/image/png'),
    ('.jpg', '/image/jpg'),
    ('.html', '/text/html')
]
def parse_request(conn):
    request=''
    while True:
        request +=conn.recv(1024).decode('utf-8')
        if request.find('\r\n\r\n') > 0:    # ha trovato un endline nella request line
            break
    reqline, headers = request.split('\r\n', 1) # separo la req line, con al max 1 divisore siccome ci interessa solo la prima riga
    method, url, version = reqline.split(' ', 3) # space come terminatore e 3 al max
    return url

def send_404(conn,url):
    body = f"""<html>
        <body> {url} not found </body></html>"""
    resp= 'HTTP/1.0 404 Not found\r\n' + \
        'Connection: close\r\n' + \
        'Content-Type: text/html\r\n' + \
        f'Content-Length: {len(body)}\r\n\r\n' + body  
    conn.sendall(resp.encode('utf-8'))
    time.sleep(1)   #in questo modo il client chiuderà la connessione


def get_mime(filename):
    mime='text/plain'   # di default è testo
    for ext, mimetype in MIMETYPES:
        if filename.endswith(ext):
            mime=mimetype
            break
    return mime


def send_200(conn,filename):
    header= 'HTTP/1.0 200 OK\r\n' + \
    'Connection: close\r\n' + \
    f'Content-Type: {get_mime(filename)}\r\n' + \
    f'Content-Length: {os.path.getsize(filename)}\r\n\r\n'
    conn.sendall(header.encode('utf-8'))
    with open(filename, 'rb') as f:
        buf=f.read(1024)
        while(buf):
            conn.send(buf)
            buf=f.read(1024)
        time.sleep(1)
    

def send_response(conn,url):    # cerca il file mappando l url sul file system
    doc_root=HTDOCS
    filename= doc_root + url
    if  not os.path.sys(filename): # se il file non esiste
        print(f'file {url} not found.')
        send_404(conn,url)
    else:
        print(f'sending file {url}')
        send_200(conn,url)

    

def serve_request(conn):
    url=parse_request(conn)
    print(url)
    #send_dummy_response(conn,url)
    conn.close()

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST,PORT)) #doppia parentesi perchè è una tupla
    s.listen()
    while True:
        conn,addr=s.accept()
        child_pid = os.fork()
        if child_pid ==0:
            serve_request(conn)
            sys.exit()
