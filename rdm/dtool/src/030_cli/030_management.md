## Managing datasets

A `dtool` dataset consists of a number of files and some metadata, including information on file sizes, hashes (generated automatically) and keywords set by the user. Start by creating an empty dataset:  
```
dtool create <name_of_the_dataset>
```
This will create an empty dataset that contains the file `README.yml` and the subdirectory `data`. There is also a hidden directory `.dtool` that contains administrative data used by dtool.

You can add files to the dataset by  
```
dtool add item <file> <name_of_the_dataset>
```
or just placing the files into the subdirectory  ```<name_of_the_dataset>/data/```. Note that a possible workflow is to create a dataset before running a simulation, and then running that simulation within the `data` subdirectory of the dataset.

## Editing metadata

Metadata is a type of dictionary that is attached to the dataset. In its simple version, it is a number of keys with the accompanying values. At any stage you can add keys and values to the dataset using
```
dtool readme edit <name_of_the_dataset>
```
or by just editing the file `README.yml` inside the dataset directory. (Note that `dtool readme edit` just launches an editor -- typically `vi` -- for that file.) This file in the [YAML](https://yaml.org/) format. Make sure to familiarize yourself with _YAML_. You can use [yamllint](https://github.com/adrienverge/yamllint) to check the syntax.

When editing the metadata `README` file, you are completely free in choosing key-value pairs. `dtool` incorporates a mechanism in which you can set predefined keys by providing a _template_. This template can be stored in any file. Our recommendation is to use `$HOME/.dtool_readme.yml`. Please use the following template file:
```yaml
project: Project name
description: Short description
owners:
  - name: {DTOOL_USER_FULL_NAME}
    email: {DTOOL_USER_EMAIL}
    username: {username}
    orcid: Please obtain an ORCID at orcid.org
funders:
  - organization: Please add funding organization
    program: Please add the specific program within which funding occured
    code: Please add funding code of that organization
creation_date: '{date}'
expiration_date: '{date}'
derived_from:
  - uuid: UUID of the primary data or the previous simulation step
```
Note that this structure allows the specification of an arbitrary number of owners and [funders](Funders.md). `derived_from` is optional and only necessary if this is derived data. Please specify then the UUID of the primary data.

Tell `dtool` to use this template by executing
```
dtool config readme-template $HOME/.dtool_readme.yml
```
Note that you can of course keep multiple templates for different projects and switch between them with this command.

You can now fill the `README.yml` of your dataset by calling
```
dtool readme interactive <name_of_the_dataset>
```
This launches an interactive mode in which you are queried for the metadata specified in the template file. Please use the above template. You can of course add any further keys to the template file.

### 'Freezing' a dataset

Datasets can be modified until they are frozen. 'Freeze' the dataset with  
```
dtool freeze <name_of_the_dataset>
```
This saves hashes of all files in the metadata for the dataset. The hashes can be checked later to verify that the data has not been modified since:  
```
dtool verify <name_of_the_dataset>
```
Freezing will also generate a unique identifier (a UUID) for your dataset. You can query the UUID with
```
dtool uuid <name_of_the_dataset>
```
When referring to a dataset, always use the UUID as the name of the dataset is not necessarily unique.

### Listing datasets

`dtools ls .` will give you a list with all datasets in the present directory. The color of the name allows you to distinguish between live (red) and frozen (green) datasets.

The following terminal session recording demonstrates dtool configuration, dataset creation, filling out metadata, dataset freezing, and dataset inspection. 

[![asciicast](https://asciinema.org/a/447560.svg)](https://asciinema.org/a/447560)


### Optional: Per-file metadata

Metedata for individual files can be added to a dataset in the form of so called [overlays](https://dtool.readthedocs.io/en/latest/working_with_overlays.html#creating-overlays), that contain a boolean or string value for each file in the dataset. This could be used to flag simulation input files, MD trajectories, etc. The example below uses a regular expression to flag all files ending in ".nc" as MD trajectories:  
```
dtool overlays glob <name_of_the_dataset> is_MD_trajectory '*.nc' | dtool overlays write <name_of_the_dataset> -
```  
(Note that overlays created by the first part of the command are not saved anywhere, and thus need to be piped directly into the second part of the command.)  

You can display the overlays for a dataset with  
```
dtool overlays show <name_of_the_dataset>
```

Please refer to the [documentation](https://dtool.readthedocs.io/en/latest/working_with_overlays.html#creating-overlays) for all options to create an overlay.
