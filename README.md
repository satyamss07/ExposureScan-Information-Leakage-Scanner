# 🔍 Exposure Scan – Automated Information Leakage Scanner (Web UI)

Exposure Scan is an advanced, automated **Information Disclosure & Exposure Detection Tool** with a modern web-based GUI.  
It helps security researchers, penetration testers, and bug bounty hunters quickly identify sensitive data leaks across large lists of URLs with minimal effort.

## 🛡️ What is Information Leakage Vulnerability?

**Information Leakage** occurs when a web server unintentionally exposes internal details such as:

- Server versions (Apache, Nginx, IIS)
- Technology stack versions (PHP, ASP.NET, Express, etc.)
- Framework metadata (WordPress, Joomla, Laravel, Drupal…)
- Debug information, stack traces, internal paths
- Sensitive comments in HTML source
- Admin URLs revealed in robots.txt or sitemap.xml
- Internal subdomains (dev / staging / intranet)
- Misconfigured headers exposing software versions
- API keys, tokens, or environment file leaks

Attackers use this information to:

- Identify vulnerable versions  
- Map internal architecture  
- Plan targeted exploitation  
- Perform version-specific attacks (RCE, LFI, SQLi etc.)

Exposure Scan automates discovering these weaknesses at scale.


# 🚀 Why Exposure Scan?

Your tool performs **passive & active fingerprinting**, deep parsing, and automated reporting, allowing anyone to scan **hundreds or thousands of URLs** efficiently.

It combines:

🔸 Recon  
🔸 Vulnerability discovery  
🔸 Automated reporting  
🔸 Modern UI with progress tracking  

…into one seamless experience.

# ✨ Key Features

### 🧠 **1. Deep Information Leakage Scanning**
- Detects server version leaks  
- Framework/technology exposure  
- Metadata leaks (meta generator tag)  
- Sensitive HTML comments  
- robots.txt exposure  
- sitemap.xml exposure  
- Detects staging / dev / internal environments  

### ⚡ **2. Active Fingerprinting (Optional)**
Sends safe HEAD requests to:
- `/server-status`
- `/phpinfo.php`
- `/admin`
- `/wp-login.php`
- `/.env`
- `/.git/config`
- and more…

### 📊 **3. Rich Reporting**
- **HTML Report** (beautiful, readable, logo included)
- **XLSX Report**  
   - Severity colors:  
     - 🔴 High  
     - 🟡 Medium  
     - ⚪ Low  
   - Auto-sized columns  
   - Clean formatting  
- **ZIP Export** containing HTML + XLSX

### 🌙 **4. Modern Web UI**
- Light / Dark mode (auto-saved via localStorage)  
- Drag & drop file upload  
- File preview (first 10 lines)  
- Live progress bar  
- Job queueing  
- Stop/Cancel scan  
- Vulnerable-only summary  

### 🔁 **5. Background Job Engine**
Each scan runs in a worker thread without blocking the interface.

# 📸 Screenshots

Create a folder `/assets/` and add your screenshots.  
You can embed them like this:

# 📦 Installation

### 1. Clone repository
```bash
git clone https://github.com/satyamss07/ExposureScan-Information-Leakage-Scanner.git
cd ExposureScan-Information-Leakage-Scanner
```
2. Install dependencies
```bash
pip install -r requirements.txt
```
3. Run the application
```bash
python exposure_scan_webapp.py
```
4. Open Web UI
```bash
http://127.0.0.1:5000
```

🧑‍💻 How to Use Exposure Scan

1. Add Targets
You can:
Upload .txt file (one URL per line)
OR paste URLs directly into the textarea
``` bash
https://example.com
https://sub.domain.com
http://target.test
```
2. Choose scan options

Deep Scan → ON by default
Active Fingerprinting → optional
Skip SSL verify → optional

3. Start Scan
Click Start Scan
You will see:
Progress bar
Live counter (scanned / total)
Job status

4. View Results
After the scan completes you can download:
HTML Report
XLSX Report
ZIP (HTML + XLSX)

5. Vulnerable-only Summary
Click "Vulnerable-only preview" to see affected targets instantly.

📄 Output Format

🟥 High Severity:
Server versions,
PHP/ASP.NET versions,
Internal environment leaks,
Sensitive comments,
robots.txt with admin/backup/env paths.

🟡 Medium Severity:
Tech/framework version leaks,
Exposed endpoints from active scan.

⚪ Low Severity:
Non-dangerous metadata,
Example Finding Entry:
```bash
{
  "header": "Server",
  "value": "Apache/2.4.49",
  "severity": "High",
  "evidence": "2.4.49",
  "product": "Apache",
  "version": "2.4.49",
  "cve_search_hint": "Apache 2.4.49 vulnerabilities"
}
```
⚖️ Legal & Ethical Use

This tool is made for:
Pentesters,
Security researchers,
Bug bounty hunters,
System administrators.

Only scan targets you own or are authorized to test. Unauthorized scanning is illegal.

🤝 Contributing
Pull requests are welcome.
Recommended contributions:
New detection rules,
New endpoints for fingerprinting,
Better UI,
Docker support,
Database-backed job storage.

⭐ Support the Project
If you find this tool useful:
⭐ Star the repo
Share with other researchers
Submit improvements

