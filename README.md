

# Concept Drift Detection in Discrete Streaming Data Using Probabilistic Graphical Models

## R. Cabañas, A. Cano, M. Gómez-Olmedo,  A. Masegosa, S. Moral

*Paper submitted to IPMU 2018 (under review)*

This repository contains the required material for the experimentation given in the paper.  In particular, it is organised as follows:

 - ![](https://raw.githubusercontent.com/rcabanasdepaz/files/master/img/gitfolder_small.png) **R**: this folder contains all the R scripts for generating the data sets, modifying them, and creating the graphs with the results.


 - ![](https://raw.githubusercontent.com/rcabanasdepaz/files/master/img/gitfolder_small.png) **datasets**:  this folder contains the data sets used in the experimentation (i.e., the synthetic and intrusion data sets) which are provided in multiple .arff files. 
 - ![](https://raw.githubusercontent.com/rcabanasdepaz/files/master/img/gitfolder_small.png) **java**: maven project for running the experiments. This uses AMIDST 0.6.2. The code implementing the concept drift detector is given in this folder. For easily running the experiments shown in the paper, see the section below.
 
 
 ## Running the paper experiments
 
 
First, download the example project code:

```bash
$ git clone https://github.com/PGMLabSpain/2017-CDdiscrete-Code.git
```

Enter in the downloaded java folder:

```bash
$ cd 2017-CDdiscrete-Code/java/
```

The code for running the experiments is in the file **./src/main/java/BasicExample.java**. You can modify it as you want.

Compile and build the package:

```bash
$ mvn clean package
```

Finally, run the code example previously mentioned:

```bash
$ java -cp target/example-project-full.jar ipmu_run

```


*Requirements: git, maven, Java8*



 
