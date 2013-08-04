/*
  VFD CLOCK test
 */

#include <stdio.h>
#include <time.h>
#include <wiringPi.h>

#define G1 15
#define G2 16
#define G3 1
#define G4 4
#define G5 5
#define G6 6

#define AO 8
#define BO 9
#define CO 7
#define DO 0
#define EO 2
#define FO 3
#define GO 12
#define DP 13
#define DS 14


void decode(int);

int main (int argc,char *argv[])
{
  if (wiringPiSetup () == -1)
    return 1 ;

  pinMode (G1, OUTPUT) ;
  pinMode (G2, OUTPUT) ;
  pinMode (G3, OUTPUT) ;
  pinMode (G4, OUTPUT) ;
  pinMode (G5, OUTPUT) ;
  pinMode (G6, OUTPUT) ;

  pinMode (AO, OUTPUT) ;
  pinMode (BO, OUTPUT) ;
  pinMode (CO, OUTPUT) ;
  pinMode (DO, OUTPUT) ;
  pinMode (EO, OUTPUT) ;
  pinMode (FO, OUTPUT) ;
  pinMode (GO, OUTPUT) ;
  pinMode (DP, OUTPUT) ;
  pinMode (DS, OUTPUT) ;

  int OG[7]={0,G1,G2,G3,G4,G5,G6};

  int i,j,cnt;
  time_t t;
  struct tm *m;
  char s[256];


  for (i=0;i<=1000;i++)
  {
    s[3]=argv[1][0];
    s[4]=argv[1][1];
    s[5]=argv[1][2];

    for (j=1;j<=6;j++){
      decode(s[6-j]-'0');
      digitalWrite (OG[j], 1) ;      // On
      delay (1) ;               // mS
      digitalWrite (OG[j], 0) ;      // Off
    }
  }

  for (;;)
  {
    t = time(NULL);
    m = localtime(&t);
    strftime(s, sizeof(s), " %H:%M:%S", m);

    // Blink :
    (s[8]-'0')%2==0?(s[3]=':'):(s[3]=' ');

    if(s[7]=='5' && s[8]!='0'){
      s[0]=(10-(s[8]-'0'))+'0';
    }

    for (j=1;j<=6;j++){
      decode(s[6-j]-'0');
      digitalWrite (OG[j], 1) ;      // On
      delay (1) ;               // mS
      digitalWrite (OG[j], 0) ;      // Off
    }
  }
  return 0 ;
}

void decode(int val){
  switch(val){
    case 0:
      digitalWrite (AO, 1) ;
      digitalWrite (BO, 1) ;
      digitalWrite (CO, 1) ;
      digitalWrite (DO, 1) ;
      digitalWrite (EO, 1) ;
      digitalWrite (FO, 1) ;
      digitalWrite (GO, 0) ;
      digitalWrite (DP, 0) ;
      digitalWrite (DS, 0) ;
      break;
    case 1:
      digitalWrite (AO, 0) ;
      digitalWrite (BO, 1) ;
      digitalWrite (CO, 1) ;
      digitalWrite (DO, 0) ;
      digitalWrite (EO, 0) ;
      digitalWrite (FO, 0) ;
      digitalWrite (GO, 0) ;
      digitalWrite (DP, 0) ;
      digitalWrite (DS, 0) ;
      break;
    case 2:
      digitalWrite (AO, 1) ;
      digitalWrite (BO, 1) ;
      digitalWrite (CO, 0) ;
      digitalWrite (DO, 1) ;
      digitalWrite (EO, 1) ;
      digitalWrite (FO, 0) ;
      digitalWrite (GO, 1) ;
      digitalWrite (DP, 0) ;
      digitalWrite (DS, 0) ;
      break;
    case 3:
      digitalWrite (AO, 1) ;
      digitalWrite (BO, 1) ;
      digitalWrite (CO, 1) ;
      digitalWrite (DO, 1) ;
      digitalWrite (EO, 0) ;
      digitalWrite (FO, 0) ;
      digitalWrite (GO, 1) ;
      digitalWrite (DP, 0) ;
      digitalWrite (DS, 0) ;
      break;
    case 4:
      digitalWrite (AO, 0) ;
      digitalWrite (BO, 1) ;
      digitalWrite (CO, 1) ;
      digitalWrite (DO, 0) ;
      digitalWrite (EO, 0) ;
      digitalWrite (FO, 1) ;
      digitalWrite (GO, 1) ;
      digitalWrite (DP, 0) ;
      digitalWrite (DS, 1) ;
      break;
    case 5:
      digitalWrite (AO, 1) ;
      digitalWrite (BO, 0) ;
      digitalWrite (CO, 1) ;
      digitalWrite (DO, 1) ;
      digitalWrite (EO, 0) ;
      digitalWrite (FO, 1) ;
      digitalWrite (GO, 1) ;
      digitalWrite (DP, 0) ;
      digitalWrite (DS, 0) ;
      break;
    case 6:
      digitalWrite (AO, 1) ;
      digitalWrite (BO, 0) ;
      digitalWrite (CO, 1) ;
      digitalWrite (DO, 1) ;
      digitalWrite (EO, 1) ;
      digitalWrite (FO, 1) ;
      digitalWrite (GO, 1) ;
      digitalWrite (DP, 0) ;
      digitalWrite (DS, 0) ;
      break;
    case 7:
      digitalWrite (AO, 1) ;
      digitalWrite (BO, 1) ;
      digitalWrite (CO, 1) ;
      digitalWrite (DO, 0) ;
      digitalWrite (EO, 0) ;
      digitalWrite (FO, 0) ;
      digitalWrite (GO, 0) ;
      digitalWrite (DP, 0) ;
      digitalWrite (DS, 0) ;
      break;
    case 8:
      digitalWrite (AO, 1) ;
      digitalWrite (BO, 1) ;
      digitalWrite (CO, 1) ;
      digitalWrite (DO, 1) ;
      digitalWrite (EO, 1) ;
      digitalWrite (FO, 1) ;
      digitalWrite (GO, 1) ;
      digitalWrite (DP, 0) ;
      digitalWrite (DS, 0) ;
      break;
    case 9:
      digitalWrite (AO, 1) ;
      digitalWrite (BO, 1) ;
      digitalWrite (CO, 1) ;
      digitalWrite (DO, 1) ;
      digitalWrite (EO, 0) ;
      digitalWrite (FO, 1) ;
      digitalWrite (GO, 1) ;
      digitalWrite (DP, 0) ;
      digitalWrite (DS, 0) ;
      break;
    case 10:
      digitalWrite (AO, 0) ;
      digitalWrite (BO, 0) ;
      digitalWrite (CO, 0) ;
      digitalWrite (DO, 0) ;
      digitalWrite (EO, 0) ;
      digitalWrite (FO, 0) ;
      digitalWrite (GO, 0) ;
      digitalWrite (DP, 1) ;
      digitalWrite (DS, 1) ;
      break;
    default:
      digitalWrite (AO, 0) ;
      digitalWrite (BO, 0) ;
      digitalWrite (CO, 0) ;
      digitalWrite (DO, 0) ;
      digitalWrite (EO, 0) ;
      digitalWrite (FO, 0) ;
      digitalWrite (GO, 0) ;
      digitalWrite (DP, 0) ;
      digitalWrite (DS, 0) ;
      break;
  }
}
