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
#include <time.h>

char *date_for_query()
{
    char *dates = (char *)malloc(sizeof(char) * 16);
    time_t ltime;
    ltime = time(NULL);
    struct tm *tm;
    tm = localtime(&ltime);
    sprintf(dates,"%04d-%02d-%02d", tm->tm_year+1900, tm->tm_mon + 1, tm->tm_mday);
    return dates;
}

char *hours_minutes_for_query()
{
    char *hour_minute = (char *)malloc(sizeof(char) * 16);
    time_t ltime;
    ltime = time(NULL);
    struct tm *tm;
    tm = localtime(&ltime);
    int subtract_time = 15;
    if (tm->tm_min < subtract_time)
    {
        tm->tm_hour--;
        tm->tm_min = tm->tm_min + 60 - subtract_time;
    }
    else
    {
        tm->tm_min -= subtract_time;
    }
    sprintf(hour_minute,"%02d:%02d", tm->tm_hour, tm->tm_min);
    return hour_minute;
}

char *get_real_time()
{
    char *hour_minute = (char *)malloc(sizeof(char) * 16);
    time_t ltime;
    ltime = time(NULL);
    struct tm *tm;
    tm = localtime(&ltime);
    int subtract_time = 0;
    if (tm->tm_min < subtract_time)
    {
        tm->tm_hour--;
        tm->tm_min = tm->tm_min + 60 - subtract_time;
    }
    else
    {
        tm->tm_min -= subtract_time;
    }
    sprintf(hour_minute,"%02d:%02d", tm->tm_hour, tm->tm_min);
    return hour_minute;
}