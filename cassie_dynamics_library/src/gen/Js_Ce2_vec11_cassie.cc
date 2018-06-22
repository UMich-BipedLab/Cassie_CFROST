/*
 * Automatically Generated from Mathematica.
 * Wed 20 Jun 2018 12:41:50 GMT-04:00
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "frost/gen/Js_Ce2_vec11_cassie.hh"

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
  p_output1[20]=1;
  p_output1[21]=1;
  p_output1[22]=1;
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
  p_output1[40]=2;
  p_output1[41]=2;
  p_output1[42]=2;
  p_output1[43]=2;
  p_output1[44]=2;
  p_output1[45]=2;
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
  p_output1[58]=3;
  p_output1[59]=3;
  p_output1[60]=3;
  p_output1[61]=3;
  p_output1[62]=3;
  p_output1[63]=3;
  p_output1[64]=3;
  p_output1[65]=3;
  p_output1[66]=3;
  p_output1[67]=3;
  p_output1[68]=3;
  p_output1[69]=4;
  p_output1[70]=4;
  p_output1[71]=4;
  p_output1[72]=4;
  p_output1[73]=4;
  p_output1[74]=4;
  p_output1[75]=4;
  p_output1[76]=4;
  p_output1[77]=4;
  p_output1[78]=4;
  p_output1[79]=4;
  p_output1[80]=4;
  p_output1[81]=4;
  p_output1[82]=4;
  p_output1[83]=4;
  p_output1[84]=4;
  p_output1[85]=4;
  p_output1[86]=4;
  p_output1[87]=4;
  p_output1[88]=4;
  p_output1[89]=4;
  p_output1[90]=4;
  p_output1[91]=4;
  p_output1[92]=5;
  p_output1[93]=5;
  p_output1[94]=5;
  p_output1[95]=5;
  p_output1[96]=5;
  p_output1[97]=5;
  p_output1[98]=5;
  p_output1[99]=5;
  p_output1[100]=5;
  p_output1[101]=5;
  p_output1[102]=5;
  p_output1[103]=5;
  p_output1[104]=5;
  p_output1[105]=5;
  p_output1[106]=5;
  p_output1[107]=5;
  p_output1[108]=5;
  p_output1[109]=5;
  p_output1[110]=5;
  p_output1[111]=5;
  p_output1[112]=5;
  p_output1[113]=5;
  p_output1[114]=5;
  p_output1[115]=6;
  p_output1[116]=6;
  p_output1[117]=6;
  p_output1[118]=6;
  p_output1[119]=6;
  p_output1[120]=6;
  p_output1[121]=6;
  p_output1[122]=6;
  p_output1[123]=6;
  p_output1[124]=6;
  p_output1[125]=6;
  p_output1[126]=6;
  p_output1[127]=6;
  p_output1[128]=6;
  p_output1[129]=6;
  p_output1[130]=6;
  p_output1[131]=6;
  p_output1[132]=6;
  p_output1[133]=6;
  p_output1[134]=6;
  p_output1[135]=6;
  p_output1[136]=6;
  p_output1[137]=6;
  p_output1[138]=7;
  p_output1[139]=7;
  p_output1[140]=7;
  p_output1[141]=7;
  p_output1[142]=7;
  p_output1[143]=7;
  p_output1[144]=7;
  p_output1[145]=7;
  p_output1[146]=7;
  p_output1[147]=7;
  p_output1[148]=7;
  p_output1[149]=7;
  p_output1[150]=7;
  p_output1[151]=7;
  p_output1[152]=7;
  p_output1[153]=7;
  p_output1[154]=7;
  p_output1[155]=7;
  p_output1[156]=7;
  p_output1[157]=7;
  p_output1[158]=7;
  p_output1[159]=7;
  p_output1[160]=7;
  p_output1[161]=8;
  p_output1[162]=8;
  p_output1[163]=8;
  p_output1[164]=8;
  p_output1[165]=8;
  p_output1[166]=8;
  p_output1[167]=8;
  p_output1[168]=8;
  p_output1[169]=8;
  p_output1[170]=8;
  p_output1[171]=8;
  p_output1[172]=8;
  p_output1[173]=8;
  p_output1[174]=8;
  p_output1[175]=8;
  p_output1[176]=8;
  p_output1[177]=8;
  p_output1[178]=8;
  p_output1[179]=8;
  p_output1[180]=8;
  p_output1[181]=8;
  p_output1[182]=8;
  p_output1[183]=8;
  p_output1[184]=9;
  p_output1[185]=9;
  p_output1[186]=9;
  p_output1[187]=9;
  p_output1[188]=9;
  p_output1[189]=9;
  p_output1[190]=9;
  p_output1[191]=9;
  p_output1[192]=9;
  p_output1[193]=9;
  p_output1[194]=9;
  p_output1[195]=9;
  p_output1[196]=9;
  p_output1[197]=9;
  p_output1[198]=9;
  p_output1[199]=9;
  p_output1[200]=9;
  p_output1[201]=9;
  p_output1[202]=9;
  p_output1[203]=9;
  p_output1[204]=9;
  p_output1[205]=9;
  p_output1[206]=9;
  p_output1[207]=10;
  p_output1[208]=10;
  p_output1[209]=10;
  p_output1[210]=10;
  p_output1[211]=10;
  p_output1[212]=10;
  p_output1[213]=10;
  p_output1[214]=10;
  p_output1[215]=10;
  p_output1[216]=10;
  p_output1[217]=10;
  p_output1[218]=10;
  p_output1[219]=10;
  p_output1[220]=10;
  p_output1[221]=10;
  p_output1[222]=10;
  p_output1[223]=10;
  p_output1[224]=10;
  p_output1[225]=10;
  p_output1[226]=10;
  p_output1[227]=10;
  p_output1[228]=10;
  p_output1[229]=10;
  p_output1[230]=11;
  p_output1[231]=11;
  p_output1[232]=11;
  p_output1[233]=11;
  p_output1[234]=11;
  p_output1[235]=11;
  p_output1[236]=11;
  p_output1[237]=11;
  p_output1[238]=11;
  p_output1[239]=11;
  p_output1[240]=11;
  p_output1[241]=11;
  p_output1[242]=11;
  p_output1[243]=11;
  p_output1[244]=11;
  p_output1[245]=11;
  p_output1[246]=11;
  p_output1[247]=11;
  p_output1[248]=11;
  p_output1[249]=11;
  p_output1[250]=11;
  p_output1[251]=12;
  p_output1[252]=12;
  p_output1[253]=12;
  p_output1[254]=12;
  p_output1[255]=12;
  p_output1[256]=12;
  p_output1[257]=12;
  p_output1[258]=12;
  p_output1[259]=12;
  p_output1[260]=12;
  p_output1[261]=12;
  p_output1[262]=12;
  p_output1[263]=12;
  p_output1[264]=12;
  p_output1[265]=12;
  p_output1[266]=12;
  p_output1[267]=12;
  p_output1[268]=12;
  p_output1[269]=12;
  p_output1[270]=12;
  p_output1[271]=12;
  p_output1[272]=13;
  p_output1[273]=13;
  p_output1[274]=13;
  p_output1[275]=13;
  p_output1[276]=13;
  p_output1[277]=13;
  p_output1[278]=13;
  p_output1[279]=13;
  p_output1[280]=13;
  p_output1[281]=13;
  p_output1[282]=13;
  p_output1[283]=13;
  p_output1[284]=13;
  p_output1[285]=13;
  p_output1[286]=13;
  p_output1[287]=13;
  p_output1[288]=13;
  p_output1[289]=13;
  p_output1[290]=13;
  p_output1[291]=13;
  p_output1[292]=13;
  p_output1[293]=4;
  p_output1[294]=5;
  p_output1[295]=6;
  p_output1[296]=7;
  p_output1[297]=8;
  p_output1[298]=9;
  p_output1[299]=10;
  p_output1[300]=11;
  p_output1[301]=12;
  p_output1[302]=13;
  p_output1[303]=21;
  p_output1[304]=22;
  p_output1[305]=23;
  p_output1[306]=24;
  p_output1[307]=25;
  p_output1[308]=26;
  p_output1[309]=27;
  p_output1[310]=28;
  p_output1[311]=29;
  p_output1[312]=30;
  p_output1[313]=31;
  p_output1[314]=32;
  p_output1[315]=33;
  p_output1[316]=4;
  p_output1[317]=5;
  p_output1[318]=6;
  p_output1[319]=7;
  p_output1[320]=8;
  p_output1[321]=9;
  p_output1[322]=10;
  p_output1[323]=11;
  p_output1[324]=12;
  p_output1[325]=13;
  p_output1[326]=21;
  p_output1[327]=22;
  p_output1[328]=23;
  p_output1[329]=24;
  p_output1[330]=25;
  p_output1[331]=26;
  p_output1[332]=27;
  p_output1[333]=28;
  p_output1[334]=29;
  p_output1[335]=30;
  p_output1[336]=31;
  p_output1[337]=32;
  p_output1[338]=33;
  p_output1[339]=4;
  p_output1[340]=5;
  p_output1[341]=6;
  p_output1[342]=7;
  p_output1[343]=8;
  p_output1[344]=9;
  p_output1[345]=10;
  p_output1[346]=11;
  p_output1[347]=12;
  p_output1[348]=13;
  p_output1[349]=21;
  p_output1[350]=22;
  p_output1[351]=23;
  p_output1[352]=24;
  p_output1[353]=25;
  p_output1[354]=26;
  p_output1[355]=27;
  p_output1[356]=28;
  p_output1[357]=29;
  p_output1[358]=30;
  p_output1[359]=31;
  p_output1[360]=32;
  p_output1[361]=33;
  p_output1[362]=4;
  p_output1[363]=5;
  p_output1[364]=6;
  p_output1[365]=7;
  p_output1[366]=8;
  p_output1[367]=9;
  p_output1[368]=10;
  p_output1[369]=11;
  p_output1[370]=12;
  p_output1[371]=13;
  p_output1[372]=21;
  p_output1[373]=22;
  p_output1[374]=23;
  p_output1[375]=24;
  p_output1[376]=25;
  p_output1[377]=26;
  p_output1[378]=27;
  p_output1[379]=28;
  p_output1[380]=29;
  p_output1[381]=30;
  p_output1[382]=31;
  p_output1[383]=32;
  p_output1[384]=33;
  p_output1[385]=4;
  p_output1[386]=5;
  p_output1[387]=6;
  p_output1[388]=7;
  p_output1[389]=8;
  p_output1[390]=9;
  p_output1[391]=10;
  p_output1[392]=11;
  p_output1[393]=12;
  p_output1[394]=13;
  p_output1[395]=21;
  p_output1[396]=22;
  p_output1[397]=23;
  p_output1[398]=24;
  p_output1[399]=25;
  p_output1[400]=26;
  p_output1[401]=27;
  p_output1[402]=28;
  p_output1[403]=29;
  p_output1[404]=30;
  p_output1[405]=31;
  p_output1[406]=32;
  p_output1[407]=33;
  p_output1[408]=4;
  p_output1[409]=5;
  p_output1[410]=6;
  p_output1[411]=7;
  p_output1[412]=8;
  p_output1[413]=9;
  p_output1[414]=10;
  p_output1[415]=11;
  p_output1[416]=12;
  p_output1[417]=13;
  p_output1[418]=21;
  p_output1[419]=22;
  p_output1[420]=23;
  p_output1[421]=24;
  p_output1[422]=25;
  p_output1[423]=26;
  p_output1[424]=27;
  p_output1[425]=28;
  p_output1[426]=29;
  p_output1[427]=30;
  p_output1[428]=31;
  p_output1[429]=32;
  p_output1[430]=33;
  p_output1[431]=4;
  p_output1[432]=5;
  p_output1[433]=6;
  p_output1[434]=7;
  p_output1[435]=8;
  p_output1[436]=9;
  p_output1[437]=10;
  p_output1[438]=11;
  p_output1[439]=12;
  p_output1[440]=13;
  p_output1[441]=21;
  p_output1[442]=22;
  p_output1[443]=23;
  p_output1[444]=24;
  p_output1[445]=25;
  p_output1[446]=26;
  p_output1[447]=27;
  p_output1[448]=28;
  p_output1[449]=29;
  p_output1[450]=30;
  p_output1[451]=31;
  p_output1[452]=32;
  p_output1[453]=33;
  p_output1[454]=4;
  p_output1[455]=5;
  p_output1[456]=6;
  p_output1[457]=7;
  p_output1[458]=8;
  p_output1[459]=9;
  p_output1[460]=10;
  p_output1[461]=11;
  p_output1[462]=12;
  p_output1[463]=13;
  p_output1[464]=21;
  p_output1[465]=22;
  p_output1[466]=23;
  p_output1[467]=24;
  p_output1[468]=25;
  p_output1[469]=26;
  p_output1[470]=27;
  p_output1[471]=28;
  p_output1[472]=29;
  p_output1[473]=30;
  p_output1[474]=31;
  p_output1[475]=32;
  p_output1[476]=33;
  p_output1[477]=4;
  p_output1[478]=5;
  p_output1[479]=6;
  p_output1[480]=7;
  p_output1[481]=8;
  p_output1[482]=9;
  p_output1[483]=10;
  p_output1[484]=11;
  p_output1[485]=12;
  p_output1[486]=13;
  p_output1[487]=21;
  p_output1[488]=22;
  p_output1[489]=23;
  p_output1[490]=24;
  p_output1[491]=25;
  p_output1[492]=26;
  p_output1[493]=27;
  p_output1[494]=28;
  p_output1[495]=29;
  p_output1[496]=30;
  p_output1[497]=31;
  p_output1[498]=32;
  p_output1[499]=33;
  p_output1[500]=4;
  p_output1[501]=5;
  p_output1[502]=6;
  p_output1[503]=7;
  p_output1[504]=8;
  p_output1[505]=9;
  p_output1[506]=10;
  p_output1[507]=11;
  p_output1[508]=12;
  p_output1[509]=13;
  p_output1[510]=21;
  p_output1[511]=22;
  p_output1[512]=23;
  p_output1[513]=24;
  p_output1[514]=25;
  p_output1[515]=26;
  p_output1[516]=27;
  p_output1[517]=28;
  p_output1[518]=29;
  p_output1[519]=30;
  p_output1[520]=31;
  p_output1[521]=32;
  p_output1[522]=33;
  p_output1[523]=4;
  p_output1[524]=5;
  p_output1[525]=6;
  p_output1[526]=7;
  p_output1[527]=8;
  p_output1[528]=9;
  p_output1[529]=10;
  p_output1[530]=11;
  p_output1[531]=12;
  p_output1[532]=13;
  p_output1[533]=21;
  p_output1[534]=22;
  p_output1[535]=23;
  p_output1[536]=24;
  p_output1[537]=25;
  p_output1[538]=26;
  p_output1[539]=27;
  p_output1[540]=28;
  p_output1[541]=29;
  p_output1[542]=30;
  p_output1[543]=31;
  p_output1[544]=4;
  p_output1[545]=5;
  p_output1[546]=6;
  p_output1[547]=7;
  p_output1[548]=8;
  p_output1[549]=9;
  p_output1[550]=10;
  p_output1[551]=11;
  p_output1[552]=12;
  p_output1[553]=13;
  p_output1[554]=21;
  p_output1[555]=22;
  p_output1[556]=23;
  p_output1[557]=24;
  p_output1[558]=25;
  p_output1[559]=26;
  p_output1[560]=27;
  p_output1[561]=28;
  p_output1[562]=29;
  p_output1[563]=30;
  p_output1[564]=31;
  p_output1[565]=4;
  p_output1[566]=5;
  p_output1[567]=6;
  p_output1[568]=7;
  p_output1[569]=8;
  p_output1[570]=9;
  p_output1[571]=10;
  p_output1[572]=11;
  p_output1[573]=12;
  p_output1[574]=13;
  p_output1[575]=21;
  p_output1[576]=22;
  p_output1[577]=23;
  p_output1[578]=24;
  p_output1[579]=25;
  p_output1[580]=26;
  p_output1[581]=27;
  p_output1[582]=28;
  p_output1[583]=29;
  p_output1[584]=30;
  p_output1[585]=31;
}



void frost::gen::Js_Ce2_vec11_cassie(double *p_output1, const double *var1)
{
  // Call Subroutines
  output1(p_output1, var1);

}
