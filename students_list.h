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
char *list_all_students(char *unique_id)
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

	char list_all_student_var[8192];
	sprintf(list_all_student_var, "select s.last_name, s.name,  s.university_id, attendance from lecture_attendance join takes t on lecture_attendance.take_id = t.id join student s on t.student_id = s.id where time_slot_id = '%s'", unique_id);
	printf("%s\n", list_all_student_var);
	// if connection is unsuccessful
	if (mysql_query(conn, list_all_student_var))
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
		snprintf(query_result, sizeof(query_result), "%s|%s|%s|%s;", record[0], record[1], record[2], record[3]);
		strcat(return_result, query_result);	
	}
	char *respond = return_result;
	// and make it to return
	return respond;
}