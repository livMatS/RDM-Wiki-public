## Quick start

For the impatient:

### Recommended preparations

Create a Python virtual environment, i.e. with

```bash
mkdir -p ~/venv  # create the folder venv if it does not exist yet
python3 -m venv ~/venv/dtool-venv
source ~/venv/bin/activate
pip install --upgrade pip
pip install wheel 

```

Depending on the system, you may have to adapt commands. 
Above sample ran on Ubuntu 20.04 with at least the system Python package
`python3-venv` installed. That's done with

```bash
sudo apt update
sudo apt install python3-venv
```

a priori.

### Installation

Install with 

```bash
pip install dtool
```

For working with the *liv*MatS-wide repository, you will also need

```bash
pip install dtool-s3
```

We recommend a few other optional packages, namely

* `dtool-lookup-api` for searching the testing repository programmatically via a Python API
* `dtool-lookup-client` for searching the testing repository via the command line
* `dtool-smb` for working with datasets on smb (Windows) shares like the testing smb share `smb://test-share`

```bash
pip install dtool-lookup-api dtool-lookup-client dtool-smb
```

### Configuration

For just getting started with manipulating datasets locally, 

```bash
dtool config user name "Your Full Name"
dtool config user email "your@email.com"
```

Also, download [this metadata template](../../samples/dtool_readme.yml)
and place it at `~/.dtool_readme.yml`. Configure `dtool` to use it with

```bash
dtool config readme-template $HOME/.dtool_readme.yml
```

### Create, document and freeze a dataset

Now, start experimenting with dtool. A first trial may look like this:

```console
$ dtool create my-first-dataset
Created proto dataset file://my-machine/home/my-username/my-first-dataset
Next steps: 
1. Add raw data, eg:
   dtool add item my_file.txt file://my-machine/home/my-username/my-first-dataset
   Or use your system commands, e.g: 
   mv my_data_directory /home/my-username/my-first-dataset/data/
2. Add descriptive metadata, e.g: 
   dtool readme interactive file://my-machine/home/my-username/my-first-dataset
3. Convert the proto dataset into a dataset: 
   dtool freeze file://my-machine/home/my-username/my-first-dataset
$ dtool add item ~/.dtool_readme.yml my-first-dataset
$ dtool readme interactive my-first-dataset
project [Project name]: dtool exploration
description [Short description]: Contains the livMatS metadata template itself
name [Johannes Laurin Hoermann]: 
email [data@livmats.uni-freiburg.de]: 
username [jotelha]: 
orcid [Please obtain an ORCID at orcid.org]:  0000-0001-5867-695X 
organization [DFG]:
program [Clusters of Excellence]: 
code [EXC 2193]: 
creation_date [2021-12-01]: 
expiration_date [2021-12-01]: 2031-12-01 
Updated readme 
To edit the readme using your default editor:
dtool readme edit file://my-machine/home/my-username/my-first-dataset
$ dtool freeze my-first-dataset
Generating manifest  [####################################]  100%  .dtool_readme.yml
Dataset frozen file://my-machine/home/my-username/my-first-dataset
$ dtool ls .
my-first-dataset
  file://my-machine/home/my-username/my-first-dataset
$ dtool ls -v .
my-first-dataset
  file://my-machine/home/my-username/my-first-dataset
  jotelha  2021-12-01  055e2506-6723-45bd-a3f3-1a69e318ec87
$ dtool ls my-first-dataset
72d8c2a4a04d015a0766dbaab94d7cb256bb3431	.dtool_readme.yml
$ dtool summary my-first-dataset/
name: my-first-dataset
uuid: 055e2506-6723-45bd-a3f3-1a69e318ec87
creator_username: jotelha
number_of_items: 1
size: 435.0B
frozen_at: 2021-12-01
```

Above, you see a *UUID* `055e2506-6723-45bd-a3f3-1a69e318ec87` assigned to the
freshly created dataset. This is an important concept. No matter how your dataset is stored,
how its moved around, or how many copies of it are created, this *Universally Unique IDentifier* will stay 
with your dataset over its whole lifetime. No other dataset will ever own the same UUID.
It hence serves as a [persistent identifier](https://en.wikipedia.org/wiki/Persistent_identifier),
an important building block for implementing the [FAIR principles](https://doi.org/10.1038/sdata.2016.18) [^1].

Also, watch this [introductory terminal session recording](https://asciinema.org/a/447560)
and look at the [quick start guide](https://dtool.readthedocs.io/en/latest/quick_start_guide.html) 
in the official docs.

### What's next

For access to the testing server, read [TODO](TODO)  
and how to configure `dtool` accordingly for [S3 storage access](022_configuration_endpoint_s3.md),
 [Windows share access](023_configuration_endpoint_smb.md)
and [lookup server access](024_configuration_lookup_server.md).

When set up, you will be able to copy datasets created locally to the testing 
object storage, i.e. with

```bash
dtool cp my-first-dataset s3://test-bucket
```

or to the testing Windows share, i.e. with

```bash
dtool cp my-first-dataset smb://test-share
```

Note that datasets on these testing storage locations are 
**readable globally** by anyone, **not deletable** once deposited there, 
**not backed up**, and may disappear at any time.

[^1]: M. D. Wilkinson et al., The FAIR Guiding Principles for scientific data management and stewardship, Scientific Data, vol. 3, no. 1, Art. no. 1, Mar. 2016, doi: [10.1038/sdata.2016.18](https://doi.org/10.1038/sdata.2016.18).
