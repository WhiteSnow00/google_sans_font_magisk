ORIGDIR=/sbin/.magisk/mirror
FONTDIR=$MODPATH/GoogleSans
SYSFONT=$MODPATH/system/fonts
PRDFONT=$MODPATH/system/product/fonts
SYSETC=$MODPATH/system/etc
SYSXML=$SYSETC/fonts.xml
MODPROP=$MODPATH/module.prop

patch() {
	cp $ORIGDIR/system/etc/fonts.xml $SYSXML
	sed -i '/"sans-serif">/,/family>/H;1,/family>/{/family>/G}' $SYSXML
	sed -i ':a;N;$!ba;s/name="sans-serif"//2' $SYSXML
	sed -i '/"sans-serif">/,/family>/{s/Roboto-M/M/;s/Roboto-B/B/}' $SYSXML
    sed -i '/"sans-serif">/,/family>/{s/Roboto-T/T/;s/Roboto-L/L/;s/Roboto-R/R/;s/Roboto-I/I/}' $SYSXML	
	sed -i 's/RobotoC/C/' $SYSXML
}

headline() {
	cp $FONTDIR/GoogleSans-Black.ttf $SYSFONT/Black.ttf;
	cp $FONTDIR/GoogleSans-BlackItalic.ttf $SYSFONT/BlackItalic.ttf;
	cp $FONTDIR/GoogleSans-Bold.ttf $SYSFONT/Bold.ttf;
	cp $FONTDIR/GoogleSans-BoldItalic.ttf $SYSFONT/BoldItalic.ttf;
	cp $FONTDIR/GoogleSans-Medium.ttf $SYSFONT/Medium.ttf;
	cp $FONTDIR/GoogleSans-MediumItalic.ttf $SYSFONT/MediumItalic.ttf;
}

body() {
	cp $FONTDIR/GoogleSans-Italic.ttf $SYSFONT/Italic.ttf;
	cp $FONTDIR/GoogleSans-Light.ttf $SYSFONT/Light.ttf;
	cp $FONTDIR/GoogleSans-LightItalic.ttf $SYSFONT/LightItalic.ttf;
	cp $FONTDIR/GoogleSans-Regular.ttf $SYSFONT/Regular.ttf;
	cp $FONTDIR/GoogleSans-Thin.ttf 
$SYSFONT/Thin.ttf
	cp $FONTDIR/GoogleSans-ThinItalic.ttf $SYSFONT/ThinItalic.ttf;	
}

condensed() {
    cp $FONTDIR/GoogleSans-Regular.ttf $SYSFONT/Condensed-Regular.ttf;
	cp $FONTDIR/GoogleSans-Italic.ttf $SYSFONT/Condensed-Italic.ttf;
	cp $FONTDIR/GoogleSans-Bold.ttf $SYSFONT/Condensed-Bold.ttf;
	cp $FONTDIR/GoogleSans-BoldItalic.ttf $SYSFONT/Condensed-BoldItalic.ttf;	
	cp $FONTDIR/GoogleSans-Light.ttf $SYSFONT/Condensed-Light.ttf;
	cp $FONTDIR/GoogleSans-LightItalic.ttf $SYSFONT/Condensed-LightItalic.ttf;
	cp $FONTDIR/GoogleSans-Medium.ttf $SYSFONT/Condensed-Medium.ttf;
	cp $FONTDIR/GoogleSans-MediumItalic.ttf $SYSFONT/Condensed-MediumItalic.ttf;		
}

    #cp $FONTDIR/GoogleSans-Regular.ttf $SYSFONT/Condensed-Regular.ttf;
	#cp $FONTDIR/GoogleSans-Italic.ttf $SYSFONT/Condensed-Italic.ttf;
	#cp $FONTDIR/GoogleSans-Bold.ttf $SYSFONT/Condensed-Bold.ttf;
	#cp $FONTDIR/GoogleSans-BoldItalic.ttf $SYSFONT/Condensed-BoldItalic.ttf;	
	#cp $FONTDIR/GoogleSans-Light.ttf $SYSFONT/Condensed-Light.ttf;
	#cp $FONTDIR/GoogleSans-LightItalic.ttf $SYSFONT/Condensed-LightItalic.ttf;
	#cp $FONTDIR/GoogleSans-Medium.ttf $SYSFONT/Condensed-Medium.ttf;
	#cp $FONTDIR/GoogleSans-MediumItalic.ttf $SYSFONT/Condensed-MediumItalic.ttf;	
    #cp $FONTDIR/GoogleSansCondensed-Regular.ttf $SYSFONT/Condensed-Regular.ttf;
	#cp $FONTDIR/GoogleSansCondensed-Italic.ttf $SYSFONT/Condensed-Italic.ttf;
	#cp $FONTDIR/GoogleSansCondensed-Bold.ttf $SYSFONT/Condensed-Bold.ttf;
	#cp $FONTDIR/GoogleSansCondensed-BoldItalic.ttf $SYSFONT/Condensed-BoldItalic.ttf;
	#cp $FONTDIR/GoogleSansCondensed-Light.ttf $SYSFONT/Condensed-Light.ttf;
	#cp $FONTDIR/GoogleSansCondensed-LightItalic.ttf $SYSFONT/Condensed-LightItalic.ttf;
	#cp $FONTDIR/GoogleSansCondensed-Medium.ttf $SYSFONT/Condensed-Medium.ttf;
	#cp $FONTDIR/GoogleSansCondensed-MediumItalic.ttf $SYSFONT/Condensed-MediumItalic.ttf;	

full() { headline; body; condensed; }

clean_up() {
	rm -rf $FONTDIR
	rmdir -p $SYSETC $PRDFONT
}

