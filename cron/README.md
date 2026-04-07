# 🕒 Linux Crontab Guide: Mastering Scheduled Tasks

Crontab (Cron Table) is the native Linux utility for scheduling commands or scripts to run automatically at specific background intervals.

It is widely used in production systems for automation such as backups, monitoring, log cleanup, and scheduled data processing.

---

## 🛠️ Core Commands

To manage your cron jobs, use the following commands:

| Command | Action |
| :--- | :--- |
| `crontab -e` | Edit your crontab file (add/modify jobs) |
| `crontab -l` | List all scheduled cron jobs |
| `crontab -r` | Remove all cron jobs |
| `sudo crontab -e` | Edit cron jobs for root user |

---

## 📋 The Cron Syntax

Every line in a crontab file follows this structure:

```
* * * * * /path/to/command
│ │ │ │ │
│ │ │ │ └── Day of Week (0 - 6) → Sunday = 0
│ │ │ └──── Month (1 - 12)
│ │ └────── Day of Month (1 - 31)
│ └──────── Hour (0 - 23)
└────────── Minute (0 - 59)
```

Each field controls when the command runs.

---

## 🔣 Special Operators

Cron expressions are powerful because of special operators.

### `*` → Wildcard (Every)
```
* * * * *
```
Runs every minute.

### `,` → List of Values
```
15,30,45 * * * *
```
Runs at minutes 15, 30, and 45.

### `-` → Range
```
9-17 * * * *
```
Runs between 9 AM and 5 PM.

### `/` → Step (Interval)
```
*/5 * * * *
```
Runs every 5 minutes.

---

## 🔍 Deep Dive: Step Operator (/)

Defines incremental execution.

### Example 1
```
*/5 * * * *
```
Runs at:
0,5,10,15,...55

### Example 2
```
0-30/10 * * * *
```
Runs at:
0,10,20,30

---

## 🚀 Examples

| Schedule | Description |
| :--- | :--- |
| `0 0 * * *` | Midnight daily |
| `*/10 9-17 * * *` | Every 10 min during business hours |
| `0 12 * * 1-5` | Weekdays at noon |
| `0 0 1,15 * *` | 1st and 15th |

---

## ⚠️ Important Considerations

### Environment
Use absolute paths:
```
/usr/bin/python3 script.py
```

### Output
```
* * * * * script.sh > log.txt 2>&1
```

### Permissions
```
chmod +x script.sh
```

### Logs
```
/var/log/syslog
/var/log/cron
```

---

## 🔗 Recommended Tools

[Crontab.guru](https://crontab.guru) — helps translate cron expressions into readable text.

---

## ✅ Summary

Crontab enables reliable automation in Linux systems.
