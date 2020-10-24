# README
This README contains instructions on how to install DiPS with all dependencies from this packaging. 
These install instructions are solely applicable for TACAS submission as they are verified only on for the Zenodo Ubuntu 20 Virtual Machine.
Further, we include instructions on how to run DiPS.
For an introduction, we follow the reader to tutorial.pdf included in DiPS folder. 
Finally, we show how to obtain the full set of results we have obtained in the publications - HSB and this one.

## WEB SITE
Visit the DiPS website for the latest news and downloads:

 	https://github.com/xhajnal/DiPS

## CONTACT AND CITE

Visit the DiPS website for the latest information on how to contact or how to cite our work:

 	https://github.com/xhajnal/DiPS

If you have problems, questions, ideas, or suggestions, please contact us.


## INSTALL

### Setting files
copy the package and unwrap it in the desired location, e.g. home
Now, please, open the command line the location of the unwrapped package


### Install tkinter prerequisities before building Python
tkinter is a bit problematic to install withouth Internet, please run:
>> cd tkinter
>> tar -xf ActiveTcl-8.6.9.tar.gz
>> sudo ./ActiveTcl-8.6.9.8609.2-x86_64-linux-glibc-2.5-dcd3ff05d/install.sh

during installation simply continue with the default settings


### Install packages
>> cd ../packages
>> sudo dpkg -i *.deb


### Install python 3.7

As the default python 3.8 has some difficulties running DiPS, please install Python 3.7.6 with the following commands (It will take a while):

>> cd ..
>> tar -xvzf Python-3.7.6.tgz
>> cd Python-3.7.6
(option 1 - faster build)
>> ./configure --with-tcltk-includes='-I/opt/ActiveTcl-8.6/include' --with-tcltk-libs='/opt/ActiveTcl-8.6/lib/libtcl8.6.so /opt/ActiveTcl-8.6/lib/libtk8.6.so'
(option 2 - faster run)
>> ./configure --with-tcltk-includes='-I/opt/ActiveTcl-8.6/include' --with-tcltk-libs='/opt/ActiveTcl-8.6/lib/libtcl8.6.so /opt/ActiveTcl-8.6/lib/libtk8.6.so' --enable-optimizations
>> make
>> make test
>> sudo make install

It will install this version as python3.7,
you can verify the installation using:
>> python3.7 --version

with the expected result "Python 3.7.6"

You can verify tkinter installation using:
>> python3.7
>>> import tkinter
>>> tkinter._test()


### Install python packages
Now, please install all necessary python packages
>> cd ../python_packages
>> for i in ./*.* ; do sudo pip3 install $i ; done

(Note:) due to dependencies you will probably have to run the last command more times, or you can reinstall packages for which dependencies were about to be installed with the following command
>> sudo pip3 install <insert the name of file for the respective package>

We apologise for this inconvenience. 


### Setup z3 
Now we setup z3 solver links
>> cd ../z3
>> MYZ3="$PWD"
>> export LD_LIBRARY_PATH=$MYZ3/bin:$LD_LIBRARY_PATH
>> export PYTHONPATH=$MYZ3/bin/python


## Install dreal prerequisities
>> cd ../Ibex
>> tar xvfz ibex-2.8.9.tgz
>> cd ibex-2.8.9
>> ./waf configure --lp-lib=soplex
>> sudo ./waf install


### Install PRISM
The only necessary dependency of DiPS to complete the whole workflow is a probabilistic model checker.
Here we use the easiest option - PRISM. Please install PRISM with the following command.

>> cd ..
>> tar -xf prism-4.5-linux64.tar.gz
>> cd prism-4.5-linux64
>> ./install.sh


(Note:) you don't need to operate PRISM, all calls and I/O will be provided by DiPS.


### Setting DiPS config file
edit config.ini in DiPS folder

>> cd ../DiPS
>> gedit config.ini

and edit the location of the bin folder of PRISM in prism_path subsection, line 2, with the result similar to this:
prism_path = /home/tacas21/prism-4.5-linux64/bin

This allows DiPS to call PRISM.


## RUN DiPS Tool - GUI
Before you run DiPS, please set your VM to fullscreen
>> cd src
>> python3.7 gui.py


## FIRST USE

To make yourself familiar with DiPS GUI and its features, please follow DiPS/tutorial.pdf.


## REPRODUCIBILITY
Now you have managed to reproduce 1 of 3 results, namely the population size of 2 bees. 
In the HSB paper and tool paper, we provide results for population 5 and 10 bees.
To obtain these results, please follow the respective steps of the tutorial with using appropriate model and property files, (semisyn_5_bees.pm, semisyn_5_bees.pctl) and (semisyn_5_bees.pm, semisyn_5_bees.pctl) respectively. 
These input files can be found along with the input files for 2 bees, 'DiPS/models/example' and 'DiPS/properties/example' for the model and property files respectively.
(Note:) Metropolis-Hastings is not a deterministic procedure; the results may slightly differ.


## MORE EXAMPLES
We provide you with two more examples, 'parametric_die' and 'TBD'.
Files locations and the procedure is the same.
(Note:) When loading other models, please fix the values of constants in the model before running synthesis. We apologise for this inconvenience. 
(Note:) When using Rewards properties, please compute data intervals for these properties manually. 


## LICENCE
This software is provided under BSD-3-Clause License, see LICENCE.txt.