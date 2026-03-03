# AWS Resource Reporting Script (Linux Cron Project)

## Overview

This project demonstrates a simple Linux automation workflow using:

-   Bash scripting
-   AWS CLI
-   jq
-   cron scheduling

The script reports AWS resource information on a scheduled interval and
writes output to a log file.

The scope of this project was intentionally limited to Linux
fundamentals and cron behavior rather than cloud-native architecture.

------------------------------------------------------------------------

## What the Script Does

On execution, the script:

-   Lists S3 buckets
-   Lists EC2 instance IDs
-   Lists Lambda functions
-   Lists IAM users
-   Logs execution timestamp
-   Appends output to a log file

------------------------------------------------------------------------

## Cron Configuration

Example cron entry used during testing:

    * * * * * /absolute/path/to/aws_resources.sh >> /absolute/path/to/aws_resources.log 2>&1

Key behavior learned:

-   Cron runs in a minimal environment
-   It does not inherit interactive shell variables
-   Absolute paths are required for reliability
-   Output redirection is critical for debugging

------------------------------------------------------------------------

## Technical Challenges Encountered

### 1. `aws: command not found`

When executed manually, the script worked.\
When executed via cron, it failed.

Root cause: Cron does not load user shell profiles (e.g., `.zshrc`,
`.bash_profile`).

Resolution: Used absolute binary paths:

-   `/opt/homebrew/bin/aws`
-   `/usr/bin/jq`

------------------------------------------------------------------------

### 2. Environment Variable Handling

The AWS profile had to be explicitly defined:

    export AWS_PROFILE=default

Without this, scheduled execution could fail depending on environment
configuration.

------------------------------------------------------------------------

### 3. Debugging Cron Execution

To verify execution, the following techniques were used:

-   Timestamp logging with `$(date)`
-   Dedicated proof log file
-   Manual execution comparison
-   Short interval scheduling (`* * * * *`) during testing

------------------------------------------------------------------------

## Tradeoffs

This project intentionally:

-   Uses cron instead of EventBridge or Lambda
-   Runs locally instead of on EC2
-   Writes to flat log files instead of structured logging systems
-   Does not implement alerting or change detection

Reason: The goal was to practice Linux scheduling behavior and shell
execution differences, not build a distributed monitoring system.

------------------------------------------------------------------------

## Limitations

-   No log rotation
-   No structured JSON output formatting
-   No error handling (`set -euo pipefail` not implemented)
-   No IAM role-based execution model
-   No infrastructure as code integration

These limitations were accepted to keep the scope focused and
controlled.

------------------------------------------------------------------------

## Lessons Learned

-   "Works in my terminal" does not mean "works in cron"
-   Absolute paths eliminate environment-related failures
-   Cron debugging requires logging discipline
-   Short scheduling intervals accelerate validation cycles

------------------------------------------------------------------------

## Future Improvements (Optional)

-   Add log rotation
-   Implement error handling safeguards
-   Convert to EC2-based execution
-   Replace cron with EventBridge + Lambda
-   Store results in S3 for historical tracking



