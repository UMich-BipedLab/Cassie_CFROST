/*
 * Automatically Generated from Mathematica.
 * Wed 20 Jun 2018 12:30:27 GMT-04:00
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "frost/gen/Js_Ce1_vec14_cassie.hh"

#ifdef _MSC_VER
  #define INLINE __forceinline /* use __forceinline (VC++ specific) */
#else
  #define INLINE inline        /* use standard inline */
#endif

/**
 * Copied from Wolfram Mathematica C Definitions file mdefs.hpp
 * Changed marcos to inline functions (Eric Cousineau)
 */
INLINE double Power(double x, double y) { return pow(x, y); }
INLINE double Sqrt(double x) { return sqrt(x); }

INLINE double Abs(double x) { return fabs(x); }

INLINE double Exp(double x) { return exp(x); }
INLINE double Log(double x) { return log(x); }

INLINE double Sin(double x) { return sin(x); }
INLINE double Cos(double x) { return cos(x); }
INLINE double Tan(double x) { return tan(x); }

INLINE double ArcSin(double x) { return asin(x); }
INLINE double ArcCos(double x) { return acos(x); }
//INLINE double ArcTan(double x) { return atan(x); }

/* update ArcTan function to use atan2 instead. */
INLINE double ArcTan(double x, double y) { return atan2(y,x); }

INLINE double Sinh(double x) { return sinh(x); }
INLINE double Cosh(double x) { return cosh(x); }
INLINE double Tanh(double x) { return tanh(x); }

#define E 2.71828182845904523536029
#define Pi 3.14159265358979323846264
#define Degree 0.01745329251994329576924

/*
 * Sub functions
 */
