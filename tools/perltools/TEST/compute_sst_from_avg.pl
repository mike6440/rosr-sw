#!/usr/bin/perl -w

#navg yyyy MM dd hh mm ss lat lon ssst corr T1 T2 k1 k2 ksea ksky esea pitch stdpitch roll stdroll az var org orgmn orgmx sw1start sw1end sw1chgs sw2start sw2end sw2chgs

#my $str="5 2011 12 19 15 10 00 30.34477 -81.62164 16.253 0.137 21.837 40.672 659.3 823.2 610.6 242.9 0.98763 2.3 0.1 -1.0 0.1 258 -6 52.8 52.0 54.3 1 1 0 1 1 0";
my $str="9 2012 03 18 13 50 00 30.00487 -145.28106 0.092 1.036 22.925 42.170 674.3 860.7 610.3 273.8 0.98710 -4.5 0.0 0.0 0.0 202 13 -999.0 -999.0 -999.0 1 1 0 1 1 0";

#3 2011 12 19 14 50 00 30.34477 -81.62165 16.184 16.107 16.523 21.827 40.680 659.1 827.0 610.8 399.2 0.987753 2.2 0.1 -1.2 0.1 258 -6 55.4 52.0 137.9 1 1 0 1 1 0
#26 2011 12 19 18 40 00 30.34475 -81.62160 16.525 16.452 16.654 21.132 39.683 651.5 817.0 609.2 252.6 0.987097 2.4 0.1 -0.0 0.1 258 -6 53.0 52.8 54.9 1 1 0 1 1 0
#5 2011 12 19 15 10 00 30.34477 -81.62164 16.253 0.137 21.837 40.672 659.3 823.2 610.6 242.9 0.98763 2.3 0.1 -1.0 0.1 258 -6 52.8 52.0 54.3 1 1 0 1 1 0
#
#1 2012 03 18 12 30 00 30.25712 -144.71137 11.701 1.010 23.148 42.405 676.4 743.5 642.2 677.2 0.98591 1.7 0.1 1.8 0.2 138 13 1085.5 1085.5 1085.5 1 1 0 1 1 0";
#2 2012 03 18 12 40 00 30.00348 -144.95479 0.032 1.155 23.081 42.336 676.0 742.0 611.9 676.8 0.98576 1.7 0.1 2.0 0.2 138 13 1085.4 1085.4 1085.5 1 1 0 1 1 0
#3 2012 03 18 12 50 00 30.00237 -145.00181 3.338 1.118 22.997 42.274 674.8 740.4 619.8 675.8 0.98570 1.6 0.5 2.1 0.6 141 13 1085.4 1085.2 1085.5 1 1 0 1 1 0
#4 2012 03 18 13 00 00 30.00186 -145.04776 1.056 1.027 22.973 42.263 674.4 740.3 613.3 674.2 0.98710 -4.1 1.1 0.0 0.0 204 13 -999.0 -999.0 -999.0 1 1 0 1 1 0
#5 2012 03 18 13 10 00 30.00220 -145.09482 0.590 1.034 22.978 42.256 674.6 741.5 611.5 674.7 0.98710 -4.4 0.1 0.0 0.0 201 13 -999.0 -999.0 -999.0 1 1 0 1 1 0
#6 2012 03 18 13 20 00 30.00292 -145.14168 0.336 1.035 22.987 42.227 674.7 741.4 611.0 674.5 0.98710 -4.3 0.0 0.0 0.0 201 13 -999.0 -999.0 -999.0 1 1 0 1 1 0
#7 2012 03 18 13 30 00 30.00381 -145.18837 0.143 1.036 22.976 42.213 674.2 740.8 610.0 673.7 0.98710 -4.4 0.1 0.0 0.0 202 13 -999.0 -999.0 -999.0 1 1 0 1 1 0
#8 2012 03 18 13 40 00 30.00455 -145.23476 -0.003 1.038 22.956 42.190 674.2 740.8 609.7 673.8 0.98710 -4.5 0.1 0.0 0.0 202 13 -999.0 -999.0 -999.0 1 1 0 1 1 0
#9 2012 03 18 13 50 00 30.00487 -145.28106 0.092 1.036 22.925 42.170 674.3 740.7 610.3 673.8 0.98710 -4.5 0.0 0.0 0.0 202 13 -999.0 -999.0 -999.0 1 1 0 1 1 0
#10 2012 03 18 14 00 00 30.00340 -145.32610 0.341 1.033 22.886 42.125 673.5 740.7 609.5 673.2 0.98710 -4.5 0.0 0.0 0.0 201 13 -999.0 -999.0 -999.0 1 1 0 1 1 0
#11 2012 03 18 14 10 00 30.00191 -145.37050 -0.056 1.034 22.847 42.070 673.3 740.4 608.4 672.4 0.98710 -4.5 0.0 0.0 0.0 200 13 -999.0 -999.0 -999.0 1 1 0 1 1 0
#12 2012 03 18 14 20 00 30.00042 -145.41544 -0.087 1.036 22.802 42.047 672.4 740.1 607.0 671.8 0.98710 -4.5 0.0 0.0 0.0 200 13 -999.0 -999.0 -999.0 1 1 0 1 1 0
#13 2012 03 18 14 30 00 29.99844 -145.46185 -0.169 1.035 22.760 42.012 672.2 739.9 606.8 671.5 0.98710 -4.5 0.0 0.0 0.0 201 13 -999.0 -999.0 -999.0 1 1 0 1 1 0
#14 2012 03 18 14 40 00 29.99675 -145.50806 -0.360 1.037 22.716 41.975 671.9 739.4 606.4 671.4 0.98710 -4.5 0.0 0.0 0.0 201 13 -999.0 -999.0 -999.0 1 1 0 1 1 0
#15 2012 03 18 14 50 00 29.99578 -145.55361 -0.164 1.033 22.670 41.945 671.6 739.9 605.9 670.8 0.98710 -4.5 0.0 0.0 0.0 201 13 -999.0 -999.0 -999.0 1 1 0 1 1 0
#16 2012 03 18 15 00 00 29.99549 -145.60030 -0.549 1.038 22.629 41.902 671.1 737.7 606.2 670.6 0.98710 -4.5 0.0 0.0 0.0 201 13 -999.0 -999.0 -999.0 1 1 0 1 1 0
print"STR = $str\n";
@w=split(/ /,$str);


