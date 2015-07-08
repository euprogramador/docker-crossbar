# docker-crossbar
Run a [Crossbar router](http://crossbar.io) using Docker.

###### `euprogramador/crossbar`

## Usage
The default configuration is a simple websocket server running on port `8000` with a realm `realm1`

To try it out run `docker run -d -p 3000:8000 euprogramador/crossbar` and connect to it using a [client implementation](http://wamp.ws/implementations) of your choice.

### Custom Config
To run crossbar using your own config or additional files simply mount them to `/.crossbar/` as such

* `docker run -d -p 3000:8000 -v /path/to/config.json:/.crossbar/config.json euprogramador/crossbar`

* or the whole `.crossbar` directory `docker run -d -p 3000:8000 -v /path/to/.crossbar:/.crossbar euprogramador/crossbar`
