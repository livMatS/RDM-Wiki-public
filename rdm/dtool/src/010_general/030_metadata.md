## Metadata

A dataset _always_ has metadata attached to it. Common formats for specifying metadata of arbitrary complexity are [YAML](https://yaml.org/) and [JSON](https://www.json.org). YAML is suitable for specifying metadata in simple key-value pairs, but can do much more. The [YAML cheatsheet](https://quickref.me/yaml) offers a compact overview on both formats. Often, metadata are categorized into administrative, bibliographic and descriptive metadata. The example below shows a minimum example of administrative metadata in YAML format. 

```yaml
project: 2021-11-29-livmats-rdm-wiki-dtool-intro
description: guidelines on how to implement the livMatS RDM policy with dtool
owners:
  - name: Johannes Laurin Hoermann
    email: johannes.hoermann@imtek.uni-freiburg.de
    orcid: 0000-0001-5867-695X
funders:
  - organization: DFG
    program:  Clusters of Excellence
    code: EXC 2193
creation_date: '2021-11-29'
```

Always use your clear name, your email and your [ORCID](https://orcid.org/).
The more (descriptive) metadata are available, the easier it will be to search for a specific dataset.