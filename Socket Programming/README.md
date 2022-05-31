# Socket Programming

## Tipsies

<details>
<summary>SP</summary>
<br>
-   Socket must always be closed by client
<br>
-   ./server.?? 1025    (if !hardcoded server wants port)
<br>
-   ./client.?? 127.0.0.1 1025  (if !hardcoded client wants addr+port)
</details>


<details>
<summary>C lang</summary>
<br>
-   use localhost as str
<br>
</details>

<details>
<summary>Py lang</summary>
<br>
-   Run 'chmod a+x*' in order to be able to execute './server.py' (exec allowance)
<br>
-   Be careful with strings (encode/decode utf-8) !!!
<br>
-   use 127.0.0.1 not localhost
<br>

</details>

## Debug in VSCode

### Steps

F5 > GDB > GCC > breakpoint before socket accept()

### Order sync server/client

#### server-side

In order to debug server-side is needed to start the debug procedure on server code from vscode, wait until

```
newsockfd = accept(sockfd, (struct sockaddr*)&cli_addr, &clilen);

```

^ on this statement the debug will pause until a client won't connect

```

./client.out localhost

(params as reference)

```

only now the server-side debugging will proceed.

#### client-side
