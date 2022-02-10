# dtool lookup server configuration

For configuring access to the lookup server, put   

```json
{
  "DTOOL_LOOKUP_SERVER_TOKEN_GENERATOR_URL": "https://132.230.223.113:5001/token",
  "DTOOL_LOOKUP_SERVER_URL": "https://132.230.223.113:5000",
  "DTOOL_LOOKUP_SERVER_USERNAME": "testuser",
  "DTOOL_LOOKUP_SERVER_VERIFY_SSL": "false"
}
```

into your `~/.config/dtool/dtool.json`.
A complete configuration file may look like this: 

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

  "DTOOL_SMB_DOMAIN_test-share": "WORKGROUP",
  "DTOOL_SMB_PASSWORD_test-share": "a-guest-needs-no-password",
  "DTOOL_SMB_PATH_test-share": "dtool",
  "DTOOL_SMB_SERVER_NAME_test-share": "132.230.223.113",
  "DTOOL_SMB_SERVER_PORT_test-share": 4445,
  "DTOOL_SMB_SERVICE_NAME_test-share": "sambashare",
  "DTOOL_SMB_USERNAME_test-share": "guest",

  "DTOOL_README_TEMPLATE_FPATH": "/path/to/.dtool_readme.yml",

  "DTOOL_USER_EMAIL": "you@your-dept.your-institution",
  "DTOOL_USER_FULL_NAME": "Your full name"
}
```

You can download this sample [`dtool.json`](../../samples/dtool-external.json)
and modify it according to your needs.
