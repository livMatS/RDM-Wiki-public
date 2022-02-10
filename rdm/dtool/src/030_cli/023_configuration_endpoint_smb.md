## smb endpoint configuration

Add the account details for the `test-share` Windows (smb) share using the format below to your `~/.config/dtool/dtool.json` file:

```json
{
  "DTOOL_SMB_DOMAIN_test-share": "WORKGROUP",
  "DTOOL_SMB_PASSWORD_test-share": "a-guest-needs-no-password",
  "DTOOL_SMB_PATH_test-share": "dtool",
  "DTOOL_SMB_SERVER_NAME_test-share": "132.230.223.113",
  "DTOOL_SMB_SERVER_PORT_test-share": 4445,
  "DTOOL_SMB_SERVICE_NAME_test-share": "sambashare",
  "DTOOL_SMB_USERNAME_test-share": "guest"
}
```

If properly set up, the `dtool.json` file should also contain other keys like `DTOOL_README_TEMPLATE_PATH`, `DTOOL_USER_FULL_NAME` and `DTOOL_USER_EMAIL`. Make sure to properly embed the snippet above with correct JSON syntax.

To test your configuration, run
```bash
dtool ls smb://test-share
```
to see the datasets that are presently available. This may take a long time for many datasets.
