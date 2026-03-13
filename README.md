# GCP-Cloud-Homelab: Secure Infrastructure Stack
A containerized homelab stack running on the Google Cloud Platform. This project provides a secure remote access solution, ad-blocking solution, and a private documentation gallery.

## Live Demo
**Documentation & Gallery:** [http://christopher.isageek.net](https://christopher.isageek.net)

## Tech Stack
* **Infrastructure:** Google Cloud Platform - Compute Engine
* **Containerization:** Docker & Docker Compose
* **Networking:** WireGuard VPN - Accessing all internal resources via Port 443
* **Security:** Nginx Proxy Manager & Vaultwarden
* **Monitoring:** Pi-hole & WGDashboard

## Key Security Features
* **Zero Public Exposure:** Services such as Vaultwarden & Pi-hole are isolated & can only be accessed via the WireGuard VPN tunnel
* **Firewall Bypass:** Configured the VPN endpoints on Port 443 to allow connectivity through restrictive firewall environments
* **Resource Optimized:** Running 6+ services on a 1GB RAM instance using Linux Swap & SQLite optimization techniques

## Project Structure
* `docker-compose.yml`: The backbone of the entire project
* `configs/`: Directory structure to persist the configuration files (sanitized to be publicly visible)

---
*Created by Christopher Maldonado*
