# TGIBackend
Backend to store, visualize and explore sensor data collected by [MultisensorLoRaNodes](https://github.com/WullT/MultisensorLoRaNode) and [PaxCounter](https://github.com/WullT/ESP32LoRaMqttPaxCounter)

Consists of [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/), [Grafana](https://grafana.com/) and [InfluxDB](https://www.influxdata.com/products/influxdb/) running in [Docker](https://www.docker.com/) on on a Linux system

## Setup

- Clone the repository
    ```sh
    cd ~
    git clone https://github.com/WullT/TGIBackend.git
    ```

- Install Docker and Docker-Compose
    ```sh
    sh ~/TGIBackend/scripts/install_docker_and_dc.sh
    ```

- Make a copy of the example config files
    ```sh
    sh ~/TGIBackend/scripts/prepare_docker.sh
    ```

- Update credentials for InfluxDB and Grafana
    ```sh
    nano ~/TGIBackend/docker/.env
    ```
    Name|Description
    -|-
    INFLUXDB_ADMIN_USERNAME|Username for InfluxDB admin user
    INFLUXDB_ADMIN_PASSWORD|Password for InfluxDB admin user
    INFLUXDB_READ_USER|Username for InfluxDB user with read permissions on `INFLUXDB_DB`
    INFLUXDB_READ_USER_PASSWORD|Password for InfluxDB user with read permissions on `INFLUXDB_DB`
    INFLUXDB_WRITE_USERNAME|Username for InfluxDB user with write permissions on `INFLUXDB_DB`
    INFLUXDB_WRITE_USER_PASSWORD|Password for InfluxDB user with write permissions on `INFLUXDB_DB`
    INFLUXDB_DB|Name of the database to store data
    GF_USERNAME|Username for Grafana admin
    GF_PASSWORD|Password for Grafana admin


## Configuration

>todo...

