## Configuration

Please tell `dtool` about yourself. It needs your name and your email address. This information will later be used in the metadata template.
```
dtool config user name "Your Full Name"
dtool config user email "your@email.com"
```

The dtool configuration resides within `~/.config/dtool/dtool.json`. The above commands will create such a file with content

```json
{
  "DTOOL_USER_EMAIL": "your@email.com",
  "DTOOL_USER_FULL_NAME": "Your Full Name"
}
```

You can edit this file manually.

You will also want to use a template for filling out metadata when creating datasets.
For now, use the template

```yaml
project: Project name
description: Short description
owners:
  - name: {DTOOL_USER_FULL_NAME}
    email: {DTOOL_USER_EMAIL}
    username: {username}
    orcid: Please obtain an ORCID at orcid.org
funders:
  - organization: Deutsche Forschungsgemeinschaft (DFG)
    program: Clusters o Excellence
    code: EXC 2193
creation_date: '{date}'
expiration_date: '{date}'
derived_from:
  - uuid: UUID of the primary data or the previous simulation step
```

Put this YAML-formatted content into some file, i.e. `~/.dtool_readme.yml` and
point dtool there with

```bash
dtool config readme-template ~/.dtool_readme.yml
```