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
#include "students_list.h"
char *start_class_new(char *temp)
{
	
	// connection to mysql server
	printf("[+]MySQL client version start class: %s\n", mysql_get_client_info());
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
	char *date_sql_class_start = date_for_query();
	char *time_sql_class_start = hours_minutes_for_query();
	char *real_time_sql_class_start = get_real_time();
	// forming sql statement

	
	char *buffer = temp;

	char start_class_var[8192];
	sprintf(start_class_var, "select id from time_slot where id='%s' and date = '%s' and start_time > '%s' and abs(timediff('%s', start_time)/100) <= 15", buffer, date_sql_class_start, time_sql_class_start, real_time_sql_class_start);
	printf("%s\n", start_class_var);
	// if connection is unsuccessful
	if (mysql_query(conn, start_class_var))
	{
		printf("[-]Unable to connect with MySQL server.\n");
		mysql_close(conn);
		return "error";
	}
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
		return list_all_students(buffer);
	}
}

