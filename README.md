Vaccination Center Management System

This project consists of two main scripts that together form a simple simulation for managing connections to executives at a vaccination center. Clients are connected to available windows, and the connections are handled asynchronously using Python's threading library.
Server Script (milk.py)

The server script (milk.py) manages connections from clients, assigning them to available windows (executives). There are three windows available, and clients are served on a first-come-first-serve basis. If all windows are occupied, clients are placed in a queue.
Client Script (ftoken.py)

The client script (ftoken.py) simulates the connection of clients to the server. It makes requests to connect to the server and waits for a response indicating which window (executive) it has been connected to.
How to Run

    Server
    Run the server script to start listening for client connections:

python milk.py

The server will continue to listen for connections until manually terminated.

Client
Run the client script to simulate client connections:

    python ftoken.py

    This script simulates 10 client connections, and they will receive responses from the server regarding their assigned window.

Configuration

You may want to adjust the IP addresses and port numbers in both scripts according to your network setup.

    In milk.py, change the IP and PORT variables to match the desired server IP address and port number.
    In ftoken.py, update the IP and PORT variables to point to the server's IP address and port number.

Dependencies

    Python 3.x
    socket library
    threading library
    datetime library
    random library
    time library
