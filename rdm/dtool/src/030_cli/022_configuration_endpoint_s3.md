## S3 endpoint configuration

Add the S3 account details for the `test-bucket` bucket using the format below to your `~/.config/dtool/dtool.json` file:

```json
{
  "DTOOL_S3_ACCESS_KEY_ID_test-bucket": "testuser_access_key",
  "DTOOL_S3_DATASET_PREFIX": "u/testuser/",
  "DTOOL_S3_ENDPOINT_test-bucket": "http://132.230.223.113:9000",
  "DTOOL_S3_SECRET_ACCESS_KEY_test-bucket": "testuser_secret_key",
}
```

Note that the name of the endpoint must match the name of the bucket on the S3 system, i.e. you *must* name your endpoint `test-bucket`. **Make sure that `DTOOL_S3_DATASET_PREFIX` ends with a slash.**

If properly set up, the `dtool.json` file should also contain other keys like `DTOOL_README_TEMPLATE_PATH`, `DTOOL_USER_FULL_NAME` and `DTOOL_USER_EMAIL`. Make sure to properly embed the snippet above with correct JSON syntax. A correct configuration might look like this:

```json
{
  "DTOOL_LOOKUP_SERVER_TOKEN_GENERATOR_URL": "https://132.230.223.113:5001/token",
  "DTOOL_LOOKUP_SERVER_URL": "https://132.230.223.113:5000",
  "DTOOL_LOOKUP_SERVER_USERNAME": "testuser",
  "DTOOL_LOOKUP_SERVER_VERIFY_SSL": "false",

  "DTOOL_S3_ACCESS_KEY_ID_test-bucket": "testuser_access_key",
  "DTOOL_S3_DATASET_PREFIX": "u/testuser/",
  "DTOOL_S3_ENDPOINT_test-bucket": "http://132.230.223.113:9000",
  "DTOOL_S3_SECRET_ACCESS_KEY_test-bucket": "testuser_secret_key",
  
  "DTOOL_README_TEMPLATE_FPATH": "/path/to/.dtool_readme.yml",
  
  "DTOOL_USER_EMAIL": "you@your-dept.your-institution",
  "DTOOL_USER_FULL_NAME": "Your full name"
}
```

To test your configuration, run
```bash
dtool ls s3://test-bucket
```
to see the datasets that are presently available. This may take a long time for many datasets.
