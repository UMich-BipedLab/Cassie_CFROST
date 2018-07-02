/*
 * Automatically Generated from Mathematica.
 * Fri 22 Jun 2018 14:08:30 GMT-04:00
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "frost/gen/Js_Ge_vec_cassie.hh"

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
  p_output1[0]=5;
  p_output1[1]=5;
  p_output1[2]=5;
  p_output1[3]=5;
  p_output1[4]=5;
  p_output1[5]=5;
  p_output1[6]=5;
  p_output1[7]=5;
  p_output1[8]=5;
  p_output1[9]=5;
  p_output1[10]=5;
  p_output1[11]=5;
  p_output1[12]=5;
  p_output1[13]=5;
  p_output1[14]=5;
  p_output1[15]=5;
  p_output1[16]=6;
  p_output1[17]=6;
  p_output1[18]=6;
  p_output1[19]=6;
  p_output1[20]=6;
  p_output1[21]=6;
  p_output1[22]=6;
  p_output1[23]=6;
  p_output1[24]=6;
  p_output1[25]=6;
  p_output1[26]=6;
  p_output1[27]=6;
  p_output1[28]=6;
  p_output1[29]=6;
  p_output1[30]=6;
  p_output1[31]=6;
  p_output1[32]=7;
  p_output1[33]=7;
  p_output1[34]=7;
  p_output1[35]=7;
  p_output1[36]=7;
  p_output1[37]=7;
  p_output1[38]=7;
  p_output1[39]=7;
  p_output1[40]=7;
  p_output1[41]=8;
  p_output1[42]=8;
  p_output1[43]=8;
  p_output1[44]=8;
  p_output1[45]=8;
  p_output1[46]=8;
  p_output1[47]=8;
  p_output1[48]=8;
  p_output1[49]=8;
  p_output1[50]=9;
  p_output1[51]=9;
  p_output1[52]=9;
  p_output1[53]=9;
  p_output1[54]=9;
  p_output1[55]=9;
  p_output1[56]=9;
  p_output1[57]=9;
  p_output1[58]=9;
  p_output1[59]=10;
  p_output1[60]=10;
  p_output1[61]=10;
  p_output1[62]=10;
  p_output1[63]=10;
  p_output1[64]=10;
  p_output1[65]=10;
  p_output1[66]=10;
  p_output1[67]=10;
  p_output1[68]=11;
  p_output1[69]=11;
  p_output1[70]=11;
  p_output1[71]=11;
  p_output1[72]=11;
  p_output1[73]=11;
  p_output1[74]=11;
  p_output1[75]=11;
  p_output1[76]=11;
  p_output1[77]=12;
  p_output1[78]=12;
  p_output1[79]=12;
  p_output1[80]=12;
  p_output1[81]=12;
  p_output1[82]=12;
  p_output1[83]=12;
  p_output1[84]=12;
  p_output1[85]=12;
  p_output1[86]=13;
  p_output1[87]=13;
  p_output1[88]=13;
  p_output1[89]=13;
  p_output1[90]=13;
  p_output1[91]=13;
  p_output1[92]=13;
  p_output1[93]=13;
  p_output1[94]=13;
  p_output1[95]=14;
  p_output1[96]=14;
  p_output1[97]=14;
  p_output1[98]=14;
  p_output1[99]=14;
  p_output1[100]=14;
  p_output1[101]=14;
  p_output1[102]=14;
  p_output1[103]=14;
  p_output1[104]=15;
  p_output1[105]=15;
  p_output1[106]=15;
  p_output1[107]=15;
  p_output1[108]=15;
  p_output1[109]=15;
  p_output1[110]=15;
  p_output1[111]=15;
  p_output1[112]=15;
  p_output1[113]=16;
  p_output1[114]=16;
  p_output1[115]=16;
  p_output1[116]=16;
  p_output1[117]=16;
  p_output1[118]=16;
  p_output1[119]=16;
  p_output1[120]=16;
  p_output1[121]=16;
  p_output1[122]=17;
  p_output1[123]=17;
  p_output1[124]=17;
  p_output1[125]=17;
  p_output1[126]=17;
  p_output1[127]=17;
  p_output1[128]=17;
  p_output1[129]=17;
  p_output1[130]=17;
  p_output1[131]=18;
  p_output1[132]=18;
  p_output1[133]=18;
  p_output1[134]=18;
  p_output1[135]=18;
  p_output1[136]=18;
  p_output1[137]=18;
  p_output1[138]=18;
  p_output1[139]=18;
  p_output1[140]=19;
  p_output1[141]=19;
  p_output1[142]=19;
  p_output1[143]=19;
  p_output1[144]=19;
  p_output1[145]=19;
  p_output1[146]=19;
  p_output1[147]=19;
  p_output1[148]=19;
  p_output1[149]=20;
  p_output1[150]=20;
  p_output1[151]=20;
  p_output1[152]=20;
  p_output1[153]=20;
  p_output1[154]=20;
  p_output1[155]=20;
  p_output1[156]=20;
  p_output1[157]=20;
  p_output1[158]=5;
  p_output1[159]=6;
  p_output1[160]=7;
  p_output1[161]=8;
  p_output1[162]=9;
  p_output1[163]=10;
  p_output1[164]=11;
  p_output1[165]=12;
  p_output1[166]=13;
  p_output1[167]=14;
  p_output1[168]=15;
  p_output1[169]=16;
  p_output1[170]=17;
  p_output1[171]=18;
  p_output1[172]=19;
  p_output1[173]=20;
  p_output1[174]=5;
  p_output1[175]=6;
  p_output1[176]=7;
  p_output1[177]=8;
  p_output1[178]=9;
  p_output1[179]=10;
  p_output1[180]=11;
  p_output1[181]=12;
  p_output1[182]=13;
  p_output1[183]=14;
  p_output1[184]=15;
  p_output1[185]=16;
  p_output1[186]=17;
  p_output1[187]=18;
  p_output1[188]=19;
  p_output1[189]=20;
  p_output1[190]=5;
  p_output1[191]=6;
  p_output1[192]=7;
  p_output1[193]=8;
  p_output1[194]=9;
  p_output1[195]=10;
  p_output1[196]=11;
  p_output1[197]=12;
  p_output1[198]=13;
  p_output1[199]=5;
  p_output1[200]=6;
  p_output1[201]=7;
  p_output1[202]=8;
  p_output1[203]=9;
  p_output1[204]=10;
  p_output1[205]=11;
  p_output1[206]=12;
  p_output1[207]=13;
  p_output1[208]=5;
  p_output1[209]=6;
  p_output1[210]=7;
  p_output1[211]=8;
  p_output1[212]=9;
  p_output1[213]=10;
  p_output1[214]=11;
  p_output1[215]=12;
  p_output1[216]=13;
  p_output1[217]=5;
  p_output1[218]=6;
  p_output1[219]=7;
  p_output1[220]=8;
  p_output1[221]=9;
  p_output1[222]=10;
  p_output1[223]=11;
  p_output1[224]=12;
  p_output1[225]=13;
  p_output1[226]=5;
  p_output1[227]=6;
  p_output1[228]=7;
  p_output1[229]=8;
  p_output1[230]=9;
  p_output1[231]=10;
  p_output1[232]=11;
  p_output1[233]=12;
  p_output1[234]=13;
  p_output1[235]=5;
  p_output1[236]=6;
  p_output1[237]=7;
  p_output1[238]=8;
  p_output1[239]=9;
  p_output1[240]=10;
  p_output1[241]=11;
  p_output1[242]=12;
  p_output1[243]=13;
  p_output1[244]=5;
  p_output1[245]=6;
  p_output1[246]=7;
  p_output1[247]=8;
  p_output1[248]=9;
  p_output1[249]=10;
  p_output1[250]=11;
  p_output1[251]=12;
  p_output1[252]=13;
  p_output1[253]=5;
  p_output1[254]=6;
  p_output1[255]=14;
  p_output1[256]=15;
  p_output1[257]=16;
  p_output1[258]=17;
  p_output1[259]=18;
  p_output1[260]=19;
  p_output1[261]=20;
  p_output1[262]=5;
  p_output1[263]=6;
  p_output1[264]=14;
  p_output1[265]=15;
  p_output1[266]=16;
  p_output1[267]=17;
  p_output1[268]=18;
  p_output1[269]=19;
  p_output1[270]=20;
  p_output1[271]=5;
  p_output1[272]=6;
  p_output1[273]=14;
  p_output1[274]=15;
  p_output1[275]=16;
  p_output1[276]=17;
  p_output1[277]=18;
  p_output1[278]=19;
  p_output1[279]=20;
  p_output1[280]=5;
  p_output1[281]=6;
  p_output1[282]=14;
  p_output1[283]=15;
  p_output1[284]=16;
  p_output1[285]=17;
  p_output1[286]=18;
  p_output1[287]=19;
  p_output1[288]=20;
  p_output1[289]=5;
  p_output1[290]=6;
  p_output1[291]=14;
  p_output1[292]=15;
  p_output1[293]=16;
  p_output1[294]=17;
  p_output1[295]=18;
  p_output1[296]=19;
  p_output1[297]=20;
  p_output1[298]=5;
  p_output1[299]=6;
  p_output1[300]=14;
  p_output1[301]=15;
  p_output1[302]=16;
  p_output1[303]=17;
  p_output1[304]=18;
  p_output1[305]=19;
  p_output1[306]=20;
  p_output1[307]=5;
  p_output1[308]=6;
  p_output1[309]=14;
  p_output1[310]=15;
  p_output1[311]=16;
  p_output1[312]=17;
  p_output1[313]=18;
  p_output1[314]=19;
  p_output1[315]=20;
}



void frost::gen::Js_Ge_vec_cassie(double *p_output1, const double *var1)
{
  // Call Subroutines
  output1(p_output1, var1);

}
