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
char *select_list(char *admin_id)
{
	// connection to mysql server
	printf("[+]MySQL client version: %s\n", mysql_get_client_info());
	char server[64] = "192.168.43.37";
	char username[64] = "admindo";
	char password[64] = "admin";
	char database[64] = "defaultdb";
	MYSQL *conn = mysql_init(NULL);
	MYSQL_ROW record;
	if (conn == NULL)
	{
		printf("[-]MySQL initialization failed.");
		fprintf(stderr, "%s\n", mysql_error(conn));
		return "1";
	}
	if (mysql_real_connect(conn, server, username, password, database, 3306, NULL, 0) == NULL)
	{
		printf("[-]Unable to connect with MySQL server.\n");
		mysql_close(conn);
		return "1";
	}
	printf("[+]MySQL is connected.\n");
	if (mysql_query(conn, "SELECT VERSION()"))
	{
		printf("[-]Unable to connect with MySQL server.\n");
		mysql_close(conn);
		return "1";
	}
	MYSQL_RES *rs = mysql_store_result(conn);
	if (rs == NULL)
	{
		printf("[-]Unable to compile SQL statement.\n");
		mysql_close(conn);
		return "1";
	}
	if (record = mysql_fetch_row(rs))
	{
		printf("[+]MySql Version: %s\n", record[0]);
	}
	// forming sql statement

	char admin_sign_in[8192];
	sprintf(admin_sign_in, "select concat(concat(p.name, ' '), p.last_name) as full_name, p.id as professor_id, c.name as course_name, c.id as course_id, s.name as section_name, s.id as section_id from professor p join section s on p.id = s.professor_id join course c on s.course_id = c.id");
	printf("%s\n", admin_sign_in);
	// if connection is unsuccessful
	if (mysql_query(conn, admin_sign_in))
	{
		printf("[-]Unable to connect with MySQL server.\n");
		mysql_close(conn);
		return "error";
	}
	rs = mysql_store_result(conn);
	mysql_close(conn);
	printf("[-]MySQL is disconnected.\n");

	//char *query_result;
	char query_result[256];
	char return_result[256];

	while (record = mysql_fetch_row(rs))
	{
		snprintf(query_result, sizeof(query_result), "%s|%s|%s|%s|%s|%s;", record[0], record[1], record[2], record[3], record[4], record[5]);
		strcat(return_result, query_result);	
	}
	char *respond = return_result;
	// and make it to return
	return respond;
}