use lib "/Users/rmr/swmain/perl";
#use perltools::MRtime;
#use perltools::MRstatistics;
#use perltools::MRutilities;
use perltools::Isar;

use POSIX;
use constant MISSING => -999;
my $missing = -999;


$filterfile = '/Users/rmr/swmain/apps/ISAR3/isardaq/kt15/kt15_filter_15855339.txt';

#=================
#NEEDED PARAMETERS
#=================
# DEFAULT EMISSIVITY
$e_0 = .98591;
print "DEFAULT EMISSIVITY: $e_0\n";

# BLACK BODY EMISSIVITY
$e_bb = 1;
print "BLACK BODY EMISSIVITY: $e_bb\n";

#POINTANGLE
$pointangle = 135;
print "POINTANGLE: $pointangle\n";

# ACORR
$Acorr = 1;
print "PROCESSING SST INTERPOLATION CORRECTION: $Acorr\n";

# CALOFFSET
$CalOffset = 0;
print "PROCESSING CALIBRATION OFFSET: $CalOffset\n";

# KV VERBAL FLAG
$kv = 0;

$TMP=0;

#=======================
# MAKE RADIATION TABLES
#=======================
($ttr, $rtr) = MakeRadTable_planck( $filterfile, $kv, $TMP );

#navg yyyy MM dd hh mm ss lat lon ssst corr T1 T2 k1 k2 ksea ksky esea pitch stdpitch roll stdroll az var org orgmn orgmx sw1start sw1end sw1chgs sw2start sw2end sw2chgs
#		 0, 0
# 		 1, 2011
# 		 2, 12
# 		 3, 19
# 		 4, 14
# 		 5, 20
# 		 6, 00
# 		 7, 32.76064
# 		 8, -87.03976
# 		 9, 16.350
# 		10, 0.113
# 		11, 21.696
# 		12, 40.033
# 		13, 658.6
# 		14, 823.3
# 		15, 610.0
# 		16, 215.2
# 		17, 0.98794
# 		18, 2.2
# 		19, 0.0
# 		20, -1.6
# 		21, 0.1
# 		22, 258
# 		23, -2
# 		24, 52.5
# 		25, 52.0
# 		26, 52.9
# 		27, 1
# 		28, 1
# 		29, 0
# 		30, 1
# 		31, 1
# 		32, 0
#navg yyyy MM dd hh mm ss lat lon ssst corr T1 T2 k1 k2 ksea ksky esea pitch stdpitch roll stdroll az var org orgmn orgmx sw1start sw1end sw1chgs sw2start sw2end sw2chgs
#1 2012 03 18 12 30 00 30.25712 -144.71137 11.701 1.010 23.148 42.405 676.4 743.5 642.2 677.2 0.98591 1.7 0.1 1.8 0.2 138 13 1085.5 1085.5 1085.5 1 1 0 1 1 0
my @x = ($w[11],$w[12],$w[13],$w[14],$w[15],$w[16],$pointangle,$w[18],$w[20], $w[21], $e_bb,$Acorr, $CalOffset, $kv, $missing, $ttr, $rtr, $TMP);

printf"(bb1t, bb2t, kt1, kt2, ktsea, ktsky, pointangle, pitch, roll, e_sea_0, e_bb, Acorr, CalOffset, kv, missing, ttr, rtr, 0)=
(%.3f, %.3f, %.2f, %.2f, %.2f, %.2f, %.1f, %.1f, %.1f, %.6f, %.3f, %.4f, %.3f, %.0f, %.0f)\n",
$x[0],$x[1],$x[2],$x[3],$x[4],$x[5],$x[6],$x[7],$x[8],$x[9],$x[10],$x[11],$x[12],$x[13],$x[14],$x[15];

#($T_skin, $T_corr, $T_uncorr, $e_sea)
@y = ComputeSSST(@x);

printf"TSKIN=%.3f   CORR=%.3f\n",$y[0], $y[1];

exit 0;

