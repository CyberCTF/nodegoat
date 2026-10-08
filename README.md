# OWASP NodeGoat

[OWASP NodeGoat](https://github.com/OWASP/NodeGoat) by the OWASP NodeGoat contributors: a
deliberately insecure Node.js and MongoDB application that shows how the OWASP Top Ten applies
to Node.js, with a tutorial for each risk. This repository runs it with
[Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machines, and the
upstream source in [`build/web/app/`](build/web/app) builds with its own Dockerfile, with the
settings of its compose file baked in.

| Machine | Service |
| --- | --- |
| web | NodeGoat on port 4000 |
| mongo | MongoDB 4.4 on port 27017 |

## Run it

```bash
isoloom generate
isoloom run docker
```

Then open http://localhost:4000/ and log in as `user1` / `User1_123` (or `admin` / `Admin_123`).
The data is reset each time the web machine starts. The same spec runs as Docker on a local VM
(`docker-vm`), on a cloud VM (`cloud-docker`) or on Kubernetes. Lab guide: the tutorial at
http://localhost:4000/tutorial.

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

Apache-2.0, as NodeGoat ([LICENSE](LICENSE)). This application is deliberately vulnerable: keep it
isolated.
