# Software

## Linux systems

While [MacOS is already Unix-based](https://en.wikipedia.org/wiki/MacOS), here are information on [how to install Ubuntu on 
Win10](https://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/). It is native to the Windows 
system but would need some extra work, e.g., installation of Ximg or VcXsrv, [to get the native Ubuntu 
desktop](http://www.zdnet.com/article/how-to-run-run-the-native-ubuntu-desktop-on-windows-10/). A current drawback with this Windows 
extension is its failure to exchange files between the two system, it is thus appealing [to create and use virtual 
machines](https://www.howtogeek.com/196060/beginner-geek-how-to-create-and-use-virtual-machines/).

Linux distributions such as Fedora and Ubuntu offer their ways to set up and Oracle's [VirtualBox](https://www.virtualbox.org/) allows for canonical installations of 
Linux system installed as an application, or once the software is set up a pre-setup virtual disk attached to it. Later on when we remove files or [create 
snapshot](https://www.howtogeek.com/150258/how-to-save-time-by-using-snapshots-in-virtualbox/) we can follow [these 
steps](https://www.howtogeek.com/312883/how-to-shrink-a-virtualbox-virtual-machine-and-free-up-disk-space/) to shrink it.

Now a variety of things can be done, for instance we can install [Google-Chrome](https://www.google.co.uk/chrome/) and 
[sublime-text](https://www.sublimetext.com/).

## Google-Chrome
```
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install google-chrome-stable
```
now you can start `google-chrome`.

## sublime-text
```
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
```

## remarkable with MathJax
```
wget https://remarkableapp.github.io/files/remarkable_1.87_all.deb
sudo dpkg -i remarkable_1.87_all.deb
sudo apt-get install -f
git clone https://github.com/mathjax/MathJax.git MathJax
```
so that MathJax can be invoked from your Markdown document as follows,
```
<script type="text/javascript" src="/home/physalia/MathJax//MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/javascript" src="/home/physalia/MathJax/MathJax.js"></script>
```
An relatively easier option is [Mango](https://github.com/egrcc/Mango), also with the ability to generate HTML and PDF but does not require MathJax.

## R

It is preferable to have within the Linux system [R](https://cran.r-project.org/) and [RStudio](https://www.rstudio.com/). For
instance in the case of Fedora, you can issue
```
dnf list R R-devel
dnf list rstudio
```
to check their availability and

```
sudo dnf install R R-devel
wget https://download1.rstudio.org/rstudio-1.0.153-x86_64.rpm
sudo rpm -i rstudio-1.0.153-x86_64.rpm
```
to install. For Ubuntu, simply replace `dnf` with `apt`, e.g.,

```
sudo apt install r-base r-base-dev r-mathlib
wget https://download1.rstudio.org/rstudio-xenial-1.0.153-amd64.deb
sudo dpkg -i rstudio-xenial-1.0.153-amd64.deb
```
It is more involved to download the source and compile, since it would involve installation of various componets (LaTeX, readline, 
TCL/Tk, etc.) as well.

## Pre-course software

In the order of relevance, if possible, they are:

* [git](https://gist.github.com/derhuerst/1b15ff4652a867391f03)
* [Anaconda2](https://repo.continuum.io/)
* [GNU parallel](http://www.gnu.org/software/parallel/)
* [LAPACK](https://github.com/Reference-LAPACK)
* [JAGS](https://sourceforge.net/projects/mcmc-jags/)

Specific software for genetic data: fcgene, QCTOOL, PLINK, GCTA, BOLT-LMM, (locuszoom) MAGMA, depict, PASCAL finemap, TWAS, FUSION.

## R packages by day

1. Rcmdr, devtools

2. dplyr, tidyr, tidyverse, ggplot2, metafor, NCBI2R, genetics, gap, HardyWeinberg, haplo.stats, kinship2, pedigreemm

3. snpStats, GenABEL

4. lme4, MCMCglmm, openxlsx, SKAT

5. R2BGLiMS, MendelianRandomization

## Genetic analysis software

Software | URL | Notes
---------|-------------------------------------------------------|-----------------------
ANNOVAR | http://annovar.openbioinformatics.org/ ([wANNOVAR](http://wannovar.wglab.org/)) | Annotation
BEAGLE | https://faculty.washington.edu/browning/beagle/beagle.html | Genotype imputatoin
bedtools | http://bedtools.readthedocs.io/en/latest/ | Data manipulation
BOLT-LMM | https://data.broadinstitute.org/alkesgroup/BOLT-LMM/ | Mixed modeling
DEPICT | [Broad](https://data.broadinstitute.org/mpg/depict/), ([GitHub](https://github.com/perslab/depict)) | Pathway analysis
EIGENSOFT| https://data.broadinstitute.org/alkesgroup/EIGENSOFT/ | PCA
finemap | http://www.christianbenner.com/# | fine-mapping on sumstats
FUSION | https://github.com/gusevlab/fusion_twas | TWAS
GARFIELD | http://www.ebi.ac.uk/birney-srv/GARFIELD/
GCTA | http://cnsgenomics.com/software/gcta/ | Mixed model
GenABEL | http://www.genabel.org/ | GWA analysis on chip data
GRAIL | http://software.broadinstitute.org/mpg/grail/ ([VIZ-GRAIL](http://software.broadinstitute.org/mpg/grail/vizgrail.html)) | Obsolete pathway analysis software
GTOOL | http://www.well.ox.ac.uk/~cfreeman/software/gwas/gtool.html | Data manipulation
IMPUTE2 | http://mathgen.stats.ox.ac.uk/impute/impute_v2.html | Genotype imputation
LDhub | http://ldsc.broadinstitute.org/ldhub/
LDSC | https://github.com/bulik/ldsc | Heritability from sumstats
LocusZoom | http://locuszoom.sph.umich.edu/ | Regional association plot
MaCH | http://csg.sph.umich.edu/abecasis/MACH/index.html | Genotype imputation
MAGENTA | https://software.broadinstitute.org/mpg/magenta/ | Pathway analysis
MAGMA | http://ctg.cncr.nl/software/magma | Pathway analysis
METAL | http://csg.sph.umich.edu/abecasis/metal/download/ | Metal-analysis
PASCAL | http://www2.unil.ch/cbg/images/3/3d/PASCAL.zip, ([source](https://github.com/dlampart/Pascal)) | Pathway analysis
PLINK2 | https://www.cog-genomics.org/plink2 | Efficient data analysis on directly genotyped data
PLINKSEQ | https://atgu.mgh.harvard.edu/plinkseq/
ProbABEL | https://github.com/GenABEL-Project/ProbABEL | GWA analysis for linear, logistic and survival models
QCTOOL | http://www.well.ox.ac.uk/~gav/qctool/#overview | QC summary statistics
QUICKTEST | https://wp.unil.ch/sgg/quicktest/ | Gene-environment interaction analysis
RV-TDT | http://bioinformatics.org/rv-tdt/
rvtests | http://genome.sph.umich.edu/wiki/Rvtests ([GitHub](https://github.com/zhanxw/rvtests)) | Rare-variant analysis
samtools | https://github.com/samtools/ | Data manipulation
SEQPower | http://www.bioinformatics.org/spower/start
SHAPIT | https://mathgen.stats.ox.ac.uk/genetics_software/shapeit/shapeit.html | Haplotype phasing
SNPTEST | https://mathgen.stats.ox.ac.uk/genetics_software/snptest/snptest.html | Analysis of imputed genotype data
UNPHASED | https://sites.google.com/site/fdudbridge/software/unphased-3-1 | Haplotype analysisi
VAT | http://varianttools.sourceforge.net/Association/HomePage
vcftools | https://vcftools.github.io/index.html | Data manipulation
VEGAS2 | [online version](https://vegas2.qimrberghofer.edu.au), [command-line version](https://vegas2.qimrberghofer.edu.au/zVEGAS2offline.tgz) | Annotation
VEP | http://www.ensembl.org/info/docs/tools/vep/index.html | Annotation

This is an extension of the [Baylor list](https://statgen.research.bcm.edu/index.php/Genassoc2016). The old [Columbia/Rockefeller list](https://github.com/gaow/genetic-analysis-software) may still contain useful links.

Institutional repositories are increasingly available, e.g. [Eskin group](http://genetics.cs.ucla.edu/), [Broad Institute](https://github.com/broadinstitute).

## Generic software

[JAGS](https://sourceforge.net/projects/mcmc-jags/) `is Just Another Gibbs Sampler. It is a program for the statistical analysis of Bayesian hierarchical models by Markov Chain Monte Carlo.`

[R](https://www.r-project.org/) `is a free software environment for statistical computing and graphics. It compiles and runs on a wide variety of UNIX platforms, Windows and MacOS`.

[SAS](http://www.sas.com) `(pronounced "sass") once stood for "statistical analysis system." It began at North Carolina State University as a project to analyze agricultural research. Demand for such software capabilities began to grow, and SAS was founded in 1976 to help customers in all sorts of industries – from pharmaceutical companies and banks to academic and governmental entities. SAS – both the software and the company – thrived throughout the next few decades. Development of the software attained new heights in the industry because it could run across all platforms, using the multivendor architecture for which it is known today. While the scope of the company has spread across the globe, the encouraging and innovative corporate culture has remained the same.`

[Stan](http://mc-stan.org/) `(Thousands of users rely on Stan) for statistical modeling, data analysis, and prediction in the social, biological, and physical sciences, engineering, and business.`

[Stata](http://www.stata.com) `is a complete, integrated statistical software package that provides everything you need for data analysis, data management, and graphics.`
