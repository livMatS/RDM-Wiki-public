## Transfer

### Copying dataset

Datasets can be copied with `dtool cp`. Note that `dtool` supports multiple storage backends.

To copy datasets into the testing S3 storage, execute
```
dtool cp <name_of_the_dataset> s3://test-bucket
```

To copy datasets from the S3 storage to your local computer, you need the UUID of the dataset. The UUIDs are listed when you list the dataset with `dtool ls s3://test-bucket`. You can also query the UUID of a dataset through `dtool uuid <name_of_the_dataset>`. Copy the dataset to your local storage with:
```
dtool cp s3://test-bucket/<UUID> .
```

Dtool first copies the dataset to cache, so it is recommended to change the cache directory to a workspace. Otherwise, one risks filling the cache directory before the transfer is complete.   
```
dtool config cache <path_to_directory>
```
Note that `dtool cp` can also copy between two remote storage locations.
