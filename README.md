# pipecheck

Pipeline execution status analyzer for Unix shell commands.

## Overview

`pipecheck` inspects the execution status of each command in a Unix pipeline. It captures exit codes, displays commands, and provides a clear visual representation of where errors or issues occur in complex pipelines.

## Installation

### Homebrew

```bash
brew tap hmirin/tools
brew install pipecheck
```

### GitHub

```bash
# Clone the repository
git clone https://github.com/hmirin/pipecheck.git

# Make the script executable
cd pipecheck
chmod +x pipecheck

# Optional: Move to a directory in your PATH for system-wide access
sudo cp pipecheck /usr/local/bin/
```

## Usage

```bash
# Execute the pipeline and analyze it in one command
pipecheck "cat file.txt | grep pattern | sort | uniq"
```

## Example Output

Try [example.sh](example.sh).

### Successful pipeline:

```
Pipeline Execution Status:
┌─────────┬──────────────┬───────────────────────────────────────────────────────────────
│ Step    │ Status       │ Command
├─────────┼──────────────┼───────────────────────────────────────────────────────────────
│ 1       │ ✓ 0          │ cat sample.csv
│ 2       │ ✓ 0          │ grep 'active'
│ 3       │ ✓ 0          │ sort
│ 4       │ ✓ 0          │ wc -l
└─────────┴──────────────┴───────────────────────────────────────────────────────────────
Pipeline succeeded in all steps.
```

### Failed pipeline:

```
Pipeline Execution Status:
┌─────────┬──────────────┬───────────────────────────────────────────────────────────────
│ Step    │ Status       │ Command
├─────────┼──────────────┼───────────────────────────────────────────────────────────────
│ 1       │ ✓ 0          │ cat sample.csv
│ 2       │ ✗ 1          │ grep 'INVALID_STATUS'
│ 3       │ ✓ 0          │ sort
│ 4       │ ✓ 0          │ wc -l
└─────────┴──────────────┴───────────────────────────────────────────────────────────────
Pipeline failed in some steps.
```

## Use Cases

- **Debugging complex pipelines** - Identify which command in a long pipeline is failing
- **Shell script development** - Verify the behavior of pipeline components
- **Understanding tool exit codes** - See how different commands behave even when they appear to succeed

## How It Works

`pipecheck` leverages the shell's `PIPESTATUS` array, which captures the exit status of each command in a pipeline. It either analyzes the most recently executed pipeline from your shell history or runs a pipeline you specify.

The tool supports all standard Unix/Linux shells including Bash, Zsh, and others that provide pipeline status tracking mechanisms.

## Limitations

- May not capture pipelines with complex control structures
- Requires Bash / Zsh

## LICENSE

MIT License
