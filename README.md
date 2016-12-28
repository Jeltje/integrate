## INTEGRATE input data

INTEGRATE is a gene fusion caller that takes as input WGS and RNASeq fastq files. See the [INTEGRATE wiki](https://sourceforge.net/p/integrate-fusion/wiki/Home/) for more details.

This github repo contains source code for an [INTEGRATE dockstore workflow](https://dockstore.org/workflows/Jeltje/integrate) in [cwl](http://www.commonwl.org/v1.0/UserGuide.html). This workflow is based on a Dockerized version of INTEGRATE 0.2.6 (see the Dockerfile in this repo), which is the basis for an automated build at [quay.io](https://quay.io/). To use INTEGRATE independently of this workflow, do 
```
docker pull quay.io/jeltje/integrate 
```

### WORKFLOW

This workflow is based on the [SMC-RNA Dream Challenge examples] (https://github.com/Sage-Bionetworks/SMC-RNA-Examples). More information on the DREAM Challenge can be found on [Synapse](https://www.synapse.org/#!Synapse:syn2813589/wiki/).
Note that this _workflow_ is set up to only accept RNASeq inputs, which makes INTEGRATE less effective. However, the docker container has all the INTEGRATE functionality.

**Input** to the workflow is a tarfile that unpacks into a directory with indexed genome and annotation files (see below) and two `fastq` files (tumor and control). It consists of the following steps:
 1. Untar `INTEGRATE_GRCh37_index.tgz`
 2. Align the input fastq reads to the genome using [Tophat 2.1.1](https://ccb.jhu.edu/software/tophat/manual.shtml)
 3. Index the resulting `bam` files using [samtools1.3](https://github.com/samtools/)
 4. Find fusions using INTEGRATE

The output of this workflow is a file called `fusions.bedpe`. The bedpe format is described [here](http://bedtools.readthedocs.io/en/latest/content/general-usage.html#bedpe-format)

Docker files for samtools and tophat can be pulled as `quay.io/jeltje/samtools` and `quay.io/jeltje/tophat`, respectively

### Data

A tarfile named `INTEGRATE_GRCh37_index.tgz` is hosted on Synapse as syn7899823. It contains the following files:
- `genome.fa` is the GRCh37 human genome in fasta format
- `Homo_sapiens.GRCh37.75.txt` is the ENCODE version 75 annotation of the GRCh37 human genome in a format based on [UCSC's genePred](https://genome.ucsc.edu/FAQ/FAQformat#format9)
- `genome.<N>.ebwt`,  `<N>.bwt` and `<N>.rbwt`are index files for INTEGRATE
- `<N>.bw` are index files for bowtie1

To download files from Synapse:
* Register for a [Synapse account](https://www.Synapse.org/#!RegisterAccount:0) (this takes about a minute)
* Either download the samples from the [website GUI](https://www.Synapse.org/#!Synapse:syn5886029) or use the Python API
* `pip install Synapseclient`
* `python`
    * `import Synapseclient`
    * `syn = Synapseclient.Synapse()`
    * `syn.login('foo@bar.com', 'password')`
    * `syn.get('syn7899823', downloadLocation='.')`

