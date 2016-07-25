# PSDeploy-vSphereOVF-Recipes
Library of recipes for deploying OVF/OVA appliances with PSDeploy

# Requirements

- VMware PowerCLI
- [PSDeploy](https://github.com/RamblingCookieMonster/PSDeploy)

# Instructions

1. If not already done, install all the needed requirements
2. Browse the subfolders of this repository to find the recipe you are looking for
3. Grab a copy of the recipe and store it on your computer

> Don't forget to name your file like this: `MyFile.psdeploy.ps1`

4. Change the parameters as needed
5. Open a powercli console
6. Log in to a vCenter Server or ESX host with the command `Connect-VIServer`
7. Load the PSDeploy module

```powershell
Import-Module PSDeploy
```

8. Run the Invoke-PSDeploy to start the deployment of our OVF/OVA

```powershell
Invoke-PSDeploy -Path 'MyFile.psdeploy.ps1'
```

9. Enjoy !

# Author

**Erwan Quélin**
- <https://github.com/equelin>
- <https://twitter.com/erwanquelin>

# Special Thanks

- Warren F. (author of PSDeploy)

# License

Copyright 2016 Erwan Quelin.

Licensed under the Apache License, Version 2.0 (the “License”); you may not use this file except in compliance with the License. You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
