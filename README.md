# myanon sample

Simple myanon MySQL anonimization tool example.

The demo consists of running a MySQL server, initialized with a single database and table with some data (see `init.sql`) and generating an anonimized dump based on the configuration `anon.conf`.

- build the custom image with `./build.sh`
- run demo with `./run.sh`
- see results in `./