#include <stdio.h>
#include <stdlib.h>
typedef struct lists{
    char name[16];
    char priority[8];
    int date;
}list;
typedef struct requests{
    list arr[20];
    int top;
}request;
void BinarySearch(request *pa,int search){
      int first,middle,last;
      last=pa->top;
              first = 0;
            middle = (first+last)/2;
   while (first <= last) {
      if (pa->arr[middle].date < search)
         first = middle + 1;
      else if (pa->arr[middle].date == search) {
         printf("the request name is %s\t, priority is %s\t and the date id %d\n",pa->arr[middle].name,pa->arr[middle].priority,pa->arr[middle].date);
         break;
      }
      else
         last= middle - 1;
      middle = (first + last)/2;
   }}
void SearchN(request *pa,request *pb,request *pc,request *pd,char search[8]){
       int max1,max2,max3,max4;
    max1=pa->top+1;
    max2=pb->top+1;
    max3=pc->top+1;
    max4=pd->top+1;
    for(int i=0;i<max1;i++){
       if(!strcmp(pa->arr[i].priority,search)){
         printf("the request name is %s\t, priority is %s\t and the date id %d\n",pa->arr[i].name,pa->arr[i].priority,pa->arr[i].date);
         }}
 for(int i=0;i<max2;i++){
       if(!strcmp(pb->arr[i].priority,search)){
         printf("the request name is %s\t, priority is %s\t and the date id %d\n",pb->arr[i].name,pb->arr[i].priority,pb->arr[i].date);
         }}
 for(int i=0;i<max3;i++){
       if(!strcmp(pc->arr[i].priority,search)){
         printf("the request name is %s\t, priority is %s\t and the date id %d\n",pc->arr[i].name,pc->arr[i].priority,pc->arr[i].date);
         }}
 for(int i=0;i<max4;i++){
       if(!strcmp(pd->arr[i].priority,search)){
         printf("the request name is %s\t, priority is %s\t and the date id %d\n",pd->arr[i].name,pd->arr[i].priority,pd->arr[i].date);
         }}
}
void SearchB(request *pa,request *pb,request *pc,request *pd,char searchc[8],int search){
         int max1,max2,max3,max4;
    max1=pa->top+1;
    max2=pb->top+1;
    max3=pc->top+1;
    max4=pd->top+1;
    for(int i=0;i<max1;i++){
       if(pa->arr[i].date==search&&(!strcmp(pa->arr[i].priority,searchc))){
         printf("the request name is %s\t, priority is %s\t and the date id %d\n",pa->arr[i].name,pa->arr[i].priority,pa->arr[i].date);
         }}
         for(int i=0;i<max2;i++){
       if(pb->arr[i].date==search&&(!strcmp(pb->arr[i].priority,searchc))){
         printf("the request name is %s\t, priority is %s\t and the date id %d\n",pb->arr[i].name,pb->arr[i].priority,pb->arr[i].date);
         }}
         for(int i=0;i<max3;i++){
       if(pc->arr[i].date==search&&(!strcmp(pc->arr[i].priority,searchc))){
         printf("the request name is %s\t, priority is %s\t and the date id %d\n",pc->arr[i].name,pc->arr[i].priority,pc->arr[i].date);
         }}
         for(int i=0;i<max4;i++){
       if(pd->arr[i].date==search&&(!strcmp(pd->arr[i].priority,searchc))){
         printf("the request name is %s\t, priority is %s\t and the date id %d\n",pd->arr[i].name,pd->arr[i].priority,pd->arr[i].date);
         }}
}
void EmptyLists(request *pa,request *pb,request *pc,request *pd)
{
    pa->top=-1;
    pb->top=-1;
    pc->top=-1;
    pd->top=-1;
    printf("EmptyLists scassfully\n");
}
void UpdataRequest(request *pa,request *pb,request *pc,request *pd,char Pname[16],char Ppriority[8]){
     int max1,max2,max3,max4;
    max1=pa->top+1;
    max2=pb->top+1;
    max3=pc->top+1;
    max4=pd->top+1;
    for(int i=0;i<max1;i++){
       if(!strcmp(pa->arr[i].name,Pname)){
       strcpy(pa->arr[i].priority,Ppriority);
       printf("the request name is %s\t, priority is %s\t and the date id %d\n",pa->arr[i].name,pa->arr[i].priority,pa->arr[i].date);
        }}
         for(int i=0;i<max2;i++){
       if(!strcmp(pb->arr[i].name,Pname)){
       strcpy(pb->arr[i].priority,Ppriority);
       printf("the request name is %s\t, priority is %s\t and the date id %d\n",pb->arr[i].name,pb->arr[i].priority,pb->arr[i].date);
        }}
         for(int i=0;i<max3;i++){
       if(!strcmp(pc->arr[i].name,Pname)){
       strcpy(pc->arr[i].priority,Ppriority);
       printf("the request name is %s\t, priority is %s\t and the date id %d\n",pc->arr[i].name,pc->arr[i].priority,pc->arr[i].date);
        }}
         for(int i=0;i<max4;i++){
       if(!strcmp(pd->arr[i].name,Pname)){
       strcpy(pd->arr[i].priority,Ppriority);
       printf("the request name is %s\t, priority is %s\t and the date id %d\n",pd->arr[i].name,pd->arr[i].priority,pd->arr[i].date);
        }}

        }
