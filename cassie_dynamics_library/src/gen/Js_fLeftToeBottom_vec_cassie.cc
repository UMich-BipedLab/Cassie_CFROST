/*
 * Automatically Generated from Mathematica.
 * Fri 22 Jun 2018 14:08:30 GMT-04:00
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "frost/gen/Js_fLeftToeBottom_vec_cassie.hh"

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
  p_output1[1]=2;
  p_output1[2]=3;
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
  p_output1[13]=4;
  p_output1[14]=4;
  p_output1[15]=4;
  p_output1[16]=4;
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
  p_output1[28]=5;
  p_output1[29]=5;
  p_output1[30]=5;
  p_output1[31]=5;
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
  p_output1[44]=6;
  p_output1[45]=6;
  p_output1[46]=6;
  p_output1[47]=7;
  p_output1[48]=7;
  p_output1[49]=7;
  p_output1[50]=7;
  p_output1[51]=7;
  p_output1[52]=7;
  p_output1[53]=7;
  p_output1[54]=7;
  p_output1[55]=7;
  p_output1[56]=7;
  p_output1[57]=7;
  p_output1[58]=7;
  p_output1[59]=7;
  p_output1[60]=7;
  p_output1[61]=7;
  p_output1[62]=8;
  p_output1[63]=8;
  p_output1[64]=8;
  p_output1[65]=8;
  p_output1[66]=8;
  p_output1[67]=8;
  p_output1[68]=8;
  p_output1[69]=8;
  p_output1[70]=8;
  p_output1[71]=8;
  p_output1[72]=8;
  p_output1[73]=8;
  p_output1[74]=8;
  p_output1[75]=8;
  p_output1[76]=9;
  p_output1[77]=9;
  p_output1[78]=9;
  p_output1[79]=9;
  p_output1[80]=9;
  p_output1[81]=9;
  p_output1[82]=9;
  p_output1[83]=9;
  p_output1[84]=9;
  p_output1[85]=9;
  p_output1[86]=9;
  p_output1[87]=9;
  p_output1[88]=9;
  p_output1[89]=9;
  p_output1[90]=10;
  p_output1[91]=10;
  p_output1[92]=10;
  p_output1[93]=10;
  p_output1[94]=10;
  p_output1[95]=10;
  p_output1[96]=10;
  p_output1[97]=10;
  p_output1[98]=10;
  p_output1[99]=10;
  p_output1[100]=10;
  p_output1[101]=10;
  p_output1[102]=10;
  p_output1[103]=10;
  p_output1[104]=11;
  p_output1[105]=11;
  p_output1[106]=11;
  p_output1[107]=11;
  p_output1[108]=11;
  p_output1[109]=11;
  p_output1[110]=11;
  p_output1[111]=11;
  p_output1[112]=11;
  p_output1[113]=11;
  p_output1[114]=11;
  p_output1[115]=11;
  p_output1[116]=11;
  p_output1[117]=11;
  p_output1[118]=12;
  p_output1[119]=12;
  p_output1[120]=12;
  p_output1[121]=12;
  p_output1[122]=12;
  p_output1[123]=12;
  p_output1[124]=12;
  p_output1[125]=12;
  p_output1[126]=12;
  p_output1[127]=12;
  p_output1[128]=12;
  p_output1[129]=12;
  p_output1[130]=12;
  p_output1[131]=12;
  p_output1[132]=13;
  p_output1[133]=13;
  p_output1[134]=13;
  p_output1[135]=13;
  p_output1[136]=13;
  p_output1[137]=13;
  p_output1[138]=13;
  p_output1[139]=13;
  p_output1[140]=13;
  p_output1[141]=13;
  p_output1[142]=13;
  p_output1[143]=13;
  p_output1[144]=13;
  p_output1[145]=13;
  p_output1[146]=21;
  p_output1[147]=22;
  p_output1[148]=23;
  p_output1[149]=4;
  p_output1[150]=5;
  p_output1[151]=6;
  p_output1[152]=7;
  p_output1[153]=8;
  p_output1[154]=9;
  p_output1[155]=10;
  p_output1[156]=11;
  p_output1[157]=12;
  p_output1[158]=13;
  p_output1[159]=21;
  p_output1[160]=22;
  p_output1[161]=24;
  p_output1[162]=25;
  p_output1[163]=4;
  p_output1[164]=5;
  p_output1[165]=6;
  p_output1[166]=7;
  p_output1[167]=8;
  p_output1[168]=9;
  p_output1[169]=10;
  p_output1[170]=11;
  p_output1[171]=12;
  p_output1[172]=13;
  p_output1[173]=21;
  p_output1[174]=22;
  p_output1[175]=23;
  p_output1[176]=24;
  p_output1[177]=25;
  p_output1[178]=4;
  p_output1[179]=5;
  p_output1[180]=6;
  p_output1[181]=7;
  p_output1[182]=8;
  p_output1[183]=9;
  p_output1[184]=10;
  p_output1[185]=11;
  p_output1[186]=12;
  p_output1[187]=13;
  p_output1[188]=21;
  p_output1[189]=22;
  p_output1[190]=23;
  p_output1[191]=24;
  p_output1[192]=25;
  p_output1[193]=4;
  p_output1[194]=5;
  p_output1[195]=6;
  p_output1[196]=7;
  p_output1[197]=8;
  p_output1[198]=9;
  p_output1[199]=10;
  p_output1[200]=11;
  p_output1[201]=12;
  p_output1[202]=13;
  p_output1[203]=21;
  p_output1[204]=22;
  p_output1[205]=23;
  p_output1[206]=24;
  p_output1[207]=25;
  p_output1[208]=4;
  p_output1[209]=5;
  p_output1[210]=6;
  p_output1[211]=7;
  p_output1[212]=8;
  p_output1[213]=9;
  p_output1[214]=10;
  p_output1[215]=11;
  p_output1[216]=12;
  p_output1[217]=13;
  p_output1[218]=21;
  p_output1[219]=22;
  p_output1[220]=23;
  p_output1[221]=25;
  p_output1[222]=4;
  p_output1[223]=5;
  p_output1[224]=6;
  p_output1[225]=7;
  p_output1[226]=8;
  p_output1[227]=9;
  p_output1[228]=10;
  p_output1[229]=11;
  p_output1[230]=12;
  p_output1[231]=13;
  p_output1[232]=21;
  p_output1[233]=22;
  p_output1[234]=23;
  p_output1[235]=24;
  p_output1[236]=4;
  p_output1[237]=5;
  p_output1[238]=6;
  p_output1[239]=7;
  p_output1[240]=8;
  p_output1[241]=9;
  p_output1[242]=10;
  p_output1[243]=11;
  p_output1[244]=12;
  p_output1[245]=13;
  p_output1[246]=21;
  p_output1[247]=22;
  p_output1[248]=23;
  p_output1[249]=24;
  p_output1[250]=4;
  p_output1[251]=5;
  p_output1[252]=6;
  p_output1[253]=7;
  p_output1[254]=8;
  p_output1[255]=9;
  p_output1[256]=10;
  p_output1[257]=11;
  p_output1[258]=12;
  p_output1[259]=13;
  p_output1[260]=21;
  p_output1[261]=22;
  p_output1[262]=23;
  p_output1[263]=24;
  p_output1[264]=4;
  p_output1[265]=5;
  p_output1[266]=6;
  p_output1[267]=7;
  p_output1[268]=8;
  p_output1[269]=9;
  p_output1[270]=10;
  p_output1[271]=11;
  p_output1[272]=12;
  p_output1[273]=13;
  p_output1[274]=21;
  p_output1[275]=22;
  p_output1[276]=23;
  p_output1[277]=24;
  p_output1[278]=4;
  p_output1[279]=5;
  p_output1[280]=6;
  p_output1[281]=7;
  p_output1[282]=8;
  p_output1[283]=9;
  p_output1[284]=10;
  p_output1[285]=11;
  p_output1[286]=12;
  p_output1[287]=13;
  p_output1[288]=21;
  p_output1[289]=22;
  p_output1[290]=23;
  p_output1[291]=24;
}



void frost::gen::Js_fLeftToeBottom_vec_cassie(double *p_output1, const double *var1)
{
  // Call Subroutines
  output1(p_output1, var1);

}
