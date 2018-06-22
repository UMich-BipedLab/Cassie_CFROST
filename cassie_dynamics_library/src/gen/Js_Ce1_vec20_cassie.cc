/*
 * Automatically Generated from Mathematica.
 * Wed 20 Jun 2018 12:31:54 GMT-04:00
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "frost/gen/Js_Ce1_vec20_cassie.hh"

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
  p_output1[136]=17;
  p_output1[137]=17;
  p_output1[138]=17;
  p_output1[139]=17;
  p_output1[140]=17;
  p_output1[141]=17;
  p_output1[142]=18;
  p_output1[143]=18;
  p_output1[144]=18;
  p_output1[145]=18;
  p_output1[146]=19;
  p_output1[147]=19;
  p_output1[148]=4;
  p_output1[149]=5;
  p_output1[150]=6;
  p_output1[151]=14;
  p_output1[152]=15;
  p_output1[153]=16;
  p_output1[154]=17;
  p_output1[155]=18;
  p_output1[156]=19;
  p_output1[157]=20;
  p_output1[158]=24;
  p_output1[159]=25;
  p_output1[160]=26;
  p_output1[161]=34;
  p_output1[162]=35;
  p_output1[163]=36;
  p_output1[164]=37;
  p_output1[165]=38;
  p_output1[166]=39;
  p_output1[167]=40;
  p_output1[168]=4;
  p_output1[169]=5;
  p_output1[170]=6;
  p_output1[171]=14;
  p_output1[172]=15;
  p_output1[173]=16;
  p_output1[174]=17;
  p_output1[175]=18;
  p_output1[176]=19;
  p_output1[177]=20;
  p_output1[178]=24;
  p_output1[179]=25;
  p_output1[180]=26;
  p_output1[181]=34;
  p_output1[182]=35;
  p_output1[183]=36;
  p_output1[184]=37;
  p_output1[185]=38;
  p_output1[186]=39;
  p_output1[187]=40;
  p_output1[188]=5;
  p_output1[189]=6;
  p_output1[190]=14;
  p_output1[191]=15;
  p_output1[192]=16;
  p_output1[193]=17;
  p_output1[194]=18;
  p_output1[195]=19;
  p_output1[196]=20;
  p_output1[197]=25;
  p_output1[198]=26;
  p_output1[199]=34;
  p_output1[200]=35;
  p_output1[201]=36;
  p_output1[202]=37;
  p_output1[203]=38;
  p_output1[204]=39;
  p_output1[205]=40;
  p_output1[206]=5;
  p_output1[207]=6;
  p_output1[208]=14;
  p_output1[209]=15;
  p_output1[210]=16;
  p_output1[211]=17;
  p_output1[212]=18;
  p_output1[213]=19;
  p_output1[214]=20;
  p_output1[215]=25;
  p_output1[216]=26;
  p_output1[217]=34;
  p_output1[218]=35;
  p_output1[219]=36;
  p_output1[220]=37;
  p_output1[221]=38;
  p_output1[222]=39;
  p_output1[223]=40;
  p_output1[224]=6;
  p_output1[225]=14;
  p_output1[226]=15;
  p_output1[227]=16;
  p_output1[228]=17;
  p_output1[229]=18;
  p_output1[230]=19;
  p_output1[231]=20;
  p_output1[232]=26;
  p_output1[233]=34;
  p_output1[234]=35;
  p_output1[235]=36;
  p_output1[236]=37;
  p_output1[237]=38;
  p_output1[238]=39;
  p_output1[239]=40;
  p_output1[240]=14;
  p_output1[241]=15;
  p_output1[242]=16;
  p_output1[243]=17;
  p_output1[244]=18;
  p_output1[245]=19;
  p_output1[246]=20;
  p_output1[247]=34;
  p_output1[248]=35;
  p_output1[249]=36;
  p_output1[250]=37;
  p_output1[251]=38;
  p_output1[252]=39;
  p_output1[253]=40;
  p_output1[254]=15;
  p_output1[255]=16;
  p_output1[256]=17;
  p_output1[257]=18;
  p_output1[258]=19;
  p_output1[259]=20;
  p_output1[260]=35;
  p_output1[261]=36;
  p_output1[262]=37;
  p_output1[263]=38;
  p_output1[264]=39;
  p_output1[265]=40;
  p_output1[266]=16;
  p_output1[267]=17;
  p_output1[268]=18;
  p_output1[269]=19;
  p_output1[270]=20;
  p_output1[271]=36;
  p_output1[272]=37;
  p_output1[273]=38;
  p_output1[274]=39;
  p_output1[275]=40;
  p_output1[276]=17;
  p_output1[277]=18;
  p_output1[278]=19;
  p_output1[279]=20;
  p_output1[280]=37;
  p_output1[281]=38;
  p_output1[282]=39;
  p_output1[283]=40;
  p_output1[284]=18;
  p_output1[285]=19;
  p_output1[286]=20;
  p_output1[287]=38;
  p_output1[288]=39;
  p_output1[289]=40;
  p_output1[290]=19;
  p_output1[291]=20;
  p_output1[292]=39;
  p_output1[293]=40;
  p_output1[294]=20;
  p_output1[295]=40;
}



void frost::gen::Js_Ce1_vec20_cassie(double *p_output1, const double *var1)
{
  // Call Subroutines
  output1(p_output1, var1);

}
