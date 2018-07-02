/*
 * Automatically Generated from Mathematica.
 * Wed 20 Jun 2018 12:29:16 GMT-04:00
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "frost/gen/Js_Ce1_vec10_cassie.hh"

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
  p_output1[106]=7;
  p_output1[107]=7;
  p_output1[108]=7;
  p_output1[109]=7;
  p_output1[110]=7;
  p_output1[111]=7;
  p_output1[112]=7;
  p_output1[113]=7;
  p_output1[114]=7;
  p_output1[115]=7;
  p_output1[116]=7;
  p_output1[117]=7;
  p_output1[118]=8;
  p_output1[119]=8;
  p_output1[120]=8;
  p_output1[121]=8;
  p_output1[122]=8;
  p_output1[123]=8;
  p_output1[124]=8;
  p_output1[125]=8;
  p_output1[126]=8;
  p_output1[127]=8;
  p_output1[128]=9;
  p_output1[129]=9;
  p_output1[130]=9;
  p_output1[131]=9;
  p_output1[132]=9;
  p_output1[133]=9;
  p_output1[134]=9;
  p_output1[135]=9;
  p_output1[136]=10;
  p_output1[137]=10;
  p_output1[138]=10;
  p_output1[139]=10;
  p_output1[140]=10;
  p_output1[141]=10;
  p_output1[142]=10;
  p_output1[143]=11;
  p_output1[144]=11;
  p_output1[145]=11;
  p_output1[146]=11;
  p_output1[147]=11;
  p_output1[148]=11;
  p_output1[149]=11;
  p_output1[150]=12;
  p_output1[151]=12;
  p_output1[152]=12;
  p_output1[153]=12;
  p_output1[154]=12;
  p_output1[155]=12;
  p_output1[156]=12;
  p_output1[157]=13;
  p_output1[158]=13;
  p_output1[159]=13;
  p_output1[160]=13;
  p_output1[161]=13;
  p_output1[162]=13;
  p_output1[163]=13;
  p_output1[164]=4;
  p_output1[165]=5;
  p_output1[166]=6;
  p_output1[167]=7;
  p_output1[168]=8;
  p_output1[169]=9;
  p_output1[170]=10;
  p_output1[171]=11;
  p_output1[172]=12;
  p_output1[173]=13;
  p_output1[174]=24;
  p_output1[175]=25;
  p_output1[176]=26;
  p_output1[177]=27;
  p_output1[178]=28;
  p_output1[179]=29;
  p_output1[180]=30;
  p_output1[181]=31;
  p_output1[182]=32;
  p_output1[183]=33;
  p_output1[184]=4;
  p_output1[185]=5;
  p_output1[186]=6;
  p_output1[187]=7;
  p_output1[188]=8;
  p_output1[189]=9;
  p_output1[190]=10;
  p_output1[191]=11;
  p_output1[192]=12;
  p_output1[193]=13;
  p_output1[194]=24;
  p_output1[195]=25;
  p_output1[196]=26;
  p_output1[197]=27;
  p_output1[198]=28;
  p_output1[199]=29;
  p_output1[200]=30;
  p_output1[201]=31;
  p_output1[202]=32;
  p_output1[203]=33;
  p_output1[204]=5;
  p_output1[205]=6;
  p_output1[206]=7;
  p_output1[207]=8;
  p_output1[208]=9;
  p_output1[209]=10;
  p_output1[210]=11;
  p_output1[211]=12;
  p_output1[212]=13;
  p_output1[213]=25;
  p_output1[214]=26;
  p_output1[215]=27;
  p_output1[216]=28;
  p_output1[217]=29;
  p_output1[218]=30;
  p_output1[219]=31;
  p_output1[220]=32;
  p_output1[221]=33;
  p_output1[222]=5;
  p_output1[223]=6;
  p_output1[224]=7;
  p_output1[225]=8;
  p_output1[226]=9;
  p_output1[227]=10;
  p_output1[228]=11;
  p_output1[229]=12;
  p_output1[230]=13;
  p_output1[231]=25;
  p_output1[232]=26;
  p_output1[233]=27;
  p_output1[234]=28;
  p_output1[235]=29;
  p_output1[236]=30;
  p_output1[237]=31;
  p_output1[238]=32;
  p_output1[239]=33;
  p_output1[240]=6;
  p_output1[241]=7;
  p_output1[242]=8;
  p_output1[243]=9;
  p_output1[244]=10;
  p_output1[245]=11;
  p_output1[246]=12;
  p_output1[247]=13;
  p_output1[248]=26;
  p_output1[249]=27;
  p_output1[250]=28;
  p_output1[251]=29;
  p_output1[252]=30;
  p_output1[253]=31;
  p_output1[254]=32;
  p_output1[255]=33;
  p_output1[256]=7;
  p_output1[257]=8;
  p_output1[258]=9;
  p_output1[259]=10;
  p_output1[260]=11;
  p_output1[261]=12;
  p_output1[262]=13;
  p_output1[263]=27;
  p_output1[264]=28;
  p_output1[265]=29;
  p_output1[266]=30;
  p_output1[267]=31;
  p_output1[268]=32;
  p_output1[269]=33;
  p_output1[270]=8;
  p_output1[271]=9;
  p_output1[272]=10;
  p_output1[273]=11;
  p_output1[274]=12;
  p_output1[275]=13;
  p_output1[276]=28;
  p_output1[277]=29;
  p_output1[278]=30;
  p_output1[279]=31;
  p_output1[280]=32;
  p_output1[281]=33;
  p_output1[282]=9;
  p_output1[283]=10;
  p_output1[284]=11;
  p_output1[285]=12;
  p_output1[286]=13;
  p_output1[287]=29;
  p_output1[288]=30;
  p_output1[289]=31;
  p_output1[290]=32;
  p_output1[291]=33;
  p_output1[292]=10;
  p_output1[293]=11;
  p_output1[294]=12;
  p_output1[295]=13;
  p_output1[296]=30;
  p_output1[297]=31;
  p_output1[298]=32;
  p_output1[299]=33;
  p_output1[300]=11;
  p_output1[301]=12;
  p_output1[302]=13;
  p_output1[303]=30;
  p_output1[304]=31;
  p_output1[305]=32;
  p_output1[306]=33;
  p_output1[307]=11;
  p_output1[308]=12;
  p_output1[309]=13;
  p_output1[310]=30;
  p_output1[311]=31;
  p_output1[312]=32;
  p_output1[313]=33;
  p_output1[314]=11;
  p_output1[315]=12;
  p_output1[316]=13;
  p_output1[317]=30;
  p_output1[318]=31;
  p_output1[319]=32;
  p_output1[320]=33;
  p_output1[321]=11;
  p_output1[322]=12;
  p_output1[323]=13;
  p_output1[324]=30;
  p_output1[325]=31;
  p_output1[326]=32;
  p_output1[327]=33;
}



void frost::gen::Js_Ce1_vec10_cassie(double *p_output1, const double *var1)
{
  // Call Subroutines
  output1(p_output1, var1);

}
