# mise-maven

An [Apache Maven](https://maven.apache.org) plugin for
[mise](https://github.com/jdx/mise), a universal tooling version manager.

## Getting started

After installing [mise](https://github.com/jdx/mise),
you can install this plugin by running the following command:

```bash
mise plugin install maven
```

You can then install a default version of maven like this:

```bash
mise use -g maven@3
```

The above command will instruct mise-maven to always use the latest version of
Maven 3 by default.

## Using specific Maven versions

You can install a specific version of Maven like this:

```bash
mise install maven@3.5.4
```

and switch versions like this:

```bash
mise use maven@3.5.4
```

This will create a new entry in the .mise.toml file at your repository's root.

## Support for other Maven version manager configuration files

If you work in a team that uses SDKMan or mvnvm to manage a project's supported
maven version, mise-maven also supports reading these files. If you already have
the version of maven installed, `mvn` should automatically be configured to use
the version specified in the legacy configuration file. If you see an error
regarding the version of maven not being installed, simply run:

```bash
mise install maven
```

## License

All contributions are licensed under the Apache License, Version 2.0
(the "License"); you may not use this file except in compliance with the
License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

