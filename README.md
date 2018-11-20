# git-mirror

A Docker image that updates a git repository mirror every 15 minutes.


# Usage

Run:

    $ docker run \
    -d \
    -e MIRROR='...' \
    -e ORIGIN='...' \
    -e PRIVATE_KEY='...' \
    --name git-mirror \
    --restart always \
    interaction/git-mirror

A `docker-compose.yml` file is also provided for convenience.
