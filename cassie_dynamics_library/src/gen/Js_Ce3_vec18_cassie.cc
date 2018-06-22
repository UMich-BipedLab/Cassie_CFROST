/*
 * Automatically Generated from Mathematica.
 * Wed 20 Jun 2018 13:10:33 GMT-04:00
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "frost/gen/Js_Ce3_vec18_cassie.hh"

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
  p_output1[0]=4;
  p_output1[1]=4;
  p_output1[2]=4;
  p_output1[3]=4;
  p_output1[4]=4;
  p_output1[5]=4;
  p_output1[6]=4;
  p_output1[7]=4;
  p_output1[8]=4;
  p_output1[9]=4;
  p_output1[10]=4;
  p_output1[11]=4;
  p_output1[12]=4;
  p_output1[13]=5;
  p_output1[14]=5;
  p_output1[15]=5;
  p_output1[16]=5;
  p_output1[17]=5;
  p_output1[18]=5;
  p_output1[19]=5;
  p_output1[20]=5;
  p_output1[21]=5;
  p_output1[22]=5;
  p_output1[23]=5;
  p_output1[24]=5;
  p_output1[25]=5;
  p_output1[26]=5;
  p_output1[27]=5;
  p_output1[28]=6;
  p_output1[29]=6;
  p_output1[30]=6;
  p_output1[31]=6;
  p_output1[32]=6;
  p_output1[33]=6;
  p_output1[34]=6;
  p_output1[35]=6;
  p_output1[36]=6;
  p_output1[37]=6;
  p_output1[38]=6;
  p_output1[39]=6;
  p_output1[40]=6;
  p_output1[41]=6;
  p_output1[42]=6;
  p_output1[43]=6;
  p_output1[44]=14;
  p_output1[45]=14;
  p_output1[46]=14;
  p_output1[47]=14;
  p_output1[48]=14;
  p_output1[49]=14;
  p_output1[50]=14;
  p_output1[51]=14;
  p_output1[52]=14;
  p_output1[53]=14;
  p_output1[54]=14;
  p_output1[55]=14;
  p_output1[56]=14;
  p_output1[57]=14;
  p_output1[58]=14;
  p_output1[59]=14;
  p_output1[60]=14;
  p_output1[61]=15;
  p_output1[62]=15;
  p_output1[63]=15;
  p_output1[64]=15;
  p_output1[65]=15;
  p_output1[66]=15;
  p_output1[67]=15;
  p_output1[68]=15;
  p_output1[69]=15;
  p_output1[70]=15;
  p_output1[71]=15;
  p_output1[72]=15;
  p_output1[73]=15;
  p_output1[74]=15;
  p_output1[75]=15;
  p_output1[76]=15;
  p_output1[77]=15;
  p_output1[78]=15;
  p_output1[79]=16;
  p_output1[80]=16;
  p_output1[81]=16;
  p_output1[82]=16;
  p_output1[83]=16;
  p_output1[84]=16;
  p_output1[85]=16;
  p_output1[86]=16;
  p_output1[87]=16;
  p_output1[88]=16;
  p_output1[89]=16;
  p_output1[90]=16;
  p_output1[91]=16;
  p_output1[92]=16;
  p_output1[93]=16;
  p_output1[94]=16;
  p_output1[95]=16;
  p_output1[96]=16;
  p_output1[97]=16;
  p_output1[98]=17;
  p_output1[99]=17;
  p_output1[100]=17;
  p_output1[101]=17;
  p_output1[102]=17;
  p_output1[103]=17;
  p_output1[104]=17;
  p_output1[105]=17;
  p_output1[106]=17;
  p_output1[107]=17;
  p_output1[108]=17;
  p_output1[109]=17;
  p_output1[110]=17;
  p_output1[111]=17;
  p_output1[112]=17;
  p_output1[113]=17;
  p_output1[114]=17;
  p_output1[115]=17;
  p_output1[116]=17;
  p_output1[117]=17;
  p_output1[118]=18;
  p_output1[119]=18;
  p_output1[120]=18;
  p_output1[121]=18;
  p_output1[122]=18;
  p_output1[123]=18;
  p_output1[124]=18;
  p_output1[125]=18;
  p_output1[126]=18;
  p_output1[127]=18;
  p_output1[128]=18;
  p_output1[129]=18;
  p_output1[130]=18;
  p_output1[131]=18;
  p_output1[132]=18;
  p_output1[133]=18;
  p_output1[134]=18;
  p_output1[135]=18;
  p_output1[136]=18;
  p_output1[137]=18;
  p_output1[138]=18;
  p_output1[139]=19;
  p_output1[140]=19;
  p_output1[141]=19;
  p_output1[142]=19;
  p_output1[143]=19;
  p_output1[144]=19;
  p_output1[145]=19;
  p_output1[146]=19;
  p_output1[147]=19;
  p_output1[148]=19;
  p_output1[149]=19;
  p_output1[150]=19;
  p_output1[151]=19;
  p_output1[152]=19;
  p_output1[153]=19;
  p_output1[154]=19;
  p_output1[155]=19;
  p_output1[156]=19;
  p_output1[157]=19;
  p_output1[158]=19;
  p_output1[159]=19;
  p_output1[160]=19;
  p_output1[161]=19;
  p_output1[162]=20;
  p_output1[163]=20;
  p_output1[164]=20;
  p_output1[165]=20;
  p_output1[166]=20;
  p_output1[167]=20;
  p_output1[168]=20;
  p_output1[169]=20;
  p_output1[170]=20;
  p_output1[171]=20;
  p_output1[172]=20;
  p_output1[173]=20;
  p_output1[174]=20;
  p_output1[175]=20;
  p_output1[176]=20;
  p_output1[177]=20;
  p_output1[178]=20;
  p_output1[179]=20;
  p_output1[180]=20;
  p_output1[181]=20;
  p_output1[182]=20;
  p_output1[183]=20;
  p_output1[184]=20;
  p_output1[185]=4;
  p_output1[186]=5;
  p_output1[187]=6;
  p_output1[188]=14;
  p_output1[189]=15;
  p_output1[190]=16;
  p_output1[191]=17;
  p_output1[192]=18;
  p_output1[193]=19;
  p_output1[194]=20;
  p_output1[195]=21;
  p_output1[196]=22;
  p_output1[197]=38;
  p_output1[198]=4;
  p_output1[199]=5;
  p_output1[200]=6;
  p_output1[201]=14;
  p_output1[202]=15;
  p_output1[203]=16;
  p_output1[204]=17;
  p_output1[205]=18;
  p_output1[206]=19;
  p_output1[207]=20;
  p_output1[208]=21;
  p_output1[209]=22;
  p_output1[210]=23;
  p_output1[211]=24;
  p_output1[212]=38;
  p_output1[213]=4;
  p_output1[214]=5;
  p_output1[215]=6;
  p_output1[216]=14;
  p_output1[217]=15;
  p_output1[218]=16;
  p_output1[219]=17;
  p_output1[220]=18;
  p_output1[221]=19;
  p_output1[222]=20;
  p_output1[223]=21;
  p_output1[224]=22;
  p_output1[225]=23;
  p_output1[226]=24;
  p_output1[227]=25;
  p_output1[228]=38;
  p_output1[229]=4;
  p_output1[230]=5;
  p_output1[231]=6;
  p_output1[232]=14;
  p_output1[233]=15;
  p_output1[234]=16;
  p_output1[235]=17;
  p_output1[236]=18;
  p_output1[237]=19;
  p_output1[238]=20;
  p_output1[239]=21;
  p_output1[240]=22;
  p_output1[241]=23;
  p_output1[242]=24;
  p_output1[243]=25;
  p_output1[244]=26;
  p_output1[245]=38;
  p_output1[246]=4;
  p_output1[247]=5;
  p_output1[248]=6;
  p_output1[249]=14;
  p_output1[250]=15;
  p_output1[251]=16;
  p_output1[252]=17;
  p_output1[253]=18;
  p_output1[254]=19;
  p_output1[255]=20;
  p_output1[256]=21;
  p_output1[257]=22;
  p_output1[258]=23;
  p_output1[259]=24;
  p_output1[260]=25;
  p_output1[261]=26;
  p_output1[262]=34;
  p_output1[263]=38;
  p_output1[264]=4;
  p_output1[265]=5;
  p_output1[266]=6;
  p_output1[267]=14;
  p_output1[268]=15;
  p_output1[269]=16;
  p_output1[270]=17;
  p_output1[271]=18;
  p_output1[272]=19;
  p_output1[273]=20;
  p_output1[274]=21;
  p_output1[275]=22;
  p_output1[276]=23;
  p_output1[277]=24;
  p_output1[278]=25;
  p_output1[279]=26;
  p_output1[280]=34;
  p_output1[281]=35;
  p_output1[282]=38;
  p_output1[283]=4;
  p_output1[284]=5;
  p_output1[285]=6;
  p_output1[286]=14;
  p_output1[287]=15;
  p_output1[288]=16;
  p_output1[289]=17;
  p_output1[290]=18;
  p_output1[291]=19;
  p_output1[292]=20;
  p_output1[293]=21;
  p_output1[294]=22;
  p_output1[295]=23;
  p_output1[296]=24;
  p_output1[297]=25;
  p_output1[298]=26;
  p_output1[299]=34;
  p_output1[300]=35;
  p_output1[301]=36;
  p_output1[302]=38;
  p_output1[303]=4;
  p_output1[304]=5;
  p_output1[305]=6;
  p_output1[306]=14;
  p_output1[307]=15;
  p_output1[308]=16;
  p_output1[309]=17;
  p_output1[310]=18;
  p_output1[311]=19;
  p_output1[312]=20;
  p_output1[313]=21;
  p_output1[314]=22;
  p_output1[315]=23;
  p_output1[316]=24;
  p_output1[317]=25;
  p_output1[318]=26;
  p_output1[319]=34;
  p_output1[320]=35;
  p_output1[321]=36;
  p_output1[322]=37;
  p_output1[323]=38;
  p_output1[324]=4;
  p_output1[325]=5;
  p_output1[326]=6;
  p_output1[327]=14;
  p_output1[328]=15;
  p_output1[329]=16;
  p_output1[330]=17;
  p_output1[331]=18;
  p_output1[332]=19;
  p_output1[333]=20;
  p_output1[334]=21;
  p_output1[335]=22;
  p_output1[336]=23;
  p_output1[337]=24;
  p_output1[338]=25;
  p_output1[339]=26;
  p_output1[340]=34;
  p_output1[341]=35;
  p_output1[342]=36;
  p_output1[343]=37;
  p_output1[344]=38;
  p_output1[345]=39;
  p_output1[346]=40;
  p_output1[347]=4;
  p_output1[348]=5;
  p_output1[349]=6;
  p_output1[350]=14;
  p_output1[351]=15;
  p_output1[352]=16;
  p_output1[353]=17;
  p_output1[354]=18;
  p_output1[355]=19;
  p_output1[356]=20;
  p_output1[357]=21;
  p_output1[358]=22;
  p_output1[359]=23;
  p_output1[360]=24;
  p_output1[361]=25;
  p_output1[362]=26;
  p_output1[363]=34;
  p_output1[364]=35;
  p_output1[365]=36;
  p_output1[366]=37;
  p_output1[367]=38;
  p_output1[368]=39;
  p_output1[369]=40;
}



void frost::gen::Js_Ce3_vec18_cassie(double *p_output1, const double *var1)
{
  // Call Subroutines
  output1(p_output1, var1);

}
