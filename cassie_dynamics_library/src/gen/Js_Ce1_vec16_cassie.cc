/*
 * Automatically Generated from Mathematica.
 * Wed 20 Jun 2018 12:31:14 GMT-04:00
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "frost/gen/Js_Ce1_vec16_cassie.hh"

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
  p_output1[118]=15;
  p_output1[119]=15;
  p_output1[120]=15;
  p_output1[121]=15;
  p_output1[122]=15;
  p_output1[123]=15;
  p_output1[124]=15;
  p_output1[125]=15;
  p_output1[126]=15;
  p_output1[127]=15;
  p_output1[128]=16;
  p_output1[129]=16;
  p_output1[130]=16;
  p_output1[131]=16;
  p_output1[132]=16;
  p_output1[133]=16;
  p_output1[134]=16;
  p_output1[135]=16;
  p_output1[136]=16;
  p_output1[137]=17;
  p_output1[138]=17;
  p_output1[139]=17;
  p_output1[140]=17;
  p_output1[141]=17;
  p_output1[142]=17;
  p_output1[143]=17;
  p_output1[144]=17;
  p_output1[145]=17;
  p_output1[146]=18;
  p_output1[147]=18;
  p_output1[148]=18;
  p_output1[149]=18;
  p_output1[150]=18;
  p_output1[151]=18;
  p_output1[152]=18;
  p_output1[153]=18;
  p_output1[154]=18;
  p_output1[155]=19;
  p_output1[156]=19;
  p_output1[157]=19;
  p_output1[158]=19;
  p_output1[159]=19;
  p_output1[160]=19;
  p_output1[161]=19;
  p_output1[162]=19;
  p_output1[163]=19;
  p_output1[164]=20;
  p_output1[165]=20;
  p_output1[166]=20;
  p_output1[167]=20;
  p_output1[168]=20;
  p_output1[169]=20;
  p_output1[170]=20;
  p_output1[171]=20;
  p_output1[172]=20;
  p_output1[173]=4;
  p_output1[174]=5;
  p_output1[175]=6;
  p_output1[176]=14;
  p_output1[177]=15;
  p_output1[178]=16;
  p_output1[179]=17;
  p_output1[180]=18;
  p_output1[181]=19;
  p_output1[182]=20;
  p_output1[183]=24;
  p_output1[184]=25;
  p_output1[185]=26;
  p_output1[186]=34;
  p_output1[187]=35;
  p_output1[188]=36;
  p_output1[189]=37;
  p_output1[190]=38;
  p_output1[191]=39;
  p_output1[192]=40;
  p_output1[193]=4;
  p_output1[194]=5;
  p_output1[195]=6;
  p_output1[196]=14;
  p_output1[197]=15;
  p_output1[198]=16;
  p_output1[199]=17;
  p_output1[200]=18;
  p_output1[201]=19;
  p_output1[202]=20;
  p_output1[203]=24;
  p_output1[204]=25;
  p_output1[205]=26;
  p_output1[206]=34;
  p_output1[207]=35;
  p_output1[208]=36;
  p_output1[209]=37;
  p_output1[210]=38;
  p_output1[211]=39;
  p_output1[212]=40;
  p_output1[213]=5;
  p_output1[214]=6;
  p_output1[215]=14;
  p_output1[216]=15;
  p_output1[217]=16;
  p_output1[218]=17;
  p_output1[219]=18;
  p_output1[220]=19;
  p_output1[221]=20;
  p_output1[222]=25;
  p_output1[223]=26;
  p_output1[224]=34;
  p_output1[225]=35;
  p_output1[226]=36;
  p_output1[227]=37;
  p_output1[228]=38;
  p_output1[229]=39;
  p_output1[230]=40;
  p_output1[231]=5;
  p_output1[232]=6;
  p_output1[233]=14;
  p_output1[234]=15;
  p_output1[235]=16;
  p_output1[236]=17;
  p_output1[237]=18;
  p_output1[238]=19;
  p_output1[239]=20;
  p_output1[240]=25;
  p_output1[241]=26;
  p_output1[242]=34;
  p_output1[243]=35;
  p_output1[244]=36;
  p_output1[245]=37;
  p_output1[246]=38;
  p_output1[247]=39;
  p_output1[248]=40;
  p_output1[249]=6;
  p_output1[250]=14;
  p_output1[251]=15;
  p_output1[252]=16;
  p_output1[253]=17;
  p_output1[254]=18;
  p_output1[255]=19;
  p_output1[256]=20;
  p_output1[257]=26;
  p_output1[258]=34;
  p_output1[259]=35;
  p_output1[260]=36;
  p_output1[261]=37;
  p_output1[262]=38;
  p_output1[263]=39;
  p_output1[264]=40;
  p_output1[265]=14;
  p_output1[266]=15;
  p_output1[267]=16;
  p_output1[268]=17;
  p_output1[269]=18;
  p_output1[270]=19;
  p_output1[271]=20;
  p_output1[272]=34;
  p_output1[273]=35;
  p_output1[274]=36;
  p_output1[275]=37;
  p_output1[276]=38;
  p_output1[277]=39;
  p_output1[278]=40;
  p_output1[279]=15;
  p_output1[280]=16;
  p_output1[281]=17;
  p_output1[282]=18;
  p_output1[283]=19;
  p_output1[284]=20;
  p_output1[285]=35;
  p_output1[286]=36;
  p_output1[287]=37;
  p_output1[288]=38;
  p_output1[289]=39;
  p_output1[290]=40;
  p_output1[291]=16;
  p_output1[292]=17;
  p_output1[293]=18;
  p_output1[294]=19;
  p_output1[295]=20;
  p_output1[296]=36;
  p_output1[297]=37;
  p_output1[298]=38;
  p_output1[299]=39;
  p_output1[300]=40;
  p_output1[301]=17;
  p_output1[302]=18;
  p_output1[303]=19;
  p_output1[304]=20;
  p_output1[305]=36;
  p_output1[306]=37;
  p_output1[307]=38;
  p_output1[308]=39;
  p_output1[309]=40;
  p_output1[310]=17;
  p_output1[311]=18;
  p_output1[312]=19;
  p_output1[313]=20;
  p_output1[314]=36;
  p_output1[315]=37;
  p_output1[316]=38;
  p_output1[317]=39;
  p_output1[318]=40;
  p_output1[319]=17;
  p_output1[320]=18;
  p_output1[321]=19;
  p_output1[322]=20;
  p_output1[323]=36;
  p_output1[324]=37;
  p_output1[325]=38;
  p_output1[326]=39;
  p_output1[327]=40;
  p_output1[328]=17;
  p_output1[329]=18;
  p_output1[330]=19;
  p_output1[331]=20;
  p_output1[332]=36;
  p_output1[333]=37;
  p_output1[334]=38;
  p_output1[335]=39;
  p_output1[336]=40;
  p_output1[337]=17;
  p_output1[338]=18;
  p_output1[339]=19;
  p_output1[340]=20;
  p_output1[341]=36;
  p_output1[342]=37;
  p_output1[343]=38;
  p_output1[344]=39;
  p_output1[345]=40;
}



void frost::gen::Js_Ce1_vec16_cassie(double *p_output1, const double *var1)
{
  // Call Subroutines
  output1(p_output1, var1);

}
