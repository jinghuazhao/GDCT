# Software setup for Practical GWAS using Linux and R

We use virtual machine (VM), e.g., [https://en.wikipedia.org/wiki/Virtual_machine](https://en.wikipedia.org/wiki/Virtual_machine), in 
a distribution called GWAS-2017.dvi, which includes many pre-installed Linux software and R packages. It is available from

[https://tinyurl.com/yaosamkt](https://drive.google.com/file/d/0B9oDgMSkdXElazctU2NOZXhVRjA/view?usp=sh)

## 1. Oracle VirtualBox attachment

The Oracle VirtualBox software can be downloaded from

[https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

The latest stable version is 5.1.28. To install, under **VirtualBox binaries** select the appropriate host inside **VirtualBox 5.1.28 
platform packages**.

Once installed and at the very first run, it will prompt for installation of VM VirtualBox Extension Pack. Follow instructions for a 
successful installation. From VirtualBox, select `New`, for a 64-bit Linux, Ubuntu, ~3GB RAM with an existing disk which points to 
GWAS-2017.vdi.

Once the disk is attached, you can start the VM to login with the following details,

**username:** physalia

**password:** course

If you run into difficulty, the following links are helpful,

* How to Create and Use Virtual Machines, [https://www.howtogeek.com/196060/beginner-geek-how-to-create-and-use-virtual-machines/](https://www.howtogeek.com/196060/beginner-geek-how-to-create-and-use-virtual-machines/)
* How to Share Your Computer’s Files With a Virtual Machine, [https://www.howtogeek.com/189974/how-to-share-your-computers-files-with-a-virtual-machine/](https://www.howtogeek.com/189974/how-to-share-your-computers-files-with-a-virtual-machine/)

In general with VirtualBox, if you don't see full-screen you can follow these steps,

1). Make sure from VirtualBox menu, click `Devices` pull-down menu and select `Insert Guest Addition CD Image` and also `Shared 
Clipboard, Bidirectional`.

2). Once the desktop is up, right click the background to create a terminal, and perform the following,
```
cd /media/physalia/VBOXADDITIONS_5.1.28_117968/
sudo ./VBoxLinuxAdditions.run
```
3). If successful, type 
```
reboot
```
When login again, you would be guaranted to have a full screen so you can start another terminal.

## 2. Notes for existing Linux users

While it is relatively straightforward to download the relevant packages as listed in /home/physalia/Downloads/www, it would still 
take some effort to make the relevant R packages, namely, ~200 packages at /usr/local/lib/R/site-library, in place.

To save time, you can also move the downloads over to your own.

## 3. Notes for Windows users

It is possible [to set up a native Ubuntu system inside Windows 10](https://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/) but in this case a major drawback is 
the difficulty for file exchange and use of all available resources.

From a terminal, issue the following command,
```
st
```
then you can see files on your C:\\ from Ubuntu.

## 4. Notes for users of other operating systems

Similar procedures described above would work, but you would need create an appropriate sharefolder from the VM settings to enable 
file exchange.

## 5. Additional notes for installation

When the executable files are directly available, for instance QUICKTEST we can simply do 
```
 sudo cp quicktest /usr/local/bin
```
This also applies to BOLT-LMM, PLINK and many others.

The following gives more details regarding other cases.

### bcftools, samtools and vcftools

All can be installed into /usr/local/bin via `sudo make install` from their directories.

#### BEAGLE

It requires java to be installed, e.g.,
```
sudo apt install default-jre
```
From beagle_4.1/, issue 
```
chmod +x run.beagle.08Jun17.d8b.example
./run.beagle.08Jun17.d8b.example
```
will also obtain additional files to run through the examples.

### tabix

While `make` will generate the executable, the perl/ and python/ extensions are made available as follows,
```
perl Makefile.PL
make
sudo make install
```
and
```
sudo apt install python-dev
python setup.py build
sudo python setup.py install
```
respectively.

### OmicsABEL

As BLAS and LAPACK have been installed, we could make a copy of ` make.inc.gnu-goto` into `make.inc` followed by the usual `make`.

### ProbABEL

Our copy was obtained from GitHub, The installation involves the following.
```
sudo apt install aclocal doxygen texinfo bison help2man
sudo apt install autoconf
sudo apt install automake
autoreconf --install
automake
./configure --prefix=/usr/local
make install
```
The first line was suggested by `./missing --help` and at least `doxygen` and `texinfo` are helpful.

### PASCAL

The download is a .zip file, but the OpenBLAS provided does not work so we do
```
unzip PASCAL
cd PASCAL
wget https://sourceforge.net/projects/openblas/files/v0.2.20/OpenBLAS%200.2.20%20version.tar.gz
sed 's/xianyi-OpenBLAS-48f06dd/xianyi-OpenBLAS-6d2da63/g' installScript.sh > st.sh
bash st.sh

```
where we download the latest version 0.2.20 from SourceForge and use a revised installation script taking this into account. We still 
have to do one more thing, the issues are to do with
```
ln -s libopenblas.so.0 libblas.so.3
ln -s libopenblas.so.0 liblapack.so.3
```
and we simply replace `-s` with `-sf` and `bash st.sh` again, saying (N)one when prompting for unzip OpenBLAS again.

### DEPICT

This is furnished with the following steps,

```
wget http://www.broadinstitute.org/mpg/depict/depict_140721.tar.bz2
tar jxf depict_140721.tar.bz2

pip2.7 install intervaltree
pip2.7 install pandas

```
This compressed tar ball also has the associate databases nevertheless its formidable 3GB size prevents us to pre-install them. Latest 
update is available from [GitHub](https://github.com/perslab/depict) which would need invoke Java IDE such as 
[NetBeans](https://netbeans.org/) to compile.

Oddly, the example provided by the software only works upto four tissues it would need some guesswork to use the whole reconstitute 
genesets and our configuration file has already done so. We also used the database reported in the DEPICT paper.

### FINAL REMARK

The last section is heavy-going nevertheless critical. It avoids packaging large software such as DEPICT and then installing into our 
.vdi, especially volume of other software (not necessarily with their associate databases) reaches 20GB.
