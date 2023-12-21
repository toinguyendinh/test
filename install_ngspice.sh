mkdir -p /$HOME/download/
cd /$HOME/download/

if [ -d ".git" ]; then
	echo "Git repository already exits"
else
	echo "Git repository does not exits"
	git clone https://git.code.sf.net/p/ngspice/ngspice ngspice-ngspice
fi

cd /$HOME/download/ngspice-ngspice/
sudo apt install bison flex libx11-6 libx11-dev autoconf automake libtool tcl tk blt fftw2 readline-devel libreadline-dev


mkdir -p /$HOME/tool/ngspice/41/bin/

cd /$HOME/download/ngspice-ngspice/
./configure --enable-xspice --enable-cider -enable-xspice --with-readline=yes --enable-cider --enable-openmp -prefix=/home/toind/tool/ngspice/41/

make clean
make
sudo make install 

cd /$HOME/eda/
