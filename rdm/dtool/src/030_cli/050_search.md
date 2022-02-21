## Finding a dataset

A testing lookup server makes datasets placed on `s3://test-bucket` and `smb://test-share` 
searchable. The searchable index is accessible via 
a graphical user interface [dtool-lookup-gui](https://github.com/livMatS/dtool-lookup-gui),
a command line interface [dtool-lookup-client](https://github.com/jic-dtool/dtool-lookup-client), 
as well as a Python interface [dtool-lookup-api](https://github.com/livMatS/dtool-lookup-api).

The testing lookup server allows access via user `testuser` and password `test_password`. With the `dtool-lookup-client`, query all entries on the lookup server
via 

```console
$ dtool query '{}'
Authentication URL https://132.230.223.113:5001/token password:
[
  {
    "base_uri": "smb://test-share",
    "created_at": 1604860720.736,
    "creator_username": "jotelha",
    "dtoolcore_version": "3.17.0",
    "frozen_at": 1643237269.784,
    "name": "simple_test_dataset",
    "tags": [],
    "type": "dataset",
    "uri": "smb://test-share/1a1f9fad-8589-413e-9602-5bbd66bfe675",
    "uuid": "1a1f9fad-8589-413e-9602-5bbd66bfe675"
  },
  {
    "base_uri": "s3://test-bucket",
    "created_at": 1604860720.736,
    "creator_username": "jotelha",
    "dtoolcore_version": "3.17.0",
    "frozen_at": 1643237360.858,
    "name": "simple_test_dataset",
    "tags": [],
    "type": "dataset",
    "uri": "s3://test-bucket/1a1f9fad-8589-413e-9602-5bbd66bfe675",
    "uuid": "1a1f9fad-8589-413e-9602-5bbd66bfe675"
  }
]
```

or just datasets found on s3-endpoints with

```console
$ dtool query '{"base_uri":{"$regex":"^s3"}}'
[
  {
    "base_uri": "s3://test-bucket",
    "created_at": 1604860720.736,
    "creator_username": "jotelha",
    "dtoolcore_version": "3.17.0",
    "frozen_at": 1643237360.858,
    "name": "simple_test_dataset",
    "tags": [],
    "type": "dataset",
    "uri": "s3://test-bucket/1a1f9fad-8589-413e-9602-5bbd66bfe675",
    "uuid": "1a1f9fad-8589-413e-9602-5bbd66bfe675"
  }
]
```

or use the Python API after `pip install dtool-lookup-api` in a similar fashion with

```ipython
In [1]: from dtool_lookup_api import query
   ...: res = query(
   ...:     {
   ...:         'readme.owners.name': {'$regex': '^Testing User$'},
   ...:     }
   ...: )

In [2]: res
Out[2]:
[{'base_uri': 'smb://test-share',
  'created_at': 'Sun, 08 Nov 2020 18:38:40 GMT',
  'creator_username': 'jotelha',
  'dtoolcore_version': '3.17.0',
  'frozen_at': 'Wed, 11 Nov 2020 17:20:30 GMT',
  'name': 'simple_test_dataset',
  'tags': [],
  'type': 'dataset',
  'uri': 'smb://test-share/1a1f9fad-8589-413e-9602-5bbd66bfe675',
  'uuid': '1a1f9fad-8589-413e-9602-5bbd66bfe675'}]
```

At the first invocation, the CLI or API will ask for the user's password. For subsequent invocations, an access token is cached locally within the `~/.config/dtool/dtool.json`. 
Above queries are formulated in the MongoDB language. The [MongoDB documenatation](https://docs.mongodb.com/manual/introduction/) offers information on how to formulate queries. The [list of available query operators](https://docs.mongodb.com/manual/reference/operator/query/) is particularly useful. 
