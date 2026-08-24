# 🚀 Automated DevOps CI/CD Pipeline (GitHub ➔ Jenkins ➔ Docker ➔ Slack)

This project demonstrates a fully automated CI/CD DevOps pipeline for a Dockerized web application. 
Every time code is pushed to this repository, the system independently updates the production server and dispatches real-time status updates directly to Slack.

---

## 🏗️ System Architecture & Workflow

1. **Developer:** Commits a code change (e.g., inside the `Dockerfile`) and pushes it to **GitHub** (`git push`).
2. **GitHub Webhook:** Detects the push event and automatically sends an HTTP POST request through a secure **ngrok** tunnel to the local Jenkins server.
3. **Jenkins (CI/CD Server):** 
   - Wakes up automatically and pulls the latest source code (**Cloning**).
   - Sends an initial execution alert to **Slack** (Yellow colored warning).
   - Builds a new Docker image from the updated repository (**Docker Build**) and tags it uniquely using the current build number.
   - Stops and removes the legacy container, then spins up the newly built container on port `8081` (**Deployment**).
4. **Slack Notification (ChatOps):** Jenkins sends a final status report to the team's Slack channel – **Green** for success or **Red** for a broken pipeline.

---

## 🛠️ Tech Stack & Tools Used

* **GitHub:** Source Control management and automated event triggers (Webhooks).
* **Jenkins:** The automation server hosting the Pipeline (Infrastructure as Code via a declarative `Jenkinsfile`).
* **Docker:** Packaging the web application (Nginx Web Server) into a light, isolated container running on an Ubuntu host.
* **ngrok:** Creating a secure public tunnel allowing external GitHub servers to communicate with the local Jenkins setup behind the router.
* **Slack:** ChatOps monitoring platform providing real-time pipeline visibility.

---

## 📂 Project Structure

* `Dockerfile` - Contains build specifications for the Nginx server and home page injection.
* `Jenkinsfile` - The Pipeline code defining automation blueprints (Clone, Build, Deploy, and Post-actions).
* `README.md` - This file (Project documentation).

---

## ⚙️ How to Run and Test

1. Ensure both **Jenkins** and **Docker** processes are actively running on your Ubuntu server.
2. Fire up the ngrok tunnel forwarding to your local Jenkins port:
   ```bash
   ngrok http  https://flap-doozy-xxxx
   ```
3. Verify that your GitHub Repository Webhook is configured with the updated ngrok forwarding URL, appending the `/github-webhook/` suffix.
4. Modify a file locally, commit the changes, and deploy them to the world:
   ```bash
   git add .
   git commit -m "Testing full automation loop"
   git push origin main
   ```
5. Open your designated **Slack** channel and watch the automation magic unfold in real time!
