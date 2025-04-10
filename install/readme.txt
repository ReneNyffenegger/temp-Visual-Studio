
https://learn.microsoft.com/en-us/visualstudio/install/install-visual-studio?view=vs-2022




   Step 2 - Download Visual Studio
      says to download BOOTSTRAPPER files from 

         https://visualstudio.microsoft.com/downloads/
      
      yet... this BOOTSTRAPPER files (vs_community.exe etc)
      seems to be found by then clicking on

         How to install offline

      which takes me to

         https://learn.microsoft.com/en-us/visualstudio/install/create-an-offline-installation-of-visual-studio?view=vs-2022







  - https://silentinstallhq.com/visual-studio-community-2022-silent-install-how-to-guide/
    - Navigate to: https://aka.ms/vs/17/release/vs_Community.exe
    - Download the vs_Community.exe to a folder created at (C:\Downloads)
    - Open an Elevated Command Prompt by Right-Clicking on Command Prompt and select Run as Administrator
    - Navigate to the C:\Downloads folder
    - Enter the following command to extract the setup files:
    - vs_Community.exe --layout .\vs_Community
    - Press Enter
    - Navigate to the C:\Downloads\vs_Community folder
    - Enter the following command:
    - vs_setup.exe --nocache --wait --noUpdateInstaller --noWeb --allWorkloads --includeRecommended --includeOptional --quiet --norestart
    - Press Enter
