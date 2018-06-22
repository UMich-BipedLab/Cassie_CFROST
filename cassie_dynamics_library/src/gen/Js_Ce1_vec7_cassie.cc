/*
 * Automatically Generated from Mathematica.
 * Wed 20 Jun 2018 12:28:15 GMT-04:00
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "frost/gen/Js_Ce1_vec7_cassie.hh"

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
  p_output1[118]=7;
  p_output1[119]=8;
  p_output1[120]=8;
  p_output1[121]=8;
  p_output1[122]=8;
  p_output1[123]=8;
  p_output1[124]=8;
  p_output1[125]=8;
  p_output1[126]=8;
  p_output1[127]=8;
  p_output1[128]=8;
  p_output1[129]=8;
  p_output1[130]=8;
  p_output1[131]=8;
  p_output1[132]=9;
  p_output1[133]=9;
  p_output1[134]=9;
  p_output1[135]=9;
  p_output1[136]=9;
  p_output1[137]=9;
  p_output1[138]=9;
  p_output1[139]=9;
  p_output1[140]=9;
  p_output1[141]=9;
  p_output1[142]=9;
  p_output1[143]=9;
  p_output1[144]=9;
  p_output1[145]=10;
  p_output1[146]=10;
  p_output1[147]=10;
  p_output1[148]=10;
  p_output1[149]=10;
  p_output1[150]=10;
  p_output1[151]=10;
  p_output1[152]=10;
  p_output1[153]=10;
  p_output1[154]=10;
  p_output1[155]=10;
  p_output1[156]=10;
  p_output1[157]=10;
  p_output1[158]=11;
  p_output1[159]=11;
  p_output1[160]=11;
  p_output1[161]=11;
  p_output1[162]=11;
  p_output1[163]=11;
  p_output1[164]=11;
  p_output1[165]=11;
  p_output1[166]=11;
  p_output1[167]=11;
  p_output1[168]=11;
  p_output1[169]=11;
  p_output1[170]=11;
  p_output1[171]=12;
  p_output1[172]=12;
  p_output1[173]=12;
  p_output1[174]=12;
  p_output1[175]=12;
  p_output1[176]=12;
  p_output1[177]=12;
  p_output1[178]=12;
  p_output1[179]=12;
  p_output1[180]=12;
  p_output1[181]=12;
  p_output1[182]=12;
  p_output1[183]=12;
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
  p_output1[197]=4;
  p_output1[198]=5;
  p_output1[199]=6;
  p_output1[200]=7;
  p_output1[201]=8;
  p_output1[202]=9;
  p_output1[203]=10;
  p_output1[204]=11;
  p_output1[205]=12;
  p_output1[206]=13;
  p_output1[207]=24;
  p_output1[208]=25;
  p_output1[209]=26;
  p_output1[210]=27;
  p_output1[211]=28;
  p_output1[212]=29;
  p_output1[213]=30;
  p_output1[214]=31;
  p_output1[215]=32;
  p_output1[216]=33;
  p_output1[217]=4;
  p_output1[218]=5;
  p_output1[219]=6;
  p_output1[220]=7;
  p_output1[221]=8;
  p_output1[222]=9;
  p_output1[223]=10;
  p_output1[224]=11;
  p_output1[225]=12;
  p_output1[226]=13;
  p_output1[227]=24;
  p_output1[228]=25;
  p_output1[229]=26;
  p_output1[230]=27;
  p_output1[231]=28;
  p_output1[232]=29;
  p_output1[233]=30;
  p_output1[234]=31;
  p_output1[235]=32;
  p_output1[236]=33;
  p_output1[237]=5;
  p_output1[238]=6;
  p_output1[239]=7;
  p_output1[240]=8;
  p_output1[241]=9;
  p_output1[242]=10;
  p_output1[243]=11;
  p_output1[244]=12;
  p_output1[245]=13;
  p_output1[246]=25;
  p_output1[247]=26;
  p_output1[248]=27;
  p_output1[249]=28;
  p_output1[250]=29;
  p_output1[251]=30;
  p_output1[252]=31;
  p_output1[253]=32;
  p_output1[254]=33;
  p_output1[255]=5;
  p_output1[256]=6;
  p_output1[257]=7;
  p_output1[258]=8;
  p_output1[259]=9;
  p_output1[260]=10;
  p_output1[261]=11;
  p_output1[262]=12;
  p_output1[263]=13;
  p_output1[264]=25;
  p_output1[265]=26;
  p_output1[266]=27;
  p_output1[267]=28;
  p_output1[268]=29;
  p_output1[269]=30;
  p_output1[270]=31;
  p_output1[271]=32;
  p_output1[272]=33;
  p_output1[273]=6;
  p_output1[274]=7;
  p_output1[275]=8;
  p_output1[276]=9;
  p_output1[277]=10;
  p_output1[278]=11;
  p_output1[279]=12;
  p_output1[280]=13;
  p_output1[281]=26;
  p_output1[282]=27;
  p_output1[283]=28;
  p_output1[284]=29;
  p_output1[285]=30;
  p_output1[286]=31;
  p_output1[287]=32;
  p_output1[288]=33;
  p_output1[289]=7;
  p_output1[290]=8;
  p_output1[291]=9;
  p_output1[292]=10;
  p_output1[293]=11;
  p_output1[294]=12;
  p_output1[295]=13;
  p_output1[296]=27;
  p_output1[297]=28;
  p_output1[298]=29;
  p_output1[299]=30;
  p_output1[300]=31;
  p_output1[301]=32;
  p_output1[302]=33;
  p_output1[303]=8;
  p_output1[304]=9;
  p_output1[305]=10;
  p_output1[306]=11;
  p_output1[307]=12;
  p_output1[308]=13;
  p_output1[309]=27;
  p_output1[310]=28;
  p_output1[311]=29;
  p_output1[312]=30;
  p_output1[313]=31;
  p_output1[314]=32;
  p_output1[315]=33;
  p_output1[316]=8;
  p_output1[317]=9;
  p_output1[318]=10;
  p_output1[319]=11;
  p_output1[320]=12;
  p_output1[321]=13;
  p_output1[322]=27;
  p_output1[323]=28;
  p_output1[324]=29;
  p_output1[325]=30;
  p_output1[326]=31;
  p_output1[327]=32;
  p_output1[328]=33;
  p_output1[329]=8;
  p_output1[330]=9;
  p_output1[331]=10;
  p_output1[332]=11;
  p_output1[333]=12;
  p_output1[334]=13;
  p_output1[335]=27;
  p_output1[336]=28;
  p_output1[337]=29;
  p_output1[338]=30;
  p_output1[339]=31;
  p_output1[340]=32;
  p_output1[341]=33;
  p_output1[342]=8;
  p_output1[343]=9;
  p_output1[344]=10;
  p_output1[345]=11;
  p_output1[346]=12;
  p_output1[347]=13;
  p_output1[348]=27;
  p_output1[349]=28;
  p_output1[350]=29;
  p_output1[351]=30;
  p_output1[352]=31;
  p_output1[353]=32;
  p_output1[354]=33;
  p_output1[355]=8;
  p_output1[356]=9;
  p_output1[357]=10;
  p_output1[358]=11;
  p_output1[359]=12;
  p_output1[360]=13;
  p_output1[361]=27;
  p_output1[362]=28;
  p_output1[363]=29;
  p_output1[364]=30;
  p_output1[365]=31;
  p_output1[366]=32;
  p_output1[367]=33;
  p_output1[368]=8;
  p_output1[369]=9;
  p_output1[370]=10;
  p_output1[371]=11;
  p_output1[372]=12;
  p_output1[373]=13;
  p_output1[374]=27;
  p_output1[375]=28;
  p_output1[376]=29;
  p_output1[377]=30;
  p_output1[378]=31;
  p_output1[379]=32;
  p_output1[380]=33;
  p_output1[381]=8;
  p_output1[382]=9;
  p_output1[383]=10;
  p_output1[384]=11;
  p_output1[385]=12;
  p_output1[386]=13;
  p_output1[387]=27;
  p_output1[388]=28;
  p_output1[389]=29;
  p_output1[390]=30;
  p_output1[391]=31;
  p_output1[392]=32;
  p_output1[393]=33;
}



void frost::gen::Js_Ce1_vec7_cassie(double *p_output1, const double *var1)
{
  // Call Subroutines
  output1(p_output1, var1);

}
