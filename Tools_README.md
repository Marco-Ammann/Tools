
# Tools Overview 🚀

This repository provides a collection of tools to simplify and automate various tasks in your development workflow. Each tool is documented with clear usage instructions, examples, and explanations of available commands.

---

## Tools 📂

### 1. **Backup Tool**
- **Path**: `BackupTool/dist/backup_tool.exe`
- **Description**: Creates structured backups of your projects, excluding unnecessary directories like `node_modules` and `.git`. Each backup includes logs for tracking.
- **How to use**:
  1. Double-click the executable (`dist/backup_tool.exe`).
  2. In the GUI, choose a source folder for the backup.
  3. Optionally specify a backup folder (default: `backup/`).
  4. Click "Start Backup".
- **Example Result**:
  - Backups are stored in a folder structure like this:
    ```
    backup/
    ├── 2024-12-07/
    │   ├── 03-40-36/
    │   │   ├── logs/
    │   │   │   └── backup-03-40-36.log
    │   │   └── [Your Project Files]
    ```

### 2. **Delete Node Modules**
- **Path**: `delete_node_modules.ps1`
- **Description**: Recursively searches for and deletes all `node_modules` folders within a specified directory to save disk space.
- **How to use**:
  1. Open PowerShell.
  2. Run:
     ```powershell
     .\delete_node_modules.ps1
     ```
  3. Enter the root folder where you want to search for `node_modules`.
- **Example Output**:
  ```
  Searching for node_modules in D:/Projects...
  Found: D:/Projects/Project1/node_modules
  Found: D:/Projects/Project2/node_modules
  Deleting...
  node_modules deleted successfully!
  ```

### 3. **GitHub Push Script**
- **Path**: `github_push.ps1`
- **Description**: Automates the process of adding, committing, and pushing changes to a GitHub repository.
- **How to use**:
  1. Open PowerShell in a Git repository.
  2. Run the script:
     ```powershell
     .\github_push.ps1
     ```
  3. Enter a commit message when prompted (or press Enter to use the default: "Automated Commit").
- **Example Output**:
  ```
  Adding all changes...
  Commit message: Updated README
  Pushing changes to GitHub...
  Push completed successfully!
  ```

### 4. **Python Requirements Checker**
- **Path**: `python_requirements_checker.ps1`
- **Description**: Validates the Python packages listed in `requirements.txt` and identifies missing installations.
- **How to use**:
  1. Create a `requirements.txt` file in your project directory with the required packages.
     - Example `requirements.txt`:
       ```
       flask
       requests
       numpy
       ```
     - To generate it automatically from an existing project:
       ```bash
       pip freeze > requirements.txt
       ```
  2. Run:
     ```powershell
     .\python_requirements_checker.ps1
     ```
- **Example Output**:
  ```
  Checking Python requirements...
  Missing packages:
  - flask
  - requests
  Installing missing packages...
  Requirements checked successfully!
  ```

### 5. **Project Setup Script**
- **Path**: `setup-project.ps1`
- **Description**: Sets up new projects with predefined structures and optionally initializes frameworks like Angular, Python, or Node.js.
- **How to use**:
  1. Run the script:
     ```powershell
     .\setup-project.ps1
     ```
  2. Follow the prompts:
     - Enter the project name.
     - Choose the framework or type (e.g., Angular, Python).
  3. The script creates the project folder, initializes Git, and optionally connects to GitHub.

- **Available Commands**:
  - Run the `new` command with the desired type and name:
    ```powershell
    new -type angular -name MyAngularApp
    ```
  - Supported types:
    - `angular`: Creates an Angular project.
    - `python`: Initializes a Python project with a virtual environment.
    - `node`: Sets up a Node.js project with `npm init`.
    - `vue`: Bootstraps a Vue.js project using `npx create-vue`.
    - `react`: Generates a React app with `npx create-react-app`.

- **Example Usage**:
  ```powershell
  new -type python -name MyPythonProject
  ```
  Output:
  ```
  Creating project MyPythonProject...
  Python virtual environment created successfully.
  Project successfully set up at D:/DevDrive/Projects/MyPythonProject
  ```

---

## Setting up Shortcuts (Terminal Commands) ⚙️

You can set up shortcuts (like `backup`, `push`, etc.) in PowerShell using your PowerShell profile. This simplifies usage by allowing single-word commands.

### Steps:
1. **Locate your PowerShell profile**:
   ```powershell
   $PROFILE
   ```

2. **Create or edit the profile**:
   ```powershell
   New-Item -ItemType File -Path $PROFILE -Force
   notepad $PROFILE
   ```

3. **Add shortcuts**:
   Paste this code into the profile:
   ```powershell
   function backup { & "D:\DevDrive\Tools\BackupTool\distackup_tool.exe" }
   function delete-node-modules { & "D:\DevDrive\Tools\delete_node_modules.ps1" }
   function push { & "D:\DevDrive\Tools\github_push.ps1" }
   function check-requirements { & "D:\DevDrive\Tools\python_requirements_checker.ps1" }
   function new-project { & "D:\DevDrive\Tools\setup-project.ps1" }
   ```

4. **Reload and use**:
   ```powershell
   . $PROFILE
   ```

---

## Folder Structure 📂

```
Tools/
├── BackupTool/
│   ├── dist/
│   │   └── backup_tool.exe
│   ├── backup/
│   │   ├── <date>/
│   │   │   ├── <time>/
│   │   │   │   └── logs/
│   │   │   └── ...
│   └── backup_config.json
├── delete_node_modules.ps1
├── github_push.ps1
├── python_requirements_checker.ps1
├── setup-project.ps1
└── README.md
```

---

## Notes and Recommendations ⚠️

- Test scripts in a safe environment before using them in production.
- Ensure sufficient permissions in the working directories.
- Update paths as needed to suit your setup.

---

Happy Coding! 😊
