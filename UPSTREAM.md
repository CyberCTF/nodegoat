# Upstream

| | |
| --- | --- |
| Project | OWASP NodeGoat |
| Repository | https://github.com/OWASP/NodeGoat |
| Version | master (2023-06-21) |
| Commit | c5cb68a7084e4ae7dcc60e6a98768720a81841e8 |
| Licence | Apache-2.0 |

`build/web/app/` is that commit, unchanged, without its Git history. It is the default branch,
not the latest release (v1.4): v1.4 is 118 commits behind, builds on Node 4, and its configuration
points at a hosted MongoDB (mLab) that no longer exists, so its Docker setup cannot run.
`build/web/Dockerfile` is upstream's Dockerfile with the settings of upstream's
`docker-compose.yml` baked in (`MONGODB_URI` and the start command). The `mongo` machine is the
stock `mongo:4.4` image of that compose file. Dependencies are pinned by upstream's
`package-lock.json`. To update, replace `build/web/app/` with a newer commit, then change this
table.
