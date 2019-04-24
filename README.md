# gitlabrunner-healthcheck [![Build Status](https://drone.app.cloud.dotscience.net/api/badges/dotmesh-io/gitlabrunner-healthcheck/status.svg)](https://drone.app.cloud.dotscience.net/dotmesh-io/gitlabrunner-healthcheck)

Made this script which will ping alertmanager any time a runner spends too long not contacting gitlab-ci.

Needs 3 env variables:
- `GITLAB_URL` - the url to the instance being used excluding the api part, e.g `https://gitlab.dotmesh.com`
- `GITLAB_TOKEN` - access token with access to the API
- `ALERTMANAGER_URL` - url of the alertmanager instance to ping, excluding the api part

Optional:
- `ALERTMANAGER_USERNAME` basic auth username for alertmanager
- `ALERTMANAGER_PASSWORD` basic auth password for alertmanager
- `THRESHOLD_BEFORE_ALERT` - a golang standard duration string. How long between now and the contactedAt time is acceptable? Defaulted to `20m`.
- `PAUSE` - golang standard duration string. Time between checking the api on cycle. Defaulted to `10m`.