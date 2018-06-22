/*
 * Automatically Generated from Mathematica.
 * Wed 20 Jun 2018 12:48:24 GMT-04:00
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "frost/gen/Js_Ce2_vec17_cassie.hh"

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
  p_output1[138]=14;
  p_output1[139]=14;
  p_output1[140]=14;
  p_output1[141]=14;
  p_output1[142]=14;
  p_output1[143]=14;
  p_output1[144]=14;
  p_output1[145]=14;
  p_output1[146]=14;
  p_output1[147]=14;
  p_output1[148]=14;
  p_output1[149]=14;
  p_output1[150]=14;
  p_output1[151]=14;
  p_output1[152]=14;
  p_output1[153]=14;
  p_output1[154]=14;
  p_output1[155]=14;
  p_output1[156]=14;
  p_output1[157]=14;
  p_output1[158]=14;
  p_output1[159]=14;
  p_output1[160]=14;
  p_output1[161]=15;
  p_output1[162]=15;
  p_output1[163]=15;
  p_output1[164]=15;
  p_output1[165]=15;
  p_output1[166]=15;
  p_output1[167]=15;
  p_output1[168]=15;
  p_output1[169]=15;
  p_output1[170]=15;
  p_output1[171]=15;
  p_output1[172]=15;
  p_output1[173]=15;
  p_output1[174]=15;
  p_output1[175]=15;
  p_output1[176]=15;
  p_output1[177]=15;
  p_output1[178]=15;
  p_output1[179]=15;
  p_output1[180]=15;
  p_output1[181]=15;
  p_output1[182]=15;
  p_output1[183]=15;
  p_output1[184]=16;
  p_output1[185]=16;
  p_output1[186]=16;
  p_output1[187]=16;
  p_output1[188]=16;
  p_output1[189]=16;
  p_output1[190]=16;
  p_output1[191]=16;
  p_output1[192]=16;
  p_output1[193]=16;
  p_output1[194]=16;
  p_output1[195]=16;
  p_output1[196]=16;
  p_output1[197]=16;
  p_output1[198]=16;
  p_output1[199]=16;
  p_output1[200]=16;
  p_output1[201]=16;
  p_output1[202]=16;
  p_output1[203]=16;
  p_output1[204]=16;
  p_output1[205]=16;
  p_output1[206]=16;
  p_output1[207]=17;
  p_output1[208]=17;
  p_output1[209]=17;
  p_output1[210]=17;
  p_output1[211]=17;
  p_output1[212]=17;
  p_output1[213]=17;
  p_output1[214]=17;
  p_output1[215]=17;
  p_output1[216]=17;
  p_output1[217]=17;
  p_output1[218]=17;
  p_output1[219]=17;
  p_output1[220]=17;
  p_output1[221]=17;
  p_output1[222]=17;
  p_output1[223]=17;
  p_output1[224]=17;
  p_output1[225]=17;
  p_output1[226]=17;
  p_output1[227]=18;
  p_output1[228]=18;
  p_output1[229]=18;
  p_output1[230]=18;
  p_output1[231]=18;
  p_output1[232]=18;
  p_output1[233]=18;
  p_output1[234]=18;
  p_output1[235]=18;
  p_output1[236]=18;
  p_output1[237]=18;
  p_output1[238]=18;
  p_output1[239]=18;
  p_output1[240]=18;
  p_output1[241]=18;
  p_output1[242]=18;
  p_output1[243]=18;
  p_output1[244]=18;
  p_output1[245]=18;
  p_output1[246]=18;
  p_output1[247]=19;
  p_output1[248]=19;
  p_output1[249]=19;
  p_output1[250]=19;
  p_output1[251]=19;
  p_output1[252]=19;
  p_output1[253]=19;
  p_output1[254]=19;
  p_output1[255]=19;
  p_output1[256]=19;
  p_output1[257]=19;
  p_output1[258]=19;
  p_output1[259]=19;
  p_output1[260]=19;
  p_output1[261]=19;
  p_output1[262]=19;
  p_output1[263]=19;
  p_output1[264]=19;
  p_output1[265]=19;
  p_output1[266]=19;
  p_output1[267]=20;
  p_output1[268]=20;
  p_output1[269]=20;
  p_output1[270]=20;
  p_output1[271]=20;
  p_output1[272]=20;
  p_output1[273]=20;
  p_output1[274]=20;
  p_output1[275]=20;
  p_output1[276]=20;
  p_output1[277]=20;
  p_output1[278]=20;
  p_output1[279]=20;
  p_output1[280]=20;
  p_output1[281]=20;
  p_output1[282]=20;
  p_output1[283]=20;
  p_output1[284]=20;
  p_output1[285]=20;
  p_output1[286]=20;
  p_output1[287]=4;
  p_output1[288]=5;
  p_output1[289]=6;
  p_output1[290]=14;
  p_output1[291]=15;
  p_output1[292]=16;
  p_output1[293]=17;
  p_output1[294]=18;
  p_output1[295]=19;
  p_output1[296]=20;
  p_output1[297]=21;
  p_output1[298]=22;
  p_output1[299]=23;
  p_output1[300]=24;
  p_output1[301]=25;
  p_output1[302]=26;
  p_output1[303]=34;
  p_output1[304]=35;
  p_output1[305]=36;
  p_output1[306]=37;
  p_output1[307]=38;
  p_output1[308]=39;
  p_output1[309]=40;
  p_output1[310]=4;
  p_output1[311]=5;
  p_output1[312]=6;
  p_output1[313]=14;
  p_output1[314]=15;
  p_output1[315]=16;
  p_output1[316]=17;
  p_output1[317]=18;
  p_output1[318]=19;
  p_output1[319]=20;
  p_output1[320]=21;
  p_output1[321]=22;
  p_output1[322]=23;
  p_output1[323]=24;
  p_output1[324]=25;
  p_output1[325]=26;
  p_output1[326]=34;
  p_output1[327]=35;
  p_output1[328]=36;
  p_output1[329]=37;
  p_output1[330]=38;
  p_output1[331]=39;
  p_output1[332]=40;
  p_output1[333]=4;
  p_output1[334]=5;
  p_output1[335]=6;
  p_output1[336]=14;
  p_output1[337]=15;
  p_output1[338]=16;
  p_output1[339]=17;
  p_output1[340]=18;
  p_output1[341]=19;
  p_output1[342]=20;
  p_output1[343]=21;
  p_output1[344]=22;
  p_output1[345]=23;
  p_output1[346]=24;
  p_output1[347]=25;
  p_output1[348]=26;
  p_output1[349]=34;
  p_output1[350]=35;
  p_output1[351]=36;
  p_output1[352]=37;
  p_output1[353]=38;
  p_output1[354]=39;
  p_output1[355]=40;
  p_output1[356]=4;
  p_output1[357]=5;
  p_output1[358]=6;
  p_output1[359]=14;
  p_output1[360]=15;
  p_output1[361]=16;
  p_output1[362]=17;
  p_output1[363]=18;
  p_output1[364]=19;
  p_output1[365]=20;
  p_output1[366]=21;
  p_output1[367]=22;
  p_output1[368]=23;
  p_output1[369]=24;
  p_output1[370]=25;
  p_output1[371]=26;
  p_output1[372]=34;
  p_output1[373]=35;
  p_output1[374]=36;
  p_output1[375]=37;
  p_output1[376]=38;
  p_output1[377]=39;
  p_output1[378]=40;
  p_output1[379]=4;
  p_output1[380]=5;
  p_output1[381]=6;
  p_output1[382]=14;
  p_output1[383]=15;
  p_output1[384]=16;
  p_output1[385]=17;
  p_output1[386]=18;
  p_output1[387]=19;
  p_output1[388]=20;
  p_output1[389]=21;
  p_output1[390]=22;
  p_output1[391]=23;
  p_output1[392]=24;
  p_output1[393]=25;
  p_output1[394]=26;
  p_output1[395]=34;
  p_output1[396]=35;
  p_output1[397]=36;
  p_output1[398]=37;
  p_output1[399]=38;
  p_output1[400]=39;
  p_output1[401]=40;
  p_output1[402]=4;
  p_output1[403]=5;
  p_output1[404]=6;
  p_output1[405]=14;
  p_output1[406]=15;
  p_output1[407]=16;
  p_output1[408]=17;
  p_output1[409]=18;
  p_output1[410]=19;
  p_output1[411]=20;
  p_output1[412]=21;
  p_output1[413]=22;
  p_output1[414]=23;
  p_output1[415]=24;
  p_output1[416]=25;
  p_output1[417]=26;
  p_output1[418]=34;
  p_output1[419]=35;
  p_output1[420]=36;
  p_output1[421]=37;
  p_output1[422]=38;
  p_output1[423]=39;
  p_output1[424]=40;
  p_output1[425]=4;
  p_output1[426]=5;
  p_output1[427]=6;
  p_output1[428]=14;
  p_output1[429]=15;
  p_output1[430]=16;
  p_output1[431]=17;
  p_output1[432]=18;
  p_output1[433]=19;
  p_output1[434]=20;
  p_output1[435]=21;
  p_output1[436]=22;
  p_output1[437]=23;
  p_output1[438]=24;
  p_output1[439]=25;
  p_output1[440]=26;
  p_output1[441]=34;
  p_output1[442]=35;
  p_output1[443]=36;
  p_output1[444]=37;
  p_output1[445]=38;
  p_output1[446]=39;
  p_output1[447]=40;
  p_output1[448]=4;
  p_output1[449]=5;
  p_output1[450]=6;
  p_output1[451]=14;
  p_output1[452]=15;
  p_output1[453]=16;
  p_output1[454]=17;
  p_output1[455]=18;
  p_output1[456]=19;
  p_output1[457]=20;
  p_output1[458]=21;
  p_output1[459]=22;
  p_output1[460]=23;
  p_output1[461]=24;
  p_output1[462]=25;
  p_output1[463]=26;
  p_output1[464]=34;
  p_output1[465]=35;
  p_output1[466]=36;
  p_output1[467]=37;
  p_output1[468]=38;
  p_output1[469]=39;
  p_output1[470]=40;
  p_output1[471]=4;
  p_output1[472]=5;
  p_output1[473]=6;
  p_output1[474]=14;
  p_output1[475]=15;
  p_output1[476]=16;
  p_output1[477]=17;
  p_output1[478]=18;
  p_output1[479]=19;
  p_output1[480]=20;
  p_output1[481]=21;
  p_output1[482]=22;
  p_output1[483]=23;
  p_output1[484]=24;
  p_output1[485]=25;
  p_output1[486]=26;
  p_output1[487]=34;
  p_output1[488]=35;
  p_output1[489]=36;
  p_output1[490]=37;
  p_output1[491]=38;
  p_output1[492]=39;
  p_output1[493]=40;
  p_output1[494]=4;
  p_output1[495]=5;
  p_output1[496]=6;
  p_output1[497]=14;
  p_output1[498]=15;
  p_output1[499]=16;
  p_output1[500]=17;
  p_output1[501]=18;
  p_output1[502]=19;
  p_output1[503]=20;
  p_output1[504]=21;
  p_output1[505]=22;
  p_output1[506]=23;
  p_output1[507]=24;
  p_output1[508]=25;
  p_output1[509]=26;
  p_output1[510]=34;
  p_output1[511]=35;
  p_output1[512]=36;
  p_output1[513]=37;
  p_output1[514]=4;
  p_output1[515]=5;
  p_output1[516]=6;
  p_output1[517]=14;
  p_output1[518]=15;
  p_output1[519]=16;
  p_output1[520]=17;
  p_output1[521]=18;
  p_output1[522]=19;
  p_output1[523]=20;
  p_output1[524]=21;
  p_output1[525]=22;
  p_output1[526]=23;
  p_output1[527]=24;
  p_output1[528]=25;
  p_output1[529]=26;
  p_output1[530]=34;
  p_output1[531]=35;
  p_output1[532]=36;
  p_output1[533]=37;
  p_output1[534]=4;
  p_output1[535]=5;
  p_output1[536]=6;
  p_output1[537]=14;
  p_output1[538]=15;
  p_output1[539]=16;
  p_output1[540]=17;
  p_output1[541]=18;
  p_output1[542]=19;
  p_output1[543]=20;
  p_output1[544]=21;
  p_output1[545]=22;
  p_output1[546]=23;
  p_output1[547]=24;
  p_output1[548]=25;
  p_output1[549]=26;
  p_output1[550]=34;
  p_output1[551]=35;
  p_output1[552]=36;
  p_output1[553]=37;
  p_output1[554]=4;
  p_output1[555]=5;
  p_output1[556]=6;
  p_output1[557]=14;
  p_output1[558]=15;
  p_output1[559]=16;
  p_output1[560]=17;
  p_output1[561]=18;
  p_output1[562]=19;
  p_output1[563]=20;
  p_output1[564]=21;
  p_output1[565]=22;
  p_output1[566]=23;
  p_output1[567]=24;
  p_output1[568]=25;
  p_output1[569]=26;
  p_output1[570]=34;
  p_output1[571]=35;
  p_output1[572]=36;
  p_output1[573]=37;
}



void frost::gen::Js_Ce2_vec17_cassie(double *p_output1, const double *var1)
{
  // Call Subroutines
  output1(p_output1, var1);

}
