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
#include <netdb.h>
#include <mysql.h>
#include "classes.h"
char *sign_in(char *temp)
{
	// connection to mysql server
	printf("[+]MySQL client version: %s\n", mysql_get_client_info());
	char server[64] = "192.168.43.37";
	char username[64] = "admindo";
	char password[64] = "admin";
	char database[64] = "defaultdb";
	MYSQL *conn = mysql_init(NULL);
	MYSQL_ROW record;
	if (conn == NULL){
		printf("[-]MySQL initialization failed.");
		fprintf(stderr, "%s\n", mysql_error(conn));
		return "[-]MySQL initialization failed.";
	}
	if (mysql_real_connect(conn, server, username, password, database, 3306, NULL, 0) == NULL)
	{
		printf("[-]Unable to connect with MySQL server.\n");
		mysql_close(conn);
		return "[-]Unable to connect with MySQL server.";
	}
	printf("[+]MySQL is connected.\n");
	if (mysql_query(conn, "SELECT VERSION()"))
	{
		printf("[-]Unable to connect with MySQL server.\n");
		mysql_close(conn);
		return "[-]Unable to connect with MySQL server.";
	}
	MYSQL_RES *rs = mysql_store_result(conn);
	if (rs == NULL)
	{
		printf("[-]Unable to compile SQL statement.\n");
		mysql_close(conn);
		return "[-]Unable to connect with MySQL server.";
	}
	if (record = mysql_fetch_row(rs))
	{
		printf("[+]MySql Version: %s\n", record[0]);
	}
	// parse received value
	temp[strcspn(temp, "\n")] = 0;
	temp = strtok(NULL, "|");
	char *client_username = temp;
	temp = strtok(NULL, "|");
	char *client_password = temp;
	char sign_in[8192];
	// sending formed query
	sprintf(sign_in, "SELECT professor_id FROM users WHERE username = '%s' and password = '%s'", client_username, client_password);
	printf("%s\n", sign_in);
	// if error
	if (mysql_query(conn, sign_in)){
		printf("[-]Unable to connect with MySQL server.\n");
		mysql_close(conn);
		return "[-]Unable to connect with MySQL server.";
	}
	// else close connection and parse result
	rs = mysql_store_result(conn);
	mysql_close(conn);
	printf("[-]MySQL is disconnected.\n");
	char *stringdata;
	stringdata = "error";
	// parse result by rows
	while (record = mysql_fetch_row(rs))
	{
		// printf("%s %s\n", record[0], record[1]);
		stringdata = record[0];
	}
	printf("%s\n\n",stringdata);
	// if result is none -> error, else call function to return all calsses
	if (stringdata == "error"){
		return "error";
	} else{
		return classes(stringdata);
	}
}