static void output1(double *p_output1,const double *var1)
{
  double _NotUsed;
  NULL;
  p_output1[0]=1;
  p_output1[1]=1;
  p_output1[2]=1;
  p_output1[3]=1;
  p_output1[4]=1;
  p_output1[5]=1;
  p_output1[6]=1;
  p_output1[7]=1;
  p_output1[8]=1;
  p_output1[9]=1;
  p_output1[10]=1;
  p_output1[11]=1;
  p_output1[12]=1;
  p_output1[13]=1;
  p_output1[14]=1;
  p_output1[15]=1;
  p_output1[16]=1;
  p_output1[17]=1;
  p_output1[18]=1;
  p_output1[19]=1;
  p_output1[20]=2;
  p_output1[21]=2;
  p_output1[22]=2;
  p_output1[23]=2;
  p_output1[24]=2;
  p_output1[25]=2;
  p_output1[26]=2;
  p_output1[27]=2;
  p_output1[28]=2;
  p_output1[29]=2;
  p_output1[30]=2;
  p_output1[31]=2;
  p_output1[32]=2;
  p_output1[33]=2;
  p_output1[34]=2;
  p_output1[35]=2;
  p_output1[36]=2;
  p_output1[37]=2;
  p_output1[38]=2;
  p_output1[39]=2;
  p_output1[40]=3;
  p_output1[41]=3;
  p_output1[42]=3;
  p_output1[43]=3;
  p_output1[44]=3;
  p_output1[45]=3;
  p_output1[46]=3;
  p_output1[47]=3;
  p_output1[48]=3;
  p_output1[49]=3;
  p_output1[50]=3;
  p_output1[51]=3;
  p_output1[52]=3;
  p_output1[53]=3;
  p_output1[54]=3;
  p_output1[55]=3;
  p_output1[56]=3;
  p_output1[57]=3;
  p_output1[58]=4;
  p_output1[59]=4;
  p_output1[60]=4;
  p_output1[61]=4;
  p_output1[62]=4;
  p_output1[63]=4;
  p_output1[64]=4;
  p_output1[65]=4;
  p_output1[66]=4;
  p_output1[67]=4;
  p_output1[68]=4;
  p_output1[69]=4;
  p_output1[70]=4;
  p_output1[71]=4;
  p_output1[72]=4;
  p_output1[73]=4;
  p_output1[74]=4;
  p_output1[75]=4;
  p_output1[76]=5;
  p_output1[77]=5;
  p_output1[78]=5;
  p_output1[79]=5;
  p_output1[80]=5;
  p_output1[81]=5;
  p_output1[82]=5;
  p_output1[83]=5;
  p_output1[84]=5;
  p_output1[85]=5;
  p_output1[86]=5;
  p_output1[87]=5;
  p_output1[88]=5;
  p_output1[89]=5;
  p_output1[90]=5;
  p_output1[91]=5;
  p_output1[92]=6;
  p_output1[93]=6;
  p_output1[94]=6;
  p_output1[95]=6;
  p_output1[96]=6;
  p_output1[97]=6;
  p_output1[98]=6;
  p_output1[99]=6;
  p_output1[100]=6;
  p_output1[101]=6;
  p_output1[102]=6;
  p_output1[103]=6;
  p_output1[104]=6;
  p_output1[105]=6;
  p_output1[106]=14;
  p_output1[107]=14;
  p_output1[108]=14;
  p_output1[109]=14;
  p_output1[110]=14;
  p_output1[111]=14;
  p_output1[112]=14;
  p_output1[113]=14;
  p_output1[114]=14;
  p_output1[115]=14;
  p_output1[116]=14;
  p_output1[117]=14;
  p_output1[118]=14;
  p_output1[119]=15;
  p_output1[120]=15;
  p_output1[121]=15;
  p_output1[122]=15;
  p_output1[123]=15;
  p_output1[124]=15;
  p_output1[125]=15;
  p_output1[126]=15;
  p_output1[127]=15;
  p_output1[128]=15;
  p_output1[129]=15;
  p_output1[130]=15;
  p_output1[131]=15;
  p_output1[132]=16;
  p_output1[133]=16;
  p_output1[134]=16;
  p_output1[135]=16;
  p_output1[136]=16;
  p_output1[137]=16;
  p_output1[138]=16;
  p_output1[139]=16;
  p_output1[140]=16;
  p_output1[141]=16;
  p_output1[142]=16;
  p_output1[143]=16;
  p_output1[144]=16;
  p_output1[145]=17;
  p_output1[146]=17;
  p_output1[147]=17;
  p_output1[148]=17;
  p_output1[149]=17;
  p_output1[150]=17;
  p_output1[151]=17;
  p_output1[152]=17;
  p_output1[153]=17;
  p_output1[154]=17;
  p_output1[155]=17;
  p_output1[156]=17;
  p_output1[157]=17;
  p_output1[158]=18;
  p_output1[159]=18;
  p_output1[160]=18;
  p_output1[161]=18;
  p_output1[162]=18;
  p_output1[163]=18;
  p_output1[164]=18;
  p_output1[165]=18;
  p_output1[166]=18;
  p_output1[167]=18;
  p_output1[168]=18;
  p_output1[169]=18;
  p_output1[170]=18;
  p_output1[171]=19;
  p_output1[172]=19;
  p_output1[173]=19;
  p_output1[174]=19;
  p_output1[175]=19;
  p_output1[176]=19;
  p_output1[177]=19;
  p_output1[178]=19;
  p_output1[179]=19;
  p_output1[180]=19;
  p_output1[181]=19;
  p_output1[182]=19;
  p_output1[183]=19;
  p_output1[184]=20;
  p_output1[185]=20;
  p_output1[186]=20;
  p_output1[187]=20;
  p_output1[188]=20;
  p_output1[189]=20;
  p_output1[190]=20;
  p_output1[191]=20;
  p_output1[192]=20;
  p_output1[193]=20;
  p_output1[194]=20;
  p_output1[195]=20;
  p_output1[196]=20;
  p_output1[197]=4;
  p_output1[198]=5;
  p_output1[199]=6;
  p_output1[200]=14;
  p_output1[201]=15;
  p_output1[202]=16;
  p_output1[203]=17;
  p_output1[204]=18;
  p_output1[205]=19;
  p_output1[206]=20;
  p_output1[207]=24;
  p_output1[208]=25;
  p_output1[209]=26;
  p_output1[210]=34;
  p_output1[211]=35;
  p_output1[212]=36;
  p_output1[213]=37;
  p_output1[214]=38;
  p_output1[215]=39;
  p_output1[216]=40;
  p_output1[217]=4;
  p_output1[218]=5;
  p_output1[219]=6;
  p_output1[220]=14;
  p_output1[221]=15;
  p_output1[222]=16;
  p_output1[223]=17;
  p_output1[224]=18;
  p_output1[225]=19;
  p_output1[226]=20;
  p_output1[227]=24;
  p_output1[228]=25;
  p_output1[229]=26;
  p_output1[230]=34;
  p_output1[231]=35;
  p_output1[232]=36;
  p_output1[233]=37;
  p_output1[234]=38;
  p_output1[235]=39;
  p_output1[236]=40;
  p_output1[237]=5;
  p_output1[238]=6;
  p_output1[239]=14;
  p_output1[240]=15;
  p_output1[241]=16;
  p_output1[242]=17;
  p_output1[243]=18;
  p_output1[244]=19;
  p_output1[245]=20;
  p_output1[246]=25;
  p_output1[247]=26;
  p_output1[248]=34;
  p_output1[249]=35;
  p_output1[250]=36;
  p_output1[251]=37;
  p_output1[252]=38;
  p_output1[253]=39;
  p_output1[254]=40;
  p_output1[255]=5;
  p_output1[256]=6;
  p_output1[257]=14;
  p_output1[258]=15;
  p_output1[259]=16;
  p_output1[260]=17;
  p_output1[261]=18;
  p_output1[262]=19;
  p_output1[263]=20;
  p_output1[264]=25;
  p_output1[265]=26;
  p_output1[266]=34;
  p_output1[267]=35;
  p_output1[268]=36;
  p_output1[269]=37;
  p_output1[270]=38;
  p_output1[271]=39;
  p_output1[272]=40;
  p_output1[273]=6;
  p_output1[274]=14;
  p_output1[275]=15;
  p_output1[276]=16;
  p_output1[277]=17;
  p_output1[278]=18;
  p_output1[279]=19;
  p_output1[280]=20;
  p_output1[281]=26;
  p_output1[282]=34;
  p_output1[283]=35;
  p_output1[284]=36;
  p_output1[285]=37;
  p_output1[286]=38;
  p_output1[287]=39;
  p_output1[288]=40;
  p_output1[289]=14;
  p_output1[290]=15;
  p_output1[291]=16;
  p_output1[292]=17;
  p_output1[293]=18;
  p_output1[294]=19;
  p_output1[295]=20;
  p_output1[296]=34;
  p_output1[297]=35;
  p_output1[298]=36;
  p_output1[299]=37;
  p_output1[300]=38;
  p_output1[301]=39;
  p_output1[302]=40;
  p_output1[303]=15;
  p_output1[304]=16;
  p_output1[305]=17;
  p_output1[306]=18;
  p_output1[307]=19;
  p_output1[308]=20;
  p_output1[309]=34;
  p_output1[310]=35;
  p_output1[311]=36;
  p_output1[312]=37;
  p_output1[313]=38;
  p_output1[314]=39;
  p_output1[315]=40;
  p_output1[316]=15;
  p_output1[317]=16;
  p_output1[318]=17;
  p_output1[319]=18;
  p_output1[320]=19;
  p_output1[321]=20;
  p_output1[322]=34;
  p_output1[323]=35;
  p_output1[324]=36;
  p_output1[325]=37;
  p_output1[326]=38;
  p_output1[327]=39;
  p_output1[328]=40;
  p_output1[329]=15;
  p_output1[330]=16;
  p_output1[331]=17;
  p_output1[332]=18;
  p_output1[333]=19;
  p_output1[334]=20;
  p_output1[335]=34;
  p_output1[336]=35;
  p_output1[337]=36;
  p_output1[338]=37;
  p_output1[339]=38;
  p_output1[340]=39;
  p_output1[341]=40;
  p_output1[342]=15;
  p_output1[343]=16;
  p_output1[344]=17;
  p_output1[345]=18;
  p_output1[346]=19;
  p_output1[347]=20;
  p_output1[348]=34;
  p_output1[349]=35;
  p_output1[350]=36;
  p_output1[351]=37;
  p_output1[352]=38;
  p_output1[353]=39;
  p_output1[354]=40;
  p_output1[355]=15;
  p_output1[356]=16;
  p_output1[357]=17;
  p_output1[358]=18;
  p_output1[359]=19;
  p_output1[360]=20;
  p_output1[361]=34;
  p_output1[362]=35;
  p_output1[363]=36;
  p_output1[364]=37;
  p_output1[365]=38;
  p_output1[366]=39;
  p_output1[367]=40;
  p_output1[368]=15;
  p_output1[369]=16;
  p_output1[370]=17;
  p_output1[371]=18;
  p_output1[372]=19;
  p_output1[373]=20;
  p_output1[374]=34;
  p_output1[375]=35;
  p_output1[376]=36;
  p_output1[377]=37;
  p_output1[378]=38;
  p_output1[379]=39;
  p_output1[380]=40;
  p_output1[381]=15;
  p_output1[382]=16;
  p_output1[383]=17;
  p_output1[384]=18;
  p_output1[385]=19;
  p_output1[386]=20;
  p_output1[387]=34;
  p_output1[388]=35;
  p_output1[389]=36;
  p_output1[390]=37;
  p_output1[391]=38;
  p_output1[392]=39;
  p_output1[393]=40;
}



void frost::gen::Js_Ce1_vec14_cassie(double *p_output1, const double *var1)
{
  // Call Subroutines
  output1(p_output1, var1);

}
