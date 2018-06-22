/*
 * Automatically Generated from Mathematica.
 * Wed 20 Jun 2018 13:07:13 GMT-04:00
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "frost/gen/Js_Ce3_vec7_cassie.hh"

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
  p_output1[79]=8;
  p_output1[80]=8;
  p_output1[81]=8;
  p_output1[82]=8;
  p_output1[83]=8;
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
  p_output1[98]=9;
  p_output1[99]=9;
  p_output1[100]=9;
  p_output1[101]=9;
  p_output1[102]=9;
  p_output1[103]=9;
  p_output1[104]=9;
  p_output1[105]=9;
  p_output1[106]=9;
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
  p_output1[118]=10;
  p_output1[119]=10;
  p_output1[120]=10;
  p_output1[121]=10;
  p_output1[122]=10;
  p_output1[123]=10;
  p_output1[124]=10;
  p_output1[125]=10;
  p_output1[126]=10;
  p_output1[127]=10;
  p_output1[128]=10;
  p_output1[129]=10;
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
  p_output1[141]=11;
  p_output1[142]=11;
  p_output1[143]=11;
  p_output1[144]=11;
  p_output1[145]=11;
  p_output1[146]=11;
  p_output1[147]=11;
  p_output1[148]=11;
  p_output1[149]=11;
  p_output1[150]=11;
  p_output1[151]=11;
  p_output1[152]=11;
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
  p_output1[164]=12;
  p_output1[165]=12;
  p_output1[166]=12;
  p_output1[167]=12;
  p_output1[168]=12;
  p_output1[169]=12;
  p_output1[170]=12;
  p_output1[171]=12;
  p_output1[172]=12;
  p_output1[173]=12;
  p_output1[174]=12;
  p_output1[175]=12;
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
  p_output1[187]=13;
  p_output1[188]=13;
  p_output1[189]=13;
  p_output1[190]=13;
  p_output1[191]=13;
  p_output1[192]=13;
  p_output1[193]=13;
  p_output1[194]=13;
  p_output1[195]=13;
  p_output1[196]=13;
  p_output1[197]=13;
  p_output1[198]=13;
  p_output1[199]=4;
  p_output1[200]=5;
  p_output1[201]=6;
  p_output1[202]=7;
  p_output1[203]=8;
  p_output1[204]=9;
  p_output1[205]=10;
  p_output1[206]=11;
  p_output1[207]=12;
  p_output1[208]=13;
  p_output1[209]=21;
  p_output1[210]=22;
  p_output1[211]=27;
  p_output1[212]=4;
  p_output1[213]=5;
  p_output1[214]=6;
  p_output1[215]=7;
  p_output1[216]=8;
  p_output1[217]=9;
  p_output1[218]=10;
  p_output1[219]=11;
  p_output1[220]=12;
  p_output1[221]=13;
  p_output1[222]=21;
  p_output1[223]=22;
  p_output1[224]=23;
  p_output1[225]=24;
  p_output1[226]=27;
  p_output1[227]=4;
  p_output1[228]=5;
  p_output1[229]=6;
  p_output1[230]=7;
  p_output1[231]=8;
  p_output1[232]=9;
  p_output1[233]=10;
  p_output1[234]=11;
  p_output1[235]=12;
  p_output1[236]=13;
  p_output1[237]=21;
  p_output1[238]=22;
  p_output1[239]=23;
  p_output1[240]=24;
  p_output1[241]=25;
  p_output1[242]=27;
  p_output1[243]=4;
  p_output1[244]=5;
  p_output1[245]=6;
  p_output1[246]=7;
  p_output1[247]=8;
  p_output1[248]=9;
  p_output1[249]=10;
  p_output1[250]=11;
  p_output1[251]=12;
  p_output1[252]=13;
  p_output1[253]=21;
  p_output1[254]=22;
  p_output1[255]=23;
  p_output1[256]=24;
  p_output1[257]=25;
  p_output1[258]=26;
  p_output1[259]=27;
  p_output1[260]=4;
  p_output1[261]=5;
  p_output1[262]=6;
  p_output1[263]=7;
  p_output1[264]=8;
  p_output1[265]=9;
  p_output1[266]=10;
  p_output1[267]=11;
  p_output1[268]=12;
  p_output1[269]=13;
  p_output1[270]=21;
  p_output1[271]=22;
  p_output1[272]=23;
  p_output1[273]=24;
  p_output1[274]=25;
  p_output1[275]=26;
  p_output1[276]=27;
  p_output1[277]=28;
  p_output1[278]=29;
  p_output1[279]=30;
  p_output1[280]=31;
  p_output1[281]=32;
  p_output1[282]=33;
  p_output1[283]=4;
  p_output1[284]=5;
  p_output1[285]=6;
  p_output1[286]=7;
  p_output1[287]=8;
  p_output1[288]=9;
  p_output1[289]=10;
  p_output1[290]=11;
  p_output1[291]=12;
  p_output1[292]=13;
  p_output1[293]=21;
  p_output1[294]=22;
  p_output1[295]=23;
  p_output1[296]=24;
  p_output1[297]=25;
  p_output1[298]=26;
  p_output1[299]=27;
  p_output1[300]=28;
  p_output1[301]=29;
  p_output1[302]=30;
  p_output1[303]=31;
  p_output1[304]=32;
  p_output1[305]=33;
  p_output1[306]=4;
  p_output1[307]=5;
  p_output1[308]=6;
  p_output1[309]=7;
  p_output1[310]=8;
  p_output1[311]=9;
  p_output1[312]=10;
  p_output1[313]=11;
  p_output1[314]=12;
  p_output1[315]=13;
  p_output1[316]=21;
  p_output1[317]=22;
  p_output1[318]=23;
  p_output1[319]=24;
  p_output1[320]=25;
  p_output1[321]=26;
  p_output1[322]=27;
  p_output1[323]=28;
  p_output1[324]=29;
  p_output1[325]=30;
  p_output1[326]=31;
  p_output1[327]=32;
  p_output1[328]=33;
  p_output1[329]=4;
  p_output1[330]=5;
  p_output1[331]=6;
  p_output1[332]=7;
  p_output1[333]=8;
  p_output1[334]=9;
  p_output1[335]=10;
  p_output1[336]=11;
  p_output1[337]=12;
  p_output1[338]=13;
  p_output1[339]=21;
  p_output1[340]=22;
  p_output1[341]=23;
  p_output1[342]=24;
  p_output1[343]=25;
  p_output1[344]=26;
  p_output1[345]=27;
  p_output1[346]=28;
  p_output1[347]=29;
  p_output1[348]=30;
  p_output1[349]=31;
  p_output1[350]=32;
  p_output1[351]=33;
  p_output1[352]=4;
  p_output1[353]=5;
  p_output1[354]=6;
  p_output1[355]=7;
  p_output1[356]=8;
  p_output1[357]=9;
  p_output1[358]=10;
  p_output1[359]=11;
  p_output1[360]=12;
  p_output1[361]=13;
  p_output1[362]=21;
  p_output1[363]=22;
  p_output1[364]=23;
  p_output1[365]=24;
  p_output1[366]=25;
  p_output1[367]=26;
  p_output1[368]=27;
  p_output1[369]=28;
  p_output1[370]=29;
  p_output1[371]=30;
  p_output1[372]=31;
  p_output1[373]=32;
  p_output1[374]=33;
  p_output1[375]=4;
  p_output1[376]=5;
  p_output1[377]=6;
  p_output1[378]=7;
  p_output1[379]=8;
  p_output1[380]=9;
  p_output1[381]=10;
  p_output1[382]=11;
  p_output1[383]=12;
  p_output1[384]=13;
  p_output1[385]=21;
  p_output1[386]=22;
  p_output1[387]=23;
  p_output1[388]=24;
  p_output1[389]=25;
  p_output1[390]=26;
  p_output1[391]=27;
  p_output1[392]=28;
  p_output1[393]=29;
  p_output1[394]=30;
  p_output1[395]=31;
  p_output1[396]=32;
  p_output1[397]=33;
}



void frost::gen::Js_Ce3_vec7_cassie(double *p_output1, const double *var1)
{
  // Call Subroutines
  output1(p_output1, var1);

}
