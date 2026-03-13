# GCP-Cloud-Homelab: Secure Infrastructure Stack

A containerized homelab environment deployed on Google Cloud Platform, designed for secure remote access, network-wide ad-blocking, and private documentation.

## Live Demo
**Documentation & Gallery:** [http://christopher.isageek.net](http://christopher.isageek.net)

## Tech Stack
* **Infrastructure:** Google Cloud (GCP) Compute Engine
* **Containerization:** Docker & Docker Compose
* **Networking:** WireGuard VPN (Accessing internal services via Port 443)
* **Security:** Nginx Proxy Manager (SSL/TLS), Vaultwarden (Encrypted Passwords)
* **Monitoring:** Pi-hole (Network DNS), WGDashboard (Peer Tracking)

## Key Security Features
* **Zero-Public Exposure:** Services like Vaultwarden and Pi-hole are isolated and only accessible via the WireGuard tunnel.
* **Firewall Bypass:** Configured VPN endpoints on Port 443 to ensure connectivity through restrictive enterprise firewalls.
* **Resource Optimized:** Successfully managing 6+ services on a 1GB RAM instance utilizing Linux Swap and SQLite optimization.

## Project Structure
* `docker-compose.yml`: The backbone of the deployment.
* `configs/`: Directory structure for service persistence (sanitized for public view).

---
*Created by Christopher Maldonado*
