gmt makecpt -Cantonio.cpt -T-5/5 -Z > color2.cpt;
for i in *.nc;
do p=`echo $i| sed s_nc_ps_`;
gmt set FONT_TITLE 32p,Helvetica-Bold  FONT_ANNOT_PRIMARY 12p,Helvetica-Bold FONT_LABEL  12p,Helvetica-Bold  MAP_DEGREE_SYMBOL colon PS_CHAR_ENCODING ISOLatin1
gmt grdimage -Rg -JW180/9i "@$i?anom[0,0]" -Ccolor2.cpt  -Ba -B+t"Anomalía de Temperatura del Océano" -K> "./$p";
gmt pscoast -Rg -JW180/9i  -Ba -G#757565 -W1/0.25p -W2/0.1p -A5000 -Clightblue -O -K>> "./$p";
gmt psscale -Ccolor2.cpt -Dx9.5i/3.75i+jTC+w3i/0.25i -Bx1+l"Anomalía (@+o@+C)" -R -J -O  >> "./$p"
done;
