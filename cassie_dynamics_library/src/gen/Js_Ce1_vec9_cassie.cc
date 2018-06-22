/*
 * Automatically Generated from Mathematica.
 * Wed 20 Jun 2018 12:29:02 GMT-04:00
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "frost/gen/Js_Ce1_vec9_cassie.hh"

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
  p_output1[136]=9;
  p_output1[137]=10;
  p_output1[138]=10;
  p_output1[139]=10;
  p_output1[140]=10;
  p_output1[141]=10;
  p_output1[142]=10;
  p_output1[143]=10;
  p_output1[144]=10;
  p_output1[145]=10;
  p_output1[146]=11;
  p_output1[147]=11;
  p_output1[148]=11;
  p_output1[149]=11;
  p_output1[150]=11;
  p_output1[151]=11;
  p_output1[152]=11;
  p_output1[153]=11;
  p_output1[154]=11;
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
  p_output1[173]=4;
  p_output1[174]=5;
  p_output1[175]=6;
  p_output1[176]=7;
  p_output1[177]=8;
  p_output1[178]=9;
  p_output1[179]=10;
  p_output1[180]=11;
  p_output1[181]=12;
  p_output1[182]=13;
  p_output1[183]=24;
  p_output1[184]=25;
  p_output1[185]=26;
  p_output1[186]=27;
  p_output1[187]=28;
  p_output1[188]=29;
  p_output1[189]=30;
  p_output1[190]=31;
  p_output1[191]=32;
  p_output1[192]=33;
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
  p_output1[203]=24;
  p_output1[204]=25;
  p_output1[205]=26;
  p_output1[206]=27;
  p_output1[207]=28;
  p_output1[208]=29;
  p_output1[209]=30;
  p_output1[210]=31;
  p_output1[211]=32;
  p_output1[212]=33;
  p_output1[213]=5;
  p_output1[214]=6;
  p_output1[215]=7;
  p_output1[216]=8;
  p_output1[217]=9;
  p_output1[218]=10;
  p_output1[219]=11;
  p_output1[220]=12;
  p_output1[221]=13;
  p_output1[222]=25;
  p_output1[223]=26;
  p_output1[224]=27;
  p_output1[225]=28;
  p_output1[226]=29;
  p_output1[227]=30;
  p_output1[228]=31;
  p_output1[229]=32;
  p_output1[230]=33;
  p_output1[231]=5;
  p_output1[232]=6;
  p_output1[233]=7;
  p_output1[234]=8;
  p_output1[235]=9;
  p_output1[236]=10;
  p_output1[237]=11;
  p_output1[238]=12;
  p_output1[239]=13;
  p_output1[240]=25;
  p_output1[241]=26;
  p_output1[242]=27;
  p_output1[243]=28;
  p_output1[244]=29;
  p_output1[245]=30;
  p_output1[246]=31;
  p_output1[247]=32;
  p_output1[248]=33;
  p_output1[249]=6;
  p_output1[250]=7;
  p_output1[251]=8;
  p_output1[252]=9;
  p_output1[253]=10;
  p_output1[254]=11;
  p_output1[255]=12;
  p_output1[256]=13;
  p_output1[257]=26;
  p_output1[258]=27;
  p_output1[259]=28;
  p_output1[260]=29;
  p_output1[261]=30;
  p_output1[262]=31;
  p_output1[263]=32;
  p_output1[264]=33;
  p_output1[265]=7;
  p_output1[266]=8;
  p_output1[267]=9;
  p_output1[268]=10;
  p_output1[269]=11;
  p_output1[270]=12;
  p_output1[271]=13;
  p_output1[272]=27;
  p_output1[273]=28;
  p_output1[274]=29;
  p_output1[275]=30;
  p_output1[276]=31;
  p_output1[277]=32;
  p_output1[278]=33;
  p_output1[279]=8;
  p_output1[280]=9;
  p_output1[281]=10;
  p_output1[282]=11;
  p_output1[283]=12;
  p_output1[284]=13;
  p_output1[285]=28;
  p_output1[286]=29;
  p_output1[287]=30;
  p_output1[288]=31;
  p_output1[289]=32;
  p_output1[290]=33;
  p_output1[291]=9;
  p_output1[292]=10;
  p_output1[293]=11;
  p_output1[294]=12;
  p_output1[295]=13;
  p_output1[296]=29;
  p_output1[297]=30;
  p_output1[298]=31;
  p_output1[299]=32;
  p_output1[300]=33;
  p_output1[301]=10;
  p_output1[302]=11;
  p_output1[303]=12;
  p_output1[304]=13;
  p_output1[305]=29;
  p_output1[306]=30;
  p_output1[307]=31;
  p_output1[308]=32;
  p_output1[309]=33;
  p_output1[310]=10;
  p_output1[311]=11;
  p_output1[312]=12;
  p_output1[313]=13;
  p_output1[314]=29;
  p_output1[315]=30;
  p_output1[316]=31;
  p_output1[317]=32;
  p_output1[318]=33;
  p_output1[319]=10;
  p_output1[320]=11;
  p_output1[321]=12;
  p_output1[322]=13;
  p_output1[323]=29;
  p_output1[324]=30;
  p_output1[325]=31;
  p_output1[326]=32;
  p_output1[327]=33;
  p_output1[328]=10;
  p_output1[329]=11;
  p_output1[330]=12;
  p_output1[331]=13;
  p_output1[332]=29;
  p_output1[333]=30;
  p_output1[334]=31;
  p_output1[335]=32;
  p_output1[336]=33;
  p_output1[337]=10;
  p_output1[338]=11;
  p_output1[339]=12;
  p_output1[340]=13;
  p_output1[341]=29;
  p_output1[342]=30;
  p_output1[343]=31;
  p_output1[344]=32;
  p_output1[345]=33;
}



void frost::gen::Js_Ce1_vec9_cassie(double *p_output1, const double *var1)
{
  // Call Subroutines
  output1(p_output1, var1);

}
