import socket

socket_file = "/tmp/lemonbar.sock"
client_socket = socket.socket(socket.AF_UNIX, socket.SOCK_DGRAM)

try:
    client_socket.connect(socket_file)
    client_socket.sendall("PING".encode())

finally:
    client_socket.close()
