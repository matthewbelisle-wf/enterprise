# Codecov Enterprise

Codecov Enterprise is for customers whom wish to utilize Codecov in a **private environment** which may be hosted on the cloud or on an internal networked computer.

-----

> * Please read [our license agreement](https://github.com/codecov/enterprise/blob/master/license.md) carefully before installing or using the software.
> * Codecov Enterprise is for Codecov Enterprise License holders **only**.
> * A valid license key is required for enterprise support.
> * Contact sales and support at enterprise@codecov.io

-----

# TOC
- Instruction
- Upgrading
- Environment
- Questions and Support



# Instructions
> Below are options to run Codecov Enterprise

- [Deploy on Heroku](#deploy-on-heroku)
- Deploy with Docker `coming soon`
- [Deploy Manually on Linux](#deploy-manually-on-linux)

## Deploy on Heroku
> Codecov deploys to Heroku easily and can run on the free tier.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)
> After deployed please configure your environment

```
heroku config:set ENTERPRISE_COMPANY=:provided-by-codecov \
                  ENTERPRISE_LICENSE=:provided-by-codecov \
                  GITHUB_CLIENT_ID=:app-client-id \
                  GITHUB_CLIENT_SECRET=:app-client-secret \
                  GITHUB_ACCESS_TOKEN=:your-bot-access-token
```

## Deploy Manually on Linux
Some Linux admin experience is required for manual deployment.

### Prerequisites
* PostgreSQL database with the "uuid-ossp" and "hstore" extensions.
* Redis

### Install codecov
Installation is just a matter of cloning this repository:

```sh
git clone https://github.com/codecov/enterprise.git
cd enterprise
```

Use the codecov.yml file there as a template for your own. Note that, by default, the configuration file is `~/.codecov/codecov.yml`, so its location will depend on the user running codecov. If you create a special user to run codecov, then the configuration will live in its home directory. Alternatively, you can specify the configuration file explicitly with the `--config` command line option.

You can then start codecov manually:

```sh
# verify configuration
./codecov config
# run web on localhost:5000 and a worker
./codecov web --port 5000 & ./codecov worker
```

Rather than running codecov manually, we recommend using [supervisord](https://supervisord.org) to manage the processes. You can install supervisord from pip, but most Linux distributions also provide a package. The distribution package may be a slightly older version, but will automatically create startup scripts so you can have codecov start at boot. Sample confiugration files can be [found here](https://github.com/codecov/enterprise/tree/master/nginx).  **Note:** If you run supervisord as root, be sure to add the appropriate `user = username` lines to the program configuration blocks.

### Set up a proxy server

You will also want to run a reverse proxy in front of codecov. We recommend [nginx](http://nginx.org/) for this purpose. It can also be run under supervisord, or you may opt to run it as a normal system service (which will probably happen automatically if you install a distribution package.) Sample configuration is [provided](https://github.com/codecov/enterprise/tree/master/nginx).

# Upgrading
We recommend watching this repository as we will post updates to the system here. Stable version will be tagged with appropriate version numbers.

- [Tagged releases](https://github.com/codecov/enterprise/releases) should be considered stable.
- The `master` branch is the latest releases, supported in production. 
- The `develop` branch is used to test the product.
- Database updates will be performed automatically.

# Github App
> Create your Github application here: https://github.com/settings/applications/new

Please fill in the appropraite information when creating a Github app. For **Authorization callback URL** please enter your url endpoint plus `/login/github`. Ex. `https://my-codecov-enterprise.herokuapp.com/login/github`

# Environment
> **Heroku users only** set environment variables in Heroku through the cli via `heroku config:set ENTERPRISE_COMPANY=usa`. The `codecov.yml` is ignored.

Details on environment variables are all found in the [`codecov.yml` file](https://github.com/codecov/enterprise/blob/master/codecov.yml).

# Questions and Support

- Commonly asked questions can be found in our [Wiki](https://github.com/codecov/enterprise/wiki)
- You may email us at enterprise@codecov.io with any issues, questions or sales.

# Issues
You may contact support directly at enterprise@codecov.io **or** create issues in [Github issues here](https://github.com/codecov/enterprise/issues)

# Copyright
Copyright 2015 Codecov (a Codecov LLC company). All rights reserved.
