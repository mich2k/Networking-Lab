#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>  // IN AGGIUNTA A server.c

void error(char* msg){
    perror(msg);
    exit(1);
}

// parto dalla stessa base siccome client e server sono simili


int main(int argc, char* argv[]){
    int socketfd; // descriptor del socket
    int portno; // numero di porta/indirizzo
    int n; // numero di byte ricevuti

    struct sockaddr_in server_addr;
    char buffer[256]; // buffer per la ricezione dei dati

    struct hostent *server; // struttura per l'indirizzo del server

    if (argc < 3){  // indirizzo e porta server, un parametro in più richiesto
        fprintf(stderr, "server and port needed\n");
        exit(1);
    }

    socketfd = socket(AF_INET, SOCK_STREAM, 0); // protocol a 0 per il tcp ip non serve
    if (socketfd < 0){
        error("errore creazione socket");
    }

    // da qui cambia il codice tra client e server
    
    portno=80; // VARIA

    server = gethostbyname(argv[1]); // prendo l'indirizzo del server

    if(!server){
        error("errore nella risoluzione dell'host\n");
    }

    bzero((char*)&server_addr, sizeof(server_addr)); // azzero la struttura dati
    server_addr.sin_family = AF_INET; // va lasciato
    server_addr.sin_port = htons(portno); // va lasciato


    // non si può usare il sin_address
    bcopy((char*)server->h_addr, (char*)&server_addr.sin_addr.s_addr, server->h_length); // copio l'indirizzo del server


    int ret=connect(socketfd, (struct sockaddr*)&server_addr, sizeof(server_addr)); // connessione al server
    bzero(buffer, 256); // azzero il buffer


    sprintf(buffer, "GET / HTTP/1.1\r\nHost: localhost\r\n\r\n", argv[1]); // messaggio da inviare al server
        // \r\n indicano linea vuota, ovvero fine della linea
        // con sprintf costruisco la stringa


    bzero(buffer, 256); // azzero il buffer
    fgets(buffer, 255, stdin); // prendo il messaggio dall'input
    // ho letto ma voglio scrivere

    n = write(socketfd, buffer, strlen(buffer)); // scrivo sul socket
    if (n < 0){
        error("errore nella scrittura");
    }

    n = read(socketfd, buffer, 255); // leggo dal socket
    if(n<0){
        error("errore nella lettura");
    }
    return 0;
}


/*
    ./server 1025
    ./client localhost 1025
*/