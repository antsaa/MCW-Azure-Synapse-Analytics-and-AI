![Microsoft Cloud Workshop](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/main/Media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
Azure Synapse Analytics and AI
</div>

<div class="MCWHeader2">
Before the hands-on lab setup guide
</div>

<div class="MCWHeader3">
October 2022
</div>


Information in this document, including URL and other Internet Web site references, is subject to change without notice. Unless otherwise noted, the example companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place or event is intended or should be inferred. Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

The names of manufacturers, products, or URLs are provided for informational purposes only and Microsoft makes no representations and warranties, either expressed, implied, or statutory, regarding these manufacturers or the use of the products with any Microsoft technologies. The inclusion of a manufacturer or product does not imply endorsement of Microsoft of the manufacturer or product. Links may be provided to third party sites. Such sites are not under the control of Microsoft and Microsoft is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Microsoft is not responsible for webcasting or any other form of transmission received from any linked site. Microsoft is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement of Microsoft of the site or the products contained therein.

© 2021 Microsoft Corporation. All rights reserved.

Microsoft and the trademarks listed at <https://www.microsoft.com/en-us/legal/intellectualproperty/Trademarks/Usage/General.aspx> are trademarks of the Microsoft group of companies. All other trademarks are property of their respective owners.

**Contents**

<!-- TOC -->

- [Azure Synapse Analytics and AI before the hands-on lab setup guide](#azure-synapse-analytics-and-ai-before-the-hands-on-lab-setup-guide)
  - [Requirements](#requirements)
  - [Before the hands-on lab](#before-the-hands-on-lab)
    - [Task 1: Clone Github repo in Azure Cloud Shell](#task-1-clone-github-repo-in-azure-cloud-shell)
    - [Task 2: Run environment setup PowerShell script](#task-2-run-environment-setup-powershell-script)

<!-- /TOC -->

# Azure Synapse Analytics and AI before the hands-on lab setup guide

## Requirements

1. An Azure Account with the ability to create an Azure Synapse Workspace.
2. [Ensure the Microsoft.Sql resource provider is registered in your Azure Subscription](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-providers-and-types).

## Before the hands-on lab

**Duration**: 40 minutes

### Task 1: Clone Github repo in Azure Cloud Shell

1. Log into the [Azure Portal](https://portal.azure.com).

2. In the Azure Portal, open the Azure Cloud Shell by selecting its icon from the right side of the top toolbar. Be sure to select **PowerShell** as the shell type.

    ![A portion of the Azure Portal taskbar is displayed with the Cloud Shell icon highlighted.](media/bhol_azurecloudshellmenu.png "Opening the Cloud Shell")

    > **Note**: If you are prompted to create a storage account for the Cloud Shell, agree to have it created.

3. In the Cloud Shell window, enter the following command to clone the repository files.

    ```PowerShell
    git clone https://github.com/dibakardharchoudhury/MCW-Azure-Synapse-Analytics-and-AI.git Synapse-MCW
    ```


4. Keep the Cloud Shell open.

### Task 2: Run environment setup PowerShell script

When executing the script below, it is important to let the scripts run to completion. Some tasks may take longer than others to run. When a script completes execution, you will be returned to a command prompt.

1. In the Cloud Shell, change the current directory to the **automation** folder of the cloned repository by executing the following:

    ```PowerShell
    cd './Synapse-MCW/Hands-on lab/environment-setup/automation'
    ```

2. Execute the **Setup-all.ps1** script to provision the resources and to set them up by executing the following command:

    ```PowerShell
    ./Setup-all.ps1
    ```

    You will be prompted to enter the name of your desired Azure Subscription. You can copy and paste the value from the list to select one. You will also be prompted for the following information for this script:

    | Prompt |
    |--------|
    | Enter the desired Azure Subscription for this lab [you will be able to copy and paste from a listing] |

    ![The Azure Cloud Shell window is displayed with a sample of the output from the preceding command.](media/bhol_sampleshelloutput.png "The Azure Cloud Shell output")

3. At the end of the script, you should see a message indicating **Environment validation has succeeded**.

    ![The PowerShell console output displays with a message indicating the Environment validation has succeeded.](media/environment_validation_success.png "Environment Validation")

You should follow all steps provided *before* performing the Hands-on lab.
