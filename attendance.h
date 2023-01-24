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
#include "check_student.h"
char *attendance(char *temp)
{
	// parse received value
	temp[strcspn(temp, "\n")] = 0;
	temp = strtok(NULL, "|");
	char *time_slot_id = temp;
	temp = strtok(NULL, "|");
	char *nfs_token = temp;
    if (start_class_new(time_slot_id)=="error"){
        return "error (time)";
    } else {
        char *la_id = student_entered(time_slot_id, nfs_token);
        if ( la_id == "error"){
            return "error";
        } else {

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
	char sign_in[8192];
	
	// sending formed query
	sprintf(sign_in, "update lecture_attendance set attendance = TRUE where id = '%s'",la_id);
	// printf("%s\n", sign_in);
	// if error
	if (mysql_query(conn, sign_in)){
		printf("[-]Unable to connect with MySQL server.\n");
		mysql_close(conn);
		return "[-]Unable to connect with MySQL server.";
	}
	// else close connection and parse result
	rs = mysql_store_result(conn);
	mysql_close(conn);
    return list_all_students(time_slot_id);
	
    }




    }
}
        
