# PSDeploy-vSphereOVF-Recipes
Library of recipes for deploying OVF/OVA appliances with PSDeploy

# Requirements

- VMware PowerCLI
- [PSDeploy](https://github.com/RamblingCookieMonster/PSDeploy)

# Instructions

> Even if the recipes are quiet self explanatory, reading the [PSDeploy documentation](http://psdeploy.readthedocs.io/en/latest/Example-vSphereOVF-Deployment/) might be a good idea ! 

- If not already done, install all the needed requirements
- Browse the subfolders of this repository to find the recipe you are looking for
- Grab a copy of the recipe and store it on your computer

> Don't forget to name your file like this: `MyFile.psdeploy.ps1`

- Change the parameters as needed
- Open a powercli console
- Log in to a vCenter Server or ESX host with the command `Connect-VIServer`
- Load the PSDeploy module

```powershell
Import-Module PSDeploy
```

- Run the Invoke-PSDeploy to start the deployment of our OVF/OVA

```powershell
Invoke-PSDeploy -Path 'MyFile.psdeploy.ps1'
```

- Enjoy !

# Author

**Erwan Quélin**
- <https://github.com/equelin>
- <https://twitter.com/erwanquelin>

# Special Thanks

- Warren F. (author of PSDeploy) - [Blog](http://ramblingcookiemonster.github.io/) - [Twitter](https://twitter.com/pscookiemonster) - [GitHub](https://github.com/RamblingCookieMonster)


# License

Copyright 2016 Erwan Quelin.

Licensed under the Apache License, Version 2.0 (the “License”); you may not use this file except in compliance with the License. You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
