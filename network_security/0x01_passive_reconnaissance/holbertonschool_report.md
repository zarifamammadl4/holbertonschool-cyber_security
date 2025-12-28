# Passive Reconnaissance Report  
## Target: holbertonschool.com

---

## 1. Objective

The objective of this report is to gather publicly available information about the domain **holbertonschool.com** using **Shodan** as a passive reconnaissance tool.  
No direct interaction with the target infrastructure was performed.

---

## 2. Methodology

The following Shodan techniques were used:

- Domain search: `hostname:holbertonschool.com`
- IP enumeration via resolved subdomains
- Service and technology fingerprinting
- Framework and platform identification

All data collected is publicly accessible and does not involve active scanning.

---

## 3. Identified IP Ranges

Based on Shodan results and DNS resolution, the following IP ranges are associated with **holbertonschool.com**:

- **63.35.0.0/16** (Amazon AWS – CloudFront)
- **99.83.0.0/16** (Amazon AWS – Global Accelerator)
- **75.2.0.0/16** (Amazon AWS)
- **52.85.0.0/16** (Amazon CloudFront)
- **34.0.0.0/8** (Amazon EC2)
- **13.36.0.0/14** (Amazon AWS – EU region)

These IP ranges indicate extensive use of cloud-based infrastructure.

---

## 4. Technologies and Frameworks Identified

The following technologies were detected across various subdomains:

### Web Servers
- **Nginx**
- **Apache**
- **CloudFront (AWS CDN)**

### Frameworks & Platforms
- **Ruby on Rails**
- **Node.js**
- **React**
- **Next.js**

### Content Management & Services
- **Webflow**
- **Zendesk**
- **Discourse**
- **Ghost CMS**

### Security & Networking
- **Cloudflare**
- **AWS Shield**
- **HTTPS with TLS 1.2 / TLS 1.3**
- **HSTS enabled**

---

## 5. Notable Subdomains Observed

Examples of discovered subdomains include:

- `www.holbertonschool.com`
- `apply.holbertonschool.com`
- `blog.holbertonschool.com`
- `support.holbertonschool.com`
- `assets.holbertonschool.com`
- `v1.holbertonschool.com`
- `v2.holbertonschool.com`
- `v3.holbertonschool.com`

Each subdomain exposes different services and technologies.

---

## 6. Security Observations

- Heavy reliance on **AWS infrastructure**
- CDN usage reduces direct exposure of origin servers
- Most services are protected behind reverse proxies
- No critical services were directly exposed publicly

---

## 7. Conclusion

Passive reconnaissance using Shodan reveals that **holbertonschool.com** relies on a modern cloud-based architecture with multiple security layers.  
The use of CDNs, HTTPS, and managed cloud services significantly reduces the attack surface.

This information could be leveraged during further reconnaissance phases, such as attack surface mapping or threat modeling.

---

## 8. Disclaimer

This report was generated for **educational purposes only**.  
All information was collected passively using publicly available data.
