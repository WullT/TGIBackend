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
    GF_USERNAME|Username for Grafana admin user
    GF_PASSWORD|Password for Grafana admin user

- Update `telegraf.conf`
    ```sh
    nano ~/TGIBackend/docker/telegraf/telegraf.conf
    ```
    Change following fields:
    Section|Field|Set to
    -|-|-
    `[[outputs.influxdb]]`|database|Name of the InfluxDB database (`INFLUXDB_DB`)
    `[[outputs.influxdb]]`|username|`INFLUXDB_WRITE_USERNAME`
    `[[outputs.influxdb]]`|password|`INFLUXDB_WRITE_USER_PASSWORD`
    `[[inputs.mqtt_consumer]]`(first)|username|TTN MQTT Integration username
    `[[inputs.mqtt_consumer]]`(first)|password|TTN MQTT Integration password (API Key)
    `[[inputs.mqtt_consumer]]`(second)|username|Local MQTT ruser username (choose one)
    `[[inputs.mqtt_consumer]]`(second)|password|Local MQTT ruser password (choose one)

- Run the applications
    ```sh
    cd ~/TGIBackend/docker
    docker-compose up -d
    ```

- Update Mosquitto user credentials
  - Generate passwords for `admin` and `wuser` (you have already defined a password for `ruser` in step *Update `telegraf.conf`*) 
    ```sh
    docker-compose exec mosquitto mosquitto_passwd -b /mosquitto/config/password.txt admin ADMIN_PASSWORD
    docker-compose exec mosquitto mosquitto_passwd -b /mosquitto/config/password.txt ruser RUSER_PASSWORD
    docker-compose exec mosquitto mosquitto_passwd -b /mosquitto/config/password.txt wuser WUSER_PASSWORD
    ```
- Restart the applications
    ```sh
    cd ~/TGIBackend/docker
    docker-compose restart
    ```


## Configuration

>todo...

