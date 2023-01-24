// filename server_ipaddress portnum
/*
argv[0] = filename
argv[1] = server_ipaddress
argv[2] = portnum
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <netdb.h> //defines hostent structure
void error(const char *msg)
{
	perror(msg);
	exit(EXIT_FAILURE);
}
int main(int argc, char *argv[])
{
	if (argc < 3)
	{
		fprintf(stderr, "Problem with usage %s hostname or port number.\n", argv[0]);
		exit(EXIT_FAILURE);
	}
	int sockfd = 0, portnum, val;
	struct sockaddr_in serv_addr;
	struct hostent *server;
	char buffer[1024] = {0}, cchat[1024];
	char* bye = "bye";
	if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
		error("[-]Error in opening socket.");
	portnum = atoi(argv[2]);
	server = gethostbyname(argv[1]);
	if (server == NULL)
		fprintf(stderr, "Error, no such host.");
	// memset(&serv_addr, '\0', sizeof(serv_addr));
	bzero((char *)&serv_addr, sizeof(serv_addr));
	serv_addr.sin_family = AF_INET;
	// The bcopy() function copies the byte string pointed to by src
	// (including any NULL characters) into the array pointed to by dst.
	bcopy((char *)server->h_addr, (char *)&serv_addr.sin_addr.s_addr, server->h_length);
	serv_addr.sin_port = htons(portnum);
	// Convert IPv4 and IPv6 addresses from text to binary form
	if (inet_pton(AF_INET, (const char * restrict)server, &serv_addr.sin_addr) < 0) 
		error("[-]Invalid address/ Address not supported.\n");
	printf("[+]Client socket is created.\n");
	// serv_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
	if (connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
		error("[-]Connection did not succeed.\n");
	printf("[+]Connection is created.\n");
	printf("[+]Ready for chat...\n");
	while (1)
	{
		bzero(buffer, sizeof(buffer));
		memset(cchat, 0, sizeof(cchat));
		printf("Client: ");
		fgets(cchat, sizeof(cchat), stdin);
		send(sockfd, cchat, strlen(cchat), 0);
		printf("Server: ");
		val = read(sockfd, buffer, 8192);
		printf("%s\n", buffer);
		cchat[strlen(cchat)] = '\0';
		if (strncmp(cchat, bye, strlen(bye)) == 0)
		{
			printf("[-]Disconnected from server.\n");
			close(sockfd);
			break;
		}
	}
	close(sockfd);
	exit(EXIT_SUCCESS);
}