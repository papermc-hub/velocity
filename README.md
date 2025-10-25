# Velocity

Velocity is the modern, high-performance proxy. Designed with performance and stability in mind, it’s a full alternative to Waterfall with its own plugin ecosystem.

---

🔗 You can find **Velocity** versions and builds [here](https://papermc.io/downloads/velocity).

## 🧱 Build information
[All images](https://github.com/papermc-hub/velocity/pkgs/container/velocity) in this repository are built using:
`Eclipse Temurin JRE 25 Alpine 3.22` as runtime,
and are available for following platforms:
- linux/amd64
- linux/arm64

## 🚀 Quick start

### 1. Run container:

```bash
docker run -dit \
  --name <container-name> \
  -p 25565:25565 \
  ghcr.io/papermc-hub/velocity:3.4.0-SNAPSHOT-555
```

### 2. Attach to the console

You can attach to the running **Velocity** console with:
```bash
docker attach <container-name>
```
(and safely detach with: `CTRL + P, CTRL Q`)

### 3. See console logs

You can see the **Velocity** console logs with:
```bash
docker logs -f <container-name>
```
(detach with: `CTRL + C`)

### 4. Mount external folders
You can mount external folders or files into the container using the `-v` flag. The default working directory inside the container is `/app`.

For example, to mount your local `plugins` folder into the container:
```bash
docker run -dit \
  --name <container-name> \
  -p 25565:25565 \
  -v <path-to-your-plugins>:/app/plugins \
  ghcr.io/papermc-hub/velocity:3.4.0-SNAPSHOT-555
```

💡 **Recommendation:**
For data persistence and easier configuration management, it's recommend to mount external folders such as:
- `/app/logs` - for logs.
- `/app/plugins` - for plugins.
- `/app/velocity.toml` - for the velocity configuration.

## ⚙️ Environment variables
| Environment variables | Default                                      | Description                                                                   |
|-----------------------|----------------------------------------------|-------------------------------------------------------------------------------|
| `INTERNAL_PORT`       | 25565                                        | The internal TCP port **Velocity** listens on - also used by the healthcheck. |
| `JAVA_TOOL_OPTIONS`   | `"-Xms512m -Xmx1024m -Dfile.encoding=UTF-8"` | JVM runtime options.                                                          |

💡 **Recommendation:**
It's recommend to fine-tune `JAVA_TOOL_OPTIONS` based on your hardware and workload.