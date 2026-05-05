# Silk Testing Environment - Docker Compose

This repository provides a complete Docker Compose setup for running and testing SilkBuilder Core and SilkClient Core with Tomcat 10.1 and MySQL 8.4 database.

This setup allows you to develop applications with SilkBuilder Code and test them by deploying to SilkClient Core, all running locally on your machine via Docker.

## Features

- MySQL 8.4.7 with two pre-configured databases (`builderdb`,  `clientdb,` and `appdb`)
- Automatic creation of the user `builderuser` with full privileges
- Automatic execution of official SilkBuilder and SilkClient SQL scripts
- Tomcat 10.1 (JRE 17) with both SilkBuilder and SilkClient automatically deployed from GitHub
- Persistent storage for database and web applications

## Requirements

- **Docker** (v20.10 or newer)
- **Docker Compose** (v2.0 or newer)
- Minimum **4 GB** of available RAM
- Internet connection (required for pulling images and cloning repositories)

## Quick Start

### 1. Download the Project

```bash
git clone https://github.com/silkbuilder/SilkBuilder-Testing.git
cd SilkBuilder-Testing

Or download the ZIP from this repository and extract it.
```

### 2. Start the Environment

```bash
docker compose up -d
```

> **Note:** The first startup can take **2–5 minutes** while MySQL initializes the databases and Tomcat clones the GitHub repositories.

### Access Points

- **Home** → [http://127.0.0.1:808/](http://127.0.0.1:8080/)
- **SilkBuilder** → [http://127.0.0.1:8080/SilkBuilder](http://127.0.0.1:8080/SilkBuilder)
- **SilkClient** → [http://127.0.0.1:8080/SilkClient](http://127.0.0.1:8080/SilkClient)
- **MySQL** → Host: `127.0.0.1`, Port: `3306`

### MySQL Credentials

Use this credential to access the database using a MySQL client like [Sequel Ace](https://sequel-ace.com).

- **MySQL Root**: `rootpassword123` (change in production)
- **Application User**: `builderuser`
- **Password**: `testing543`

> **Note:** Credentials can be changed in the docker-compose.yml file if necessary. 

## SilkBuilder Credential

The SilkBuilder default password is `admin`. You can change it using the option "Set Password" after signing in.

### SilkClient Synchronization

This is the token used by the SilkBuilder to synchronize the applications to the SilkClient.

* Default sync token: 5041a26e-572b-481d-929e-79254ca9e043

> **Note:** The sync token can be changed in the docker-compose.yml file if necessary. 

## Useful Commands

```bash
# View logs
docker compose logs -f tomcatSB
docker compose logs -f mysqlSB

# Stop services
docker compose down

# Stop and delete all data (reset)
docker compose down -v

# Restart Tomcat only
docker compose restart tomcatSB
```

## Project Structure

```
silk-testing/
├── docker-compose.yml
├── README.MD
├── tutor.md             # Tutorial to create first app
├── mysql-init/
│   ├── 00-pre-init.sh
│   └── 01-init.sql
├── MySql/               # MySQL data persistence auto-filled.
├── Tomcat/              # Tomcat data persitence auto-filled.
│   └── ROOT             # Default Application
│       └── index.html   # Welcoming page
└── tomcat-logs/         # Tomcat logs
```

## Configuration

You can modify ports, passwords, or environment variables directly in `docker-compose.yml`.

| Service | Public Port    | Internal Port | Description      |
| ------- | -------------- | ------------- | ---------------- |
| MySQL   | 127.0.0.1:3306 | 3306          | Database         |
| Tomcat  | 127.0.0.1:8080 | 8080          | Web applications |

## Troubleshooting

- Containers not starting → Check logs with `docker compose logs`
- Port already in use → Change the host port in `docker-compose.yml`
- Applications show blank/404 → Wait a bit longer on first run and refresh

## First Application

To develop your initial application, refer to the instructions in the [Building the First Application](https://github.com/silkbuilder/SilkBuilder-Testing/blob/main/tutor.md) tutorial.

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

**MIT License**

Copyright (c) 2026 Italo Osorio

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---

