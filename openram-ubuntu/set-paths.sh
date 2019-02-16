
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

export SWROOT=/software

export LM_LICENSE_FILE=27000@license.soe.ucsc.edu

# Calibre
export CALIBRE_HOME=$SWROOT/mentor/calibre/aoi_cal_2017.3_29.23
export MGC_HOME=$CALIBRE_HOME
export CALIBREPATH=$CALIBRE_HOME/bin
export PATH=$PATH:$CALIBREPATH

# Hspice
export PATH=$PATH:$SWROOT/synopsys/hspice/bin

# Virtuoso
export PATH=$PATH:$SWROOT/cadence/IC617/tools.lnx86/bin

# PDKs
export FREEPDK45=/home/PDKs/FreePDK45
export FREEPDK15=/home/PDKs/FreePDK15

# OpenRAM
export OPENRAM_HOME=$HOME/openram/compiler
export OPENRAM_TECH=$HOME/openram/technology
