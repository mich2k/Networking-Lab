# Socket Programming

## Debug in VSCode

### Steps

F5 > GDB > GCC > breakpoint before socket accept()

### Order sync server/client

is possible to debug, in order to debug server-side is needed to start the debug procedure on server code from vscode, wait until 

```
    newsockfd = accept(sockfd, (struct sockaddr*)&cli_addr, &clilen);

```

there the debug will pause until one client won't connect

```

./client.out localhost

(params as reference)

```

only there the server-side debugging will proceed.