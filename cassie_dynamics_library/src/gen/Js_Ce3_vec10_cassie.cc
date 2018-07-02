/*
 * Automatically Generated from Mathematica.
 * Wed 20 Jun 2018 13:08:13 GMT-04:00
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "frost/gen/Js_Ce3_vec10_cassie.hh"

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
  p_output1[44]=7;
  p_output1[45]=7;
  p_output1[46]=7;
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
  p_output1[61]=8;
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
  p_output1[76]=8;
  p_output1[77]=8;
  p_output1[78]=8;
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
  p_output1[90]=9;
  p_output1[91]=9;
  p_output1[92]=9;
  p_output1[93]=9;
  p_output1[94]=9;
  p_output1[95]=9;
  p_output1[96]=9;
  p_output1[97]=9;
  p_output1[98]=10;
  p_output1[99]=10;
  p_output1[100]=10;
  p_output1[101]=10;
  p_output1[102]=10;
  p_output1[103]=10;
  p_output1[104]=10;
  p_output1[105]=10;
  p_output1[106]=10;
  p_output1[107]=10;
  p_output1[108]=10;
  p_output1[109]=10;
  p_output1[110]=10;
  p_output1[111]=10;
  p_output1[112]=10;
  p_output1[113]=10;
  p_output1[114]=10;
  p_output1[115]=10;
  p_output1[116]=10;
  p_output1[117]=10;
  p_output1[118]=11;
  p_output1[119]=11;
  p_output1[120]=11;
  p_output1[121]=11;
  p_output1[122]=11;
  p_output1[123]=11;
  p_output1[124]=11;
  p_output1[125]=11;
  p_output1[126]=11;
  p_output1[127]=11;
  p_output1[128]=11;
  p_output1[129]=11;
  p_output1[130]=11;
  p_output1[131]=11;
  p_output1[132]=11;
  p_output1[133]=11;
  p_output1[134]=11;
  p_output1[135]=11;
  p_output1[136]=11;
  p_output1[137]=11;
  p_output1[138]=11;
  p_output1[139]=11;
  p_output1[140]=11;
  p_output1[141]=12;
  p_output1[142]=12;
  p_output1[143]=12;
  p_output1[144]=12;
  p_output1[145]=12;
  p_output1[146]=12;
  p_output1[147]=12;
  p_output1[148]=12;
  p_output1[149]=12;
  p_output1[150]=12;
  p_output1[151]=12;
  p_output1[152]=12;
  p_output1[153]=12;
  p_output1[154]=12;
  p_output1[155]=12;
  p_output1[156]=12;
  p_output1[157]=12;
  p_output1[158]=12;
  p_output1[159]=12;
  p_output1[160]=12;
  p_output1[161]=12;
  p_output1[162]=12;
  p_output1[163]=12;
  p_output1[164]=13;
  p_output1[165]=13;
  p_output1[166]=13;
  p_output1[167]=13;
  p_output1[168]=13;
  p_output1[169]=13;
  p_output1[170]=13;
  p_output1[171]=13;
  p_output1[172]=13;
  p_output1[173]=13;
  p_output1[174]=13;
  p_output1[175]=13;
  p_output1[176]=13;
  p_output1[177]=13;
  p_output1[178]=13;
  p_output1[179]=13;
  p_output1[180]=13;
  p_output1[181]=13;
  p_output1[182]=13;
  p_output1[183]=13;
  p_output1[184]=13;
  p_output1[185]=13;
  p_output1[186]=13;
  p_output1[187]=4;
  p_output1[188]=5;
  p_output1[189]=6;
  p_output1[190]=7;
  p_output1[191]=8;
  p_output1[192]=9;
  p_output1[193]=10;
  p_output1[194]=11;
  p_output1[195]=12;
  p_output1[196]=13;
  p_output1[197]=21;
  p_output1[198]=22;
  p_output1[199]=30;
  p_output1[200]=4;
  p_output1[201]=5;
  p_output1[202]=6;
  p_output1[203]=7;
  p_output1[204]=8;
  p_output1[205]=9;
  p_output1[206]=10;
  p_output1[207]=11;
  p_output1[208]=12;
  p_output1[209]=13;
  p_output1[210]=21;
  p_output1[211]=22;
  p_output1[212]=23;
  p_output1[213]=24;
  p_output1[214]=30;
  p_output1[215]=4;
  p_output1[216]=5;
  p_output1[217]=6;
  p_output1[218]=7;
  p_output1[219]=8;
  p_output1[220]=9;
  p_output1[221]=10;
  p_output1[222]=11;
  p_output1[223]=12;
  p_output1[224]=13;
  p_output1[225]=21;
  p_output1[226]=22;
  p_output1[227]=23;
  p_output1[228]=24;
  p_output1[229]=25;
  p_output1[230]=30;
  p_output1[231]=4;
  p_output1[232]=5;
  p_output1[233]=6;
  p_output1[234]=7;
  p_output1[235]=8;
  p_output1[236]=9;
  p_output1[237]=10;
  p_output1[238]=11;
  p_output1[239]=12;
  p_output1[240]=13;
  p_output1[241]=21;
  p_output1[242]=22;
  p_output1[243]=23;
  p_output1[244]=24;
  p_output1[245]=25;
  p_output1[246]=26;
  p_output1[247]=30;
  p_output1[248]=4;
  p_output1[249]=5;
  p_output1[250]=6;
  p_output1[251]=7;
  p_output1[252]=8;
  p_output1[253]=9;
  p_output1[254]=10;
  p_output1[255]=11;
  p_output1[256]=12;
  p_output1[257]=13;
  p_output1[258]=21;
  p_output1[259]=22;
  p_output1[260]=23;
  p_output1[261]=24;
  p_output1[262]=25;
  p_output1[263]=26;
  p_output1[264]=27;
  p_output1[265]=30;
  p_output1[266]=4;
  p_output1[267]=5;
  p_output1[268]=6;
  p_output1[269]=7;
  p_output1[270]=8;
  p_output1[271]=9;
  p_output1[272]=10;
  p_output1[273]=11;
  p_output1[274]=12;
  p_output1[275]=13;
  p_output1[276]=21;
  p_output1[277]=22;
  p_output1[278]=23;
  p_output1[279]=24;
  p_output1[280]=25;
  p_output1[281]=26;
  p_output1[282]=27;
  p_output1[283]=28;
  p_output1[284]=30;
  p_output1[285]=4;
  p_output1[286]=5;
  p_output1[287]=6;
  p_output1[288]=7;
  p_output1[289]=8;
  p_output1[290]=9;
  p_output1[291]=10;
  p_output1[292]=11;
  p_output1[293]=12;
  p_output1[294]=13;
  p_output1[295]=21;
  p_output1[296]=22;
  p_output1[297]=23;
  p_output1[298]=24;
  p_output1[299]=25;
  p_output1[300]=26;
  p_output1[301]=27;
  p_output1[302]=28;
  p_output1[303]=29;
  p_output1[304]=30;
  p_output1[305]=4;
  p_output1[306]=5;
  p_output1[307]=6;
  p_output1[308]=7;
  p_output1[309]=8;
  p_output1[310]=9;
  p_output1[311]=10;
  p_output1[312]=11;
  p_output1[313]=12;
  p_output1[314]=13;
  p_output1[315]=21;
  p_output1[316]=22;
  p_output1[317]=23;
  p_output1[318]=24;
  p_output1[319]=25;
  p_output1[320]=26;
  p_output1[321]=27;
  p_output1[322]=28;
  p_output1[323]=29;
  p_output1[324]=30;
  p_output1[325]=31;
  p_output1[326]=32;
  p_output1[327]=33;
  p_output1[328]=4;
  p_output1[329]=5;
  p_output1[330]=6;
  p_output1[331]=7;
  p_output1[332]=8;
  p_output1[333]=9;
  p_output1[334]=10;
  p_output1[335]=11;
  p_output1[336]=12;
  p_output1[337]=13;
  p_output1[338]=21;
  p_output1[339]=22;
  p_output1[340]=23;
  p_output1[341]=24;
  p_output1[342]=25;
  p_output1[343]=26;
  p_output1[344]=27;
  p_output1[345]=28;
  p_output1[346]=29;
  p_output1[347]=30;
  p_output1[348]=31;
  p_output1[349]=32;
  p_output1[350]=33;
  p_output1[351]=4;
  p_output1[352]=5;
  p_output1[353]=6;
  p_output1[354]=7;
  p_output1[355]=8;
  p_output1[356]=9;
  p_output1[357]=10;
  p_output1[358]=11;
  p_output1[359]=12;
  p_output1[360]=13;
  p_output1[361]=21;
  p_output1[362]=22;
  p_output1[363]=23;
  p_output1[364]=24;
  p_output1[365]=25;
  p_output1[366]=26;
  p_output1[367]=27;
  p_output1[368]=28;
  p_output1[369]=29;
  p_output1[370]=30;
  p_output1[371]=31;
  p_output1[372]=32;
  p_output1[373]=33;
}



void frost::gen::Js_Ce3_vec10_cassie(double *p_output1, const double *var1)
{
  // Call Subroutines
  output1(p_output1, var1);

}
