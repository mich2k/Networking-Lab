#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

/*
    ogni syscall può tornare un valore negativo -> errore
*/

void error(char* msg){
    perror(msg);
    exit(1);
}

int main(int argc, char* argv[]){
    int socketfd; // descriptor del socket
    int portno; // numero di porta/indirizzo
    int newsocketfd; // descriptor del nuovo socket
    int clientlen; // lunghezza del client
    struct sockaddr_in server_addr, client_addr; // indirizzo del server
    char buffer[256]; // buffer per la ricezione dei dati
    int n; // numero di byte ricevuti



    if (argc < 2){
        fprintf(stderr, "no port\n");
        exit(1);
    }

    socketfd = socket(AF_INET, SOCK_STREAM, 0); // protocol a 0 per il tcp ip non serve
    if (socketfd < 0){
        error("errore creazione socket");
    }
    bzero((char*)&server_addr, sizeof(server_addr)); // inizializzo a 0 la struttura
    portno= atoi(argv[1]); // converto la stringa in un intero
    server_addr.sin_family = AF_INET; // ipv4
    server_addr.sin_port = htons(portno); // converto in network byte order, host to network, short a 16 bit non word a 32 bit
    server_addr.sin_addr.s_addr = INADDR_ANY; // indirizzo del server, 0.0.0.0, pronto a ricevere comunicazioni da qualsiasi indirizzo

    // htons converte un numero in network byte order

    if(bind(socketfd, (struct sockaddr*)&server_addr, sizeof(server_addr)) < 0){
        error("errore bind");
    } // bind socketfd al socket server_addr

    listen(socketfd, 5); // ascolto sulla porta, non avrò più di 5 tentativi
    

    clientlen = sizeof(client_addr); // lunghezza del client

    newsocketfd = accept(socketfd, (struct sockaddr*) &client_addr,(int*) &clientlen); // accetto la connessione, restituisce un nuovo socket
    if(newsocketfd < 0){
        error("errore accept");
    }


    bzero(buffer, 256); // inizializzo a 0 il buffer
    n = read(newsocketfd, buffer, 255); // leggo dal socket, 255 byte
    if(n < 0){
        error("errore read");
    }

    printf("\n message: %s\n", buffer);

    n = write(newsocketfd, "ok", 2); // scrivo sul socket il 2 rappresenta la lunghezza del messaggio

    if (n < 0){
        error("errore write");
    }

    //! close(socketfd); chiudo lato server o lato client?
    return 0;
}