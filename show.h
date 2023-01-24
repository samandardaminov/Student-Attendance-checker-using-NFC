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
char *show(char *temp)
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
	char *date_sql_attendance = date_for_query();
	// char *time_sql_attendance = hours_minutes_for_query();
	// forming sql statement
	// parse received value
	temp[strcspn(temp, "\n")] = 0;
	temp = strtok(NULL, "|");
	char *course_name = temp;
	temp = strtok(NULL, "|");
	char *sec_id = temp;

	char attendance_var[8192];
	sprintf(attendance_var, "select s2.last_name, s2.name, university_id, attendance, date from lecture_attendance join takes t on lecture_attendance.take_id = t.id join section s on t.section_id = s.id join time_slot ts on lecture_attendance.time_slot_id = ts.id join student s2 on s2.id = t.student_id join course c on c.id = ts.course_id where s.name = '%s' and date <= (date('%s') - 1) and c.name = '%s'", sec_id, date_sql_attendance, course_name);
	printf("%s\n", attendance_var);
	// if connection is unsuccessful
	if (mysql_query(conn, attendance_var))
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
		snprintf(query_result, sizeof(query_result), "%s|%s|%s|%s|%s;", record[0], record[1], record[2], record[3], record[4]);
		strcat(return_result, query_result);	
	}
	char *respond = return_result;
	// and make it to return
	return respond;
}