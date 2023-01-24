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
char *student_entered(char *take_id, char *nfc)
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
	// forming sql statement

	

	char start_class_var[8192];
	sprintf(start_class_var, "select la.id from student as s join takes as t on s.id = t.student_id join time_slot ts on t.section_id = ts.section_id and t.course_id = ts.course_id join lecture_attendance la on ts.id = la.time_slot_id and la.take_id = t.id where s.nfc_token = '%s' and time_slot_id = '%s';", nfc, take_id);
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
	// if result is none -> error, else call function to return all calsses
	if (stringdata == "error"){
		return "error";
	} else{
		return stringdata;
	}
}