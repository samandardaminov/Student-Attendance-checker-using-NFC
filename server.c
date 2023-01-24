// filename portnum
/*
argv[0] = filename
argv[2] = portnum
*/

// input and output (e.g. printf(), scanf())
#include <stdio.h>
// defines four variable types, several macros and various functions(int atoi(const char *str))
#include <stdlib.h>
// for string type and string functions
#include <string.h>
// for read(), write(), close() functions
#include <unistd.h>
// gives definitions of a number of data types used in system calls
#include <sys/types.h>
// defines sockaddr structure, and provides a number of definitions of structures for sockets (socklen_t)
#include <sys/socket.h>
// contains constants and structures needed for internet domain addresses(sockaddr_in)
#include <netinet/in.h>
// makes available the type in_port_t and the type in_addr_t
#include <arpa/inet.h>
// below header defines the structure of the data returned by the functions fstat(), lstat(), and stat()
#include <sys/stat.h>
// below header shall define the flock structure describing a file lock
#include <fcntl.h>
// mysql
#include <mysql.h>
#include "sign_in.h"
#include "manage_class.h"
#include "sign_in_admin.h"
#include "attendance.h"
#include "show.h"
// time stap
#include <sys/time.h>
void error(const char *msg)
{
	perror(msg); // prints a descriptive error message to stderr
	exit(EXIT_FAILURE);
}
int main(int argc, char *argv[])
{
	if (argc < 2)
	{
		// fprintf is used to print the string content in file but not on stdout console
		fprintf(stderr, "[-]Program is terminated as port number is not provided.\n");
		exit(EXIT_FAILURE);
	}
	pid_t childpid;
	int opt = 1;
	char buffer[8192] = {0};
	char *bye = "bye";
	int sockfd, newsockfd, portnum, val;
	struct sockaddr_in serv_addr;
	int servaddrlength = sizeof(serv_addr);
	sockfd = socket(AF_INET, SOCK_STREAM, 0); // creating socket file descriptor with IPv4 and TCP
	if (sockfd < 0)							  // if socket function returned -1 then socket function failed
		error("[-]Error in opening socket.\n");
	// bzero() is similar to memset()
	// memset(&serv_addr, '\0', sizeof(serv_addr));
	bzero((char *)&serv_addr, sizeof(serv_addr));
	portnum = atoi(argv[1]); // atoi converts string to integer
	// forcefully attaching socket to the port from CLI argument
	if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt, sizeof(opt)))
	{
		perror("setsockopt failed.\n");
		exit(EXIT_FAILURE);
	}
	serv_addr.sin_family = AF_INET;
	// serv_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
	serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);
	// host-to-network short (also htonl - host-to-network long for long integer)
	serv_addr.sin_port = htons(portnum); // htons translates a short integer from host byte order to network byte order
	printf("[+]Server socket is created.\n");
	if (bind(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) // if bind function returned -1 then bind function failed
		error("[-]Binding failed.\n");
	printf("[+]Binding to port %d\n", portnum);
	if (listen(sockfd, 8) == 0) // maximum number of clients is 8
		printf("[+]Listening...\n");
	else
		error("[-]Error in binding.\n");
	while (1)
	{
		if ((newsockfd = accept(sockfd, (struct sockaddr *)&serv_addr, (socklen_t *)&servaddrlength)) < 0)
			error("[-]Error in creating new file descriptor.\n");
		printf("[+]Ready for chat...\n");
		printf("[+]Connection accepted from %s:%d\n", inet_ntoa(serv_addr.sin_addr), ntohs(serv_addr.sin_port));

		if ((childpid = fork()) == 0)
		{
			close(sockfd);
			while (true)
			{
				memset(buffer, 0, sizeof(buffer));
				bzero(buffer, 8192);
				val = read(newsockfd, buffer, 8192);
				buffer[strcspn(buffer, "\n")] = 0;
				char *temp = strtok(buffer, "|");
				printf("Client: %s\n", temp);
				if (strncmp(temp, "sign_in", strlen("sign_in")) == 0)
				{
					// if type of message is sign in
					// calling function to handle log in for proffesors
					char *return_sign_in = sign_in(buffer);
					// sending respond to client
					send(newsockfd, return_sign_in, strlen(return_sign_in), 0);
				}
				else if (strncmp(temp, "start_class", strlen("start_class")) == 0)
				{
					// if type of message is start class
					// calling function to handle start class requiest

					temp[strcspn(temp, "\n")] = 0;
					temp = strtok(NULL, "|");
					char *return_start_class = start_class_new(temp);
					// sending respond to client
					send(newsockfd, return_start_class, strlen(return_start_class), 0);
				}
				else if (strncmp(temp, "admin_log_in", strlen("admin_log_in")) == 0)
				{
					// if type of message is start class
					// calling function to handle start class requiest
					char *return_sign_in_admin = sign_in_admin(buffer);
					// sending respond to client
					send(newsockfd, return_sign_in_admin, strlen(return_sign_in_admin), 0);
				}
				else if (strncmp(temp, "attendance", strlen("attendance")) == 0)
				{
					// if type of message is start class
					// calling function to handle start class requiest
					char *return_attendance = attendance(buffer);
					// sending respond to client
					send(newsockfd, return_attendance, strlen(return_attendance), 0);
				}
				else if (strncmp(temp, "show_attendance", strlen("show_attendance")) == 0)
				{
					// if type of message is start class
					// calling function to handle start class requiest

					char *return_show = show(temp);
					// sending respond to client
					send(newsockfd, return_show, strlen(return_show), 0);
				}
				else
				{
					printf("[-]Invalid type: %s\n", temp);
					send(newsockfd, "error type", strlen("error"), 0);
				}
				memset(temp, 0, sizeof(temp));
				bzero(buffer, sizeof(buffer));
				buffer[strlen(buffer)] = '\0';
			}
		}
	}
	close(newsockfd);
	close(sockfd);
	printf("[-]Socket is closed.\n");
	exit(EXIT_SUCCESS);
}