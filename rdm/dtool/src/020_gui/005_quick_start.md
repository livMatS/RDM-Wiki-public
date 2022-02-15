## Quick start

### Set-up

Navigate to [https://github.com/IMTEK-Simulation/dtool-lookup-gui/releases](https://github.com/IMTEK-Simulation/dtool-lookup-gui/releases) and download the latest release zip file containing the dtool lookup gui for your OS (currently Windows and Linux offered).

Unpack the zip archive and launch the application. On a Linux machine, you will have to make the unpacked file executable first with

```bash
chmod +x dtool-lookup-gui
```

When you launch the GUI for the first time,
it may look quite empty:

![Clean start](./img/010_clean_start.png)

Open the main menu by clicking the *burger* menu in the upper right corner and select *settings*.

![Main menu](./img/015_main_menu.png)

Download the sample configuration for a testing server instance at
[`dtool.json`](https://raw.githubusercontent.com/livMatS/RDM-Wiki-public/master/rdm/dtool/samples/dtool-external.json).

![Sample dtool.json](./img/032_download_dtool_json_save_as.png)

Import it via the *import* in the *settings* dialog

![Import config icon](./img/040_import_dtool_config.png)

and selecting the downloaded file.

![Import config icon](./img/042_import_dtool_config_select_file.png)

The imported settings will then appear in the dialog.

![Import config icon](./img/050_imported_dtool_config.png)

dtool uses cacheable tokens to facilitate authentication against the lookup server. Click on *renew token* to fetch such a token. Authenticate with your username and password. 

![Import config icon](./img/060_authentication.png)

For the testing configuration, it's `testuser` and `test_password`. The generated token appears in the settings dialog.

![Renewed token](./img/070_renewed_token.png)

You won't have to authenticate again until the cached token looses its validity. 

After importing the configuration and closing the settings dialog, you will find these settings stored within `~/.config/dtool/dtool.json` below your user's home folder. The GUI will list two new *base URIs* on the left-hand side: 

![After configuration](./img/080_after_configuration.png)

The prefix indicates the type of protocol used to communicate with the underlying storage infrastructure. *s3* points to s3-compatible object storage like [Amazon S3](https://en.wikipedia.org/wiki/Amazon_S3), [*smb*](https://en.wikipedia.org/wiki/Server_Message_Block) points to network storage better known as Windows shares. The tesitng server instance offers `s3://test-bucket` and `smb://test-share` to play around with. Browse those locations by selecting them.

![S3 bucket after coniguration](./img/084_after_configuration_s3_bucket.png)

The first entry in the list plays a special role. Here you can see and search through all the datasets that have been indexed by the lookup server:

![Lookup results after configurations](./img/082_after_configuration_lookup_results.png)

In the central column you see the list of datasets. On the right-hand side you see a few buttons, the *Details*, *Manifest* and *Dependencies* tab, and below them the fixed administrative and editable descriptive metadata. The latter is shown as [YAML](https://yaml.org/)-highlighted text. 

### Add a local base URI

Add a local folder to the list of base URIs by clicking on the folder icon in the upper left corner

![Open local base URI](./img/090_open_local_base_uri.png)

and selecting the desired location.

![Select path as local base URI](./img/092_open_local_base_uri_select_path.png)

To distinguish them from other (remote) endpoints, local base URIs come with the `file://` prefix.

![Empty local baseURI](./img/100_empty_local_base_uri.png)

### Copy a dataset from remote to local
Now, copy a dataset from a remote location to your local machine. Select a dataset on the s3-endpoint and download it by choosing your local folder from the *copy*-button's drop-down menu:

![Copy fromS3 to local base URI](./img/110_copy_from_s3_to_local_base_uri.png)

The dataset will appear at your local base URI:

![Copied dataset at local base URI](./img/120_copied_dataset_at_local_base_uri.png). 

Notice the *dataset URI* entry in the administrative metadata.

![Manifest and show tooltip](./img/130_manifest_and_show_tooltip.png)

The *Manifest* lists all items contained within the dataset. Click on *Show* to explore the dataset with the local file system browser.

### Create a dataset

Download the [README.yml](https://raw.githubusercontent.com/livMatS/RDM-Wiki-public/master/rdm/dtool/samples/dtool_readme.yml) template.

![Download readme template](./img/200_download_readme_template.png)

Adapt it to your needs in a text editor.

Point the GUI to this template at the bottom of settings dialog

![Open readme template](./img/207_open_readme_template.png)

or just open your `.config/dtool/dtool.json` in a text editor and set the `DTOOL_README_TEMPLATE_FPATH` entry to point to your `README.yml` template:

![Modify dtool.json](./img/210_modify_dtool_json.png)

Specify your name and e-mail address as well.
Next, create a new dataset by selecting your local base URI and clicking the '+' icon in the upper left corner:

![Create dataset](./img/220_create_dataset.png)

Pick a name

![Pick dataset name](./img/230_pick_dataset_name.png)

and notice the new entry in the list of datasets.

![After dataset creation](./img/240_after_dataset_creation.png)

You see a new *UUID* in bold assigned to the freshly created dataset. This is an important concept. No matter how your dataset is stored,
how it's moved around, or how many copies of it are created, this *Universally Unique IDentifier* will stay 
with your dataset over its whole lifetime. No other dataset will ever own the same UUID. It hence serves as a [persistent identifier](https://en.wikipedia.org/wiki/Persistent_identifier), an important building block for implementing the [FAIR principles](https://doi.org/10.1038/sdata.2016.18) [^1].

The UUID is prefixed by an asterisk '*' to mark it as a *ProtoDataset*. If configured correctly, the `README.yml` template should appear as descriptive metadata for the fresh dataset with some placeholders automatically filled in.

Enable the metadata editing switch at the bottom and fill in some more descriptive metadata in [YAML](https://yaml.org/) format.

![Editing metadata](./img/250_editing_metadata.png)

Add items to your dataset,

![Add items](./img/260_add_items.png)

and freeze it,

![Freeze dataset](./img/270_freeze.png)

confirming the warning.

![Freeze confirmation](./img/280_freeze_confirmation.png)

Freezing means making the dataset immutable. The *ProtoDataset* turns into a *Datset*, the asterisk mark disappears. It's now forbidden to alter the content. You may inspect the manifest

![Manifest](./img/290_frozen_dataset_manifest.png)

and explore the contents with your file system browser.

![Show](./img/300_frozen_dataset_show.png)

### Structure of a dataset

The dataset's top level holds the `README.yml`, the `data` and the `.dtool` directories:

![Top level content](./img/310_dataset_top_level_content.png)

The `README.yml` just contains what you have entered as descriptive metadata in YAML-formatted text:

![README.yml content](./img/320_dataset_readme_content.png)
 
The `data` directory holds all items:

![README.yml content](./img/330_dataset_data_content.png)

The `.dtool` directory contains administrative and structural metadata distributed into several small files.

![.dtool content](./img/340_dataset_.dtool_content.png)

It is designed to be both machine-processible but also human-readible. As such, it holds a `README.txt` describing the meaning of all items within:

![.dtool/README.txt content](./img/345_dataset_.dtool_readme_content.png)

The `manifest.json` holds size and checksums of all items at the point of freezing, making any illegal tempering with the items of the frozen dataset immediately noticeable:

![.dtool/manifest.json content](./img/350_dataset_manifest_content.png)

For more information on the structure of a dataset, refer to the software authors' [publication](https://peerj.com/articles/6562/#) [^2].

### Search for a dataset

Copy your frozen dataset to the `s3://test-bucket`,

![Copy from local base URI to S3](./img/400_copy_from_local_base_uri_to_s3.png)

and confirm it's there,

![Copied dataset at S3 endpoint](./img/410_copied_dataset_at_s3_endpoint.png)

Depending on the server's configuration, it will register new datasets immediately or just at certain time intervals. After that has happened, the dataset will appear on the `Lookup server` dataset list,

![New dataset in index](./img/500_new_dataset_in_index.png)

The lookup server makes the dataset discoverable by its administrative and descriptive metadata. A search query may be plain text ad aim at content of the `README.yml`, i.e.

![.dtool/README.txt content](./img/510_text_search.png)

or formulated more specifically to aim at certain fields of the `README.yml`,   

![.dtool/README.txt content](./img/520_mongo_search.png)

To understand more about the possibilities for sophisticated querying, continue reading [Finding a dataset](../030_cli/050_search.md).

### Reporting issues

Please report any issues with the dtool lookup GUI at https://github.com/IMTEK-Simulation/dtool-lookup-gui/issues, any issues with this documentation at https://github.com/livMatS/RDM-Wiki-public/issues, or to [data@livmats.uni-freibur.de](mailto:data@livmats.uni-freiburg.de). Thank you.

Note that datasets on the testing storage locations used hera are 
**readable globally** by anyone, **not deletable** once deposited there, 
**not backed up**, and may disappear at any time.

[^1]: T. S. G. Olsson and M. Hartley, “Lightweight data management with dtool,” PeerJ, vol. 7, p. e6562, Mar. 2019, doi: [10.7717/peerj.6562](https://doi.org/10.7717/peerj.6562).

[^2]: M. D. Wilkinson et al., The FAIR Guiding Principles for scientific data management and stewardship, Scientific Data, vol. 3, no. 1, Art. no. 1, Mar. 2016, doi: [10.1038/sdata.2016.18](https://doi.org/10.1038/sdata.2016.18).
