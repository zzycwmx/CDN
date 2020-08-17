#include<time.h>

#include<stdio.h>
#include<math.h>
#include <sys/time.h>
#include<stdlib.h>

#define STEPS 5000000

long per[5],s[5];
int a,b,k,u,v,w,m,n;
long int_per[5];
void interger()
{
    int i;
    long f=1;
    for(m=1;m<2000000;m++)
    {
        n=100;
        for(i=1;i<n;i++)
        {
            f=f*i;
        }
    }
}
void function()
{
    int i,k=0;
    double p=2;
    for (i=0;i<STEPS;i++)
    {
        p*=((double)(((int)((i+2)/2))*2))/(((int)((i+1)/2))*2+1);
    }
}

void compute()
{
    struct timeval tpstart,tpend;
    float timeuse;
    printf("\033[4A\033[18D\033[?25l\033[36;5m欢迎您使用CPU Test （CPU性能测试）！\033[0m\n\n正在为您的手机进行\033[32;5mCPU浮点运算性能\033[0m测试……\n请尽量避免其他操作！\n\033[32;5m当前测试进度%d%%……\033[0m",k*10+10);
    gettimeofday(&tpstart,NULL);
    function();
    gettimeofday(&tpend,NULL);
    timeuse=1000000*(tpend.tv_sec-tpstart.tv_sec)+
    tpend.tv_usec-tpstart.tv_usec;
    timeuse/=1000000;
    a=STEPS/timeuse;
    b=a/10000;
}

void compute_interger()
{
    struct timeval tpstart,tpend;
    float timeuse;
    printf("\033[2A\033[18D\033[?25l正在为您的手机进行\033[32;5mCPU整形运算性能\033[0m测试……\n请尽量避免其他操作！\n\033[32;5m当前测试进度%d%%……\033[0m",k*10);
    gettimeofday(&tpstart,NULL);
    interger();
    gettimeofday(&tpend,NULL);
    timeuse=1000000*(tpend.tv_sec-tpstart.tv_sec)+
    tpend.tv_usec-tpstart.tv_usec;
    timeuse/=1000000;
    u=m/timeuse;
    v=u/10000;
}

int main()
{
    int x,soccer,soccer1,int_soccer,result;
    for (k=0;k<5;k++)
    {
        compute();
        per[k]=b;
        s[k]=a;
    }
    int int_x;
    for (k=6;k<11;k++)
    {
        compute_interger();
        int_per[k]=v;
    }
    x=(per[1]+per[2]+per[3]+per[4])/4;
    soccer1=(s[1]+s[2]+s[3]+s[4])/4;
    soccer=soccer1*0.001197;
    int_x=(int_per[6]+int_per[7]+int_per[8]+int_per[9]+int_per[10])/5;
    int_soccer=int_x*17.56946;
    result=soccer+int_soccer;
    system("clear");

    printf("\033[32;5m\n测试完成！\033[0m\n\n您的CPU性能测试分数是：\033[36;5m%d\033[0m！\n\n浮点运算得分为：\033[36;5m%d\033[0m！\n整数运算得分为：\033[5m\033[36m%d\033[0m！\n\n\n\nBy:\033[35;5m风雪梧桐\033[0m\n\n",result,soccer,int_soccer);
}
