
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

export SWROOT=/software

export LM_LICENSE_FILE=27000@license.soe.ucsc.edu

# Calibre
export USE_CALIBRE_VCO=aoi
export CALIBRE_HOME=$SWROOT/mentor/calibre/aoi_cal_2017.3_29.23
export MGC_HOME=$CALIBRE_HOME
export MGC_TMPDIR=/tmp
export CALIBREPATH=$CALIBRE_HOME/bin
export PATH=$PATH:$CALIBREPATH

# Hspice
export PATH=$PATH:$SWROOT/synopsys/hspice/bin

# Virtuoso
export ICHOME=$SWROOT/cadence/IC617
export ICPATH=$ICHOME/tools/bin:$ICHOME/tools/dfII/bin
export PATH=$PATH:$ICPATH
export CDS_AUTO_64BIT=ALL
export W3264_NO_HOST_CHECK=1
export OA_UNSUPPORTED_PLAT=linux_rhel50_gcc48x
export CDS_Netlisting_Mode=Analog
#export CDS_SITE=$CDK_DIR
#export SYSTEM_CDS_LIB_DIR=$CDK_DIR/cdssetup
export SKIP_CDSLIB_MANAGER=
if [ -z "$LD_LIBRARY_PATH" ]; then
        export LD_LIBRARY_PATH=$SWROOT/cadence/ic/share/oa/lib/linux_rhel50_gcc48x_64/opt:$SWROOT/cadence/ic/share/oa/lib/linux_rhel50_gcc48x_32/opt
else
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$SWROOT/cadence/ic/share/oa/lib/linux_rhel50_gcc48x_64/opt:$SWROOT/cadence/ic/share/oa/lib/linux_rhel50_gcc48x_32/opt
fi

# ICC
export ICC_HOME=$SWROOT/synopsys/icc
export ICCPATH=$ICC_HOME/bin
export PATH=$PATH:$ICCPATH

# DC
export SYN_HOME=$SWROOT/synopsys/syn
export SYNPATH=$SYN_HOME/bin
export PATH=$PATH:$SYNPATH
export SYNOPSYS=$SWROOT/synopsys

# LC
export LC_HOME=$SWROOT/synopsys/lc
export LCPATH=$LC_HOME/bin
export PATH=$PATH:$LCPATH

# PDKs
export FREEPDK45=/home/PDKs/FreePDK45
export FREEPDK15=/home/PDKs/FreePDK15
export ASAP7=$HOME/ASAP7_PDKandLIB_v1p5/asap7PDK_r1p5
# Set to the PDK you want to use
export PDK_DIR=$FREEPDK15

# OpenRAM
export OPENRAM_HOME=$HOME/openram/compiler
export OPENRAM_TECH=$HOME/openram/technology
