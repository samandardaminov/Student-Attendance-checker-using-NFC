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
#include "time_stamp.h"
char *classes(char *proff_id)
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
	// get date and time - 15 min
	char *date_sql = date_for_query();
	char *time_sql = hours_minutes_for_query();
	// forming sql statement

	char classes_var[8192];
	sprintf(classes_var, "SELECT c.name, code, s.name as section, ts.start_time, ts.room, ts.id FROM course AS c JOIN section AS s on s.course_id = c.id JOIN time_slot AS ts on ts.section_id = s.id and ts.course_id = s.course_id WHERE s.professor_id = '%s' and ts.date = '%s' and ts.start_time > '%s'", proff_id, date_sql, time_sql);
	printf("%s\n", classes_var);
	// if connection is unsuccessful
	if (mysql_query(conn, classes_var))
	{
		printf("[-]Unable to connect with MySQL server.\n");
		mysql_close(conn);
		return "error";
	}
	rs = mysql_store_result(conn);
	mysql_close(conn);
	printf("[-]MySQL is disconnected.\n");

	//char *query_result;
	char query_result[256] = "";
	char return_result[256] = "";

	while (record = mysql_fetch_row(rs))
	{
		snprintf(query_result, sizeof(query_result), "%s|%s|%s|%s|%s|%s;", record[0], record[1], record[2], record[3], record[4], record[5]);
		strcat(return_result, query_result);	
	}
	char *respond = return_result;
	// and make it to return
	return respond;
}