void process(request *pa,request *pb,request *pc,request *pd){
    request pro;
     int max;
    max=pa->top+1;
    for(int i=0;i<max;i++){
        pro.top=pro.top+1;
        pro.arr[pro.top]=pa->arr[i];
        pa->top--;
    }
    for(int j=0;j<max;j++)
    {  if(!strcmp("Critical",pro.arr[j].priority))
       { pa->top=pa->top+1;
         pa->arr[pa->top]=pro.arr[j];
       }else if(!strcmp("High",pro.arr[j].priority))
       { pb->top=pb->top+1;
         pb->arr[pb->top]=pro.arr[j];
       }else if(!strcmp("Medium",pro.arr[j].priority))
       { pc->top=pc->top+1;
         pc->arr[pc->top]=pro.arr[j];
       }else if(!strcmp("Low",pro.arr[j].priority))
       { pd->top=pd->top+1;
         pd->arr[pd->top]=pro.arr[j];
       }}
}
void Join()
{

}
void printAll(request *pa,request *pb,request *pc,request *pd)
{
    int max1,max2,max3,max4;
    max1=pa->top+1;
    max2=pb->top+1;
    max3=pc->top+1;
    max4=pd->top+1;

     for(int i=0;i<max1;i++){
         printf("the request name is %s\t, priority is %s\t and the date id %d\n",pa->arr[i].name,pa->arr[i].priority,pa->arr[i].date);
         }
        for(int i=0;i<max2;i++){
         printf("the request name is %s\t, priority is %s\t and the date id %d\n",pb->arr[i].name,pb->arr[i].priority,pb->arr[i].date);
         }
          for(int i=0;i<max3;i++){
         printf("the request name is %s\t, priority is %s\t and the date id %d\n",pc->arr[i].name,pc->arr[i].priority,pc->arr[i].date);
         }
          for(int i=0;i<max4;i++){
         printf("the request name is %s\t, priority is %s\t and the date id %d\n",pd->arr[i].name,pd->arr[i].priority,pd->arr[i].date);
         }
}
int main()
{
 int w=0,s=80,op;
  request a,b,c,d,f;
  a.top=-1;
  b.top=-1;
  c.top=-1;
  d.top=-1;
do{
 int size=0,search,x;
     char SearchP[8],nameP[16];
 printf("enter number of item: ");
 scanf("%d",&size);
if(size<s){
    for(int i=0;i<size;i++)
        {
             printf("enter requests name:");
            scanf("%s",&f.arr[0].name);
            printf("enter requests priority:");
            scanf("%s",&f.arr[0].priority);
            printf("enter requests date:");
            scanf("%d",&f.arr[0].date);
            if(a.top<20){
            a.top=a.top+1;
            a.arr[a.top]=f.arr[0];
            }else if(b.top<20){
            b.top=b.top+1;
            b.arr[b.top]=f.arr[0];
            }else if(c.top<20){
            c.top=c.top+1;
            c.arr[c.top]=f.arr[0];
            }
            else if(d.top<20){
            d.top=d.top+1;
            d.arr[d.top]=f.arr[0];
            }}
    printf("1.Search\n");
    printf("2.EmptyLists all\n");
    printf("3.join\n");
    printf("4.updata Request \n");
    printf("5.print all list \n");
    printf("enter your Choose 1 to 5\n");
    scanf("%d",&op);
            switch(op)
    {
        case 1:
            printf("Search on specific Request use Binary Search on lists, searching criteria can be request data itself or priority or both.\n");
            printf("enter x=1 ,2 or 3   ");
            scanf("%d",&x);
            if(x == 1){
                 printf("Enter the value to find:\n");
                 scanf("%d", &search);
                 BinarySearch(&a,search);
                 BinarySearch(&b,search);
                 BinarySearch(&c,search);
                 BinarySearch(&d,search);
            }else if(x == 2){
                printf("Enter the value to find:\n");
                scanf("%s",&SearchP);
                SearchN(&a,&b,&c,&d,SearchP);

            }else if(x == 3){
                printf("Enter the value to find:\n");
                scanf("%s",SearchP);
                printf("Enter the value int to find:\n");
                scanf("%d", &search);
                SearchB(&a,&b,&c,&d,SearchP,search);
            }
            break;
        case 2:
            EmptyLists(&a,&b,&c,&d);
            size=0;
            break;
        case 3:
            process(&a,&b,&c,&d);
            Join();
            break;
        case 4:
            printf("Enter the Request name:\n");
            scanf("%s",nameP);
            printf("Enter the priority to updata:\n");
            scanf("%s",SearchP);
            UpdataRequest(&a,&b,&c,&d,nameP,SearchP);
            break;
        case 5:
            printAll(&a,&b,&c,&d);
        default:
            printf("Error! operator is not correct\n");
    }
s=s-size;
}else{
    printf("error");}
    printf("enter 1 if you want Continue:");
scanf("%d",&w);
}while(w == 1);

return 0;
}