pixel() {
	if [ -f /product/fonts/GoogleSans-Regular.ttf ]; then
		DEST=$PRDFONT
	elif [ -f /system/fonts/GoogleSans-Regular.ttf ]; then
		DEST=$SYSFONT
	fi
	if [ ! -z $DEST ]; then
		cp $FONTDIR/GoogleSans-Regular.ttf $DEST/GoogleSans-Regular.ttf
		cp $FONTDIR/GoogleSans-Italic.ttf $DEST/GoogleSans-Italic.ttf
		cp $FONTDIR/GoogleSans-Medium.ttf $DEST/GoogleSans-Medium.ttf
		cp $FONTDIR/GoogleSans-MediumItalic.ttf $DEST/GoogleSans-MediumItalic.ttf
		cp $FONTDIR/GoogleSans-Bold.ttf $DEST/GoogleSans-Bold.ttf
		cp $FONTDIR/GoogleSans-BoldItalic.ttf $DEST/GoogleSans-BoldItalic.ttf
		sed -ie 3's/$/+PXL&/' $MODPROP
		PXL=true
	fi
}

oxygen() {
	if [ -f $ORIGDIR/system/fonts/GoogleSans-Regular.ttf ]; then
		cp $SYSFONT/Black.ttf $SYSFONT/GoogleSans-Black.ttf
		cp $SYSFONT/Bold.ttf $SYSFONT/GoogleSans-Bold.ttf
		cp $SYSFONT/Medium.ttf $SYSFONT/GoogleSans-Medium.ttf
		cp $SYSFONT/Regular.ttf $SYSFONT/GoogleSans-Regular.ttf
		cp $SYSFONT/Regular.ttf $SYSFONT/GoogleSans-Book.ttf
		cp $SYSFONT/Light.ttf $SYSFONT/GoogleSans-Light.ttf
		cp $SYSFONT/Thin.ttf $SYSFONT/GoogleSans-Thin.ttf
		sed -ie 3's/$/+OOS&/' $MODPROP
		OOS=true
	fi
}

miui() {
	if i=$(grep miui $SYSXML); then
	    sed -i '/"mipro"/,/family>/{/400/s/MiLanProVF/Regular/;/stylevalue="340"/d}' $SYSXML
		sed -i '/"mipro-thin"/,/family>/{/400/s/MiLanProVF/Thin/;/700/s/MiLanProVF/Light/;/stylevalue/d}' $SYSXML
		sed -i '/"mipro-extralight"/,/family>/{/400/s/MiLanProVF/Thin/;/700/s/MiLanProVF/Light/;/stylevalue/d}' $SYSXML
		sed -i '/"mipro-light"/,/family>/{/400/s/MiLanProVF/Light/;/700/s/MiLanProVF/Regular/;/stylevalue/d}' $SYSXML
		sed -i '/"mipro-normal"/,/family>/{/400/s/MiLanProVF/Light/;/700/s/MiLanProVF/Regular/;/stylevalue/d}' $SYSXML
		sed -i '/"mipro-regular"/,/family>/{/400/s/MiLanProVF/Regular/;/stylevalue="340"/d}' $SYSXML		
		sed -i '/"mipro-medium"/,/family>/{/400/s/MiLanProVF/Medium/;/700/s/MiLanProVF/Bold/;/stylevalue/d}' $SYSXML
		sed -i '/"mipro-demibold"/,/family>/{/400/s/MiLanProVF/Medium/;/700/s/MiLanProVF/Bold/;/stylevalue/d}' $SYSXML
		sed -i '/"mipro-semibold"/,/family>/{/400/s/MiLanProVF/Medium/;/700/s/MiLanProVF/Bold/;/stylevalue/d}' $SYSXML
		sed -i '/"mipro-bold"/,/family>/{/400/s/MiLanProVF/Bold/;/700/s/MiLanProVF/Black/;/stylevalue/d}' $SYSXML
		sed -i '/"mipro-heavy"/,/family>/{/400/s/MiLanProVF/Black/;/stylevalue/d}' $SYSXML        	
		sed -ie 3's/$/+Miui&/' $MODPROP
		MIUI=true
	fi
}

lg() {
	if i=$(grep lg-sans-serif $SYSXML); then
		sed -i '/"lg-sans-serif">/,/family>/{/"lg-sans-serif">/!d};/"sans-serif">/,/family>/{/"sans-serif">/!H};/"lg-sans-serif">/G' $SYSXML
		LG=true
	fi
	if [ -f $ORIGDIR/system/etc/fonts_lge.xml ]; then
		cp $ORIGDIR/system/etc/fonts_lge.xml $SYSETC
		LGXML=$SYSETC/fonts_lge.xml
		sed -i '/"default_roboto">/,/family>/{s/Roboto-M/M/;s/Roboto-B/B/Roboto-T/T/;s/Roboto-L/L/;s/Roboto-R/R/;s/Roboto-I/I/}' $LGXML		
		LG=true
	fi
	if $LG; then sed -ie 3's/$/+LG&/' $MODPROP; fi
}

rom() {
	pixel
	if ! $PXL; then oxygen
		if ! $OOS; then miui
			if ! $MIUI; then lg
			fi
		fi
	fi
}

### INSTALLATION ###
mkdir -p $SYSFONT $SYSETC $PRDFONT
patch

full

PXL=false; OOS=false; MIUI=false; LG=false
rom

### CLEAN UP ###
sleep 1
ui_print "   "
ui_print "   Doing a house warming partyy..."
ui_print "   "
clean_upe warming partyy..."
ui_print "   "
clean_up Doing a house warming partyy..."
ui_print "   "
clean_up