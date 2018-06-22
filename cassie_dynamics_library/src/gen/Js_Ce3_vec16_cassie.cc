/*
 * Automatically Generated from Mathematica.
 * Wed 20 Jun 2018 13:10:08 GMT-04:00
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "frost/gen/Js_Ce3_vec16_cassie.hh"

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
  p_output1[118]=17;
  p_output1[119]=17;
  p_output1[120]=17;
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
  p_output1[139]=18;
  p_output1[140]=18;
  p_output1[141]=18;
  p_output1[142]=18;
  p_output1[143]=18;
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
  p_output1[162]=19;
  p_output1[163]=19;
  p_output1[164]=19;
  p_output1[165]=19;
  p_output1[166]=19;
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
  p_output1[185]=20;
  p_output1[186]=20;
  p_output1[187]=20;
  p_output1[188]=20;
  p_output1[189]=20;
  p_output1[190]=4;
  p_output1[191]=5;
  p_output1[192]=6;
  p_output1[193]=14;
  p_output1[194]=15;
  p_output1[195]=16;
  p_output1[196]=17;
  p_output1[197]=18;
  p_output1[198]=19;
  p_output1[199]=20;
  p_output1[200]=21;
  p_output1[201]=22;
  p_output1[202]=36;
  p_output1[203]=4;
  p_output1[204]=5;
  p_output1[205]=6;
  p_output1[206]=14;
  p_output1[207]=15;
  p_output1[208]=16;
  p_output1[209]=17;
  p_output1[210]=18;
  p_output1[211]=19;
  p_output1[212]=20;
  p_output1[213]=21;
  p_output1[214]=22;
  p_output1[215]=23;
  p_output1[216]=24;
  p_output1[217]=36;
  p_output1[218]=4;
  p_output1[219]=5;
  p_output1[220]=6;
  p_output1[221]=14;
  p_output1[222]=15;
  p_output1[223]=16;
  p_output1[224]=17;
  p_output1[225]=18;
  p_output1[226]=19;
  p_output1[227]=20;
  p_output1[228]=21;
  p_output1[229]=22;
  p_output1[230]=23;
  p_output1[231]=24;
  p_output1[232]=25;
  p_output1[233]=36;
  p_output1[234]=4;
  p_output1[235]=5;
  p_output1[236]=6;
  p_output1[237]=14;
  p_output1[238]=15;
  p_output1[239]=16;
  p_output1[240]=17;
  p_output1[241]=18;
  p_output1[242]=19;
  p_output1[243]=20;
  p_output1[244]=21;
  p_output1[245]=22;
  p_output1[246]=23;
  p_output1[247]=24;
  p_output1[248]=25;
  p_output1[249]=26;
  p_output1[250]=36;
  p_output1[251]=4;
  p_output1[252]=5;
  p_output1[253]=6;
  p_output1[254]=14;
  p_output1[255]=15;
  p_output1[256]=16;
  p_output1[257]=17;
  p_output1[258]=18;
  p_output1[259]=19;
  p_output1[260]=20;
  p_output1[261]=21;
  p_output1[262]=22;
  p_output1[263]=23;
  p_output1[264]=24;
  p_output1[265]=25;
  p_output1[266]=26;
  p_output1[267]=34;
  p_output1[268]=36;
  p_output1[269]=4;
  p_output1[270]=5;
  p_output1[271]=6;
  p_output1[272]=14;
  p_output1[273]=15;
  p_output1[274]=16;
  p_output1[275]=17;
  p_output1[276]=18;
  p_output1[277]=19;
  p_output1[278]=20;
  p_output1[279]=21;
  p_output1[280]=22;
  p_output1[281]=23;
  p_output1[282]=24;
  p_output1[283]=25;
  p_output1[284]=26;
  p_output1[285]=34;
  p_output1[286]=35;
  p_output1[287]=36;
  p_output1[288]=4;
  p_output1[289]=5;
  p_output1[290]=6;
  p_output1[291]=14;
  p_output1[292]=15;
  p_output1[293]=16;
  p_output1[294]=17;
  p_output1[295]=18;
  p_output1[296]=19;
  p_output1[297]=20;
  p_output1[298]=21;
  p_output1[299]=22;
  p_output1[300]=23;
  p_output1[301]=24;
  p_output1[302]=25;
  p_output1[303]=26;
  p_output1[304]=34;
  p_output1[305]=35;
  p_output1[306]=36;
  p_output1[307]=37;
  p_output1[308]=38;
  p_output1[309]=39;
  p_output1[310]=40;
  p_output1[311]=4;
  p_output1[312]=5;
  p_output1[313]=6;
  p_output1[314]=14;
  p_output1[315]=15;
  p_output1[316]=16;
  p_output1[317]=17;
  p_output1[318]=18;
  p_output1[319]=19;
  p_output1[320]=20;
  p_output1[321]=21;
  p_output1[322]=22;
  p_output1[323]=23;
  p_output1[324]=24;
  p_output1[325]=25;
  p_output1[326]=26;
  p_output1[327]=34;
  p_output1[328]=35;
  p_output1[329]=36;
  p_output1[330]=37;
  p_output1[331]=38;
  p_output1[332]=39;
  p_output1[333]=40;
  p_output1[334]=4;
  p_output1[335]=5;
  p_output1[336]=6;
  p_output1[337]=14;
  p_output1[338]=15;
  p_output1[339]=16;
  p_output1[340]=17;
  p_output1[341]=18;
  p_output1[342]=19;
  p_output1[343]=20;
  p_output1[344]=21;
  p_output1[345]=22;
  p_output1[346]=23;
  p_output1[347]=24;
  p_output1[348]=25;
  p_output1[349]=26;
  p_output1[350]=34;
  p_output1[351]=35;
  p_output1[352]=36;
  p_output1[353]=37;
  p_output1[354]=38;
  p_output1[355]=39;
  p_output1[356]=40;
  p_output1[357]=4;
  p_output1[358]=5;
  p_output1[359]=6;
  p_output1[360]=14;
  p_output1[361]=15;
  p_output1[362]=16;
  p_output1[363]=17;
  p_output1[364]=18;
  p_output1[365]=19;
  p_output1[366]=20;
  p_output1[367]=21;
  p_output1[368]=22;
  p_output1[369]=23;
  p_output1[370]=24;
  p_output1[371]=25;
  p_output1[372]=26;
  p_output1[373]=34;
  p_output1[374]=35;
  p_output1[375]=36;
  p_output1[376]=37;
  p_output1[377]=38;
  p_output1[378]=39;
  p_output1[379]=40;
}



void frost::gen::Js_Ce3_vec16_cassie(double *p_output1, const double *var1)
{
  // Call Subroutines
  output1(p_output1, var1);

}
