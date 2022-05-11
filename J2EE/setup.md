# eclipse dynamic web setup

## Needed plugins:
    -   Eclipse Java EE developer tools
    -   Eclipse Java Web developer tools
    -   Eclipse Web developer tools
    -   JST Server Adapters
    -   JST Server Adapter Extensions

## Servlet Mapping

in **web.xml** _({ProjName}/src/main/webapp/WEB-INF/web.xml)_ 

    servlet-mapping tag maps the Mapping path point of the servlet on the dynamic webserver

    ```

    <servlet-mapping>
        <servlet-name>PrimaServlet</servlet-name>
        <url-pattern>/PrimaServlet</url-pattern>
    </servlet-mapping>
    
    ```