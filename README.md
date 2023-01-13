# Elastic with Rails

## Elastic Config

I'm installing with docker images, so you need to know docker at up and start level to understand commands. if you don't its OK, you can 
look through project first then for testing do your docker research.

use `ES_JAVA_HOME` to set your java version to use in elastic

elastic owner recommendation: 
    * To try out Elasticsearch on your own machine, we recommend using Docker and running both Elasticsearch and Kibana. For more information

Pull docker image:

    $ docker pull docker.elastic.co/elasticsearch/elasticsearch:8.6.0

Create network: 

    $ docker network create elastic

Run Elastic: 

    $ docker run --name es01 --net elastic -p 9200:9200 -it docker.elastic.co/elasticsearch/elasticsearch:8.6.0

Reset Password of Elastic User:

    $ docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-reset-password


Copy the http_ca.crt security certificate from your Docker container to your local machine:

    $ docker cp es01:/usr/share/elasticsearch/config/certs/http_ca.crt .

Test Authenticated Request:

    $ curl --cacert http_ca.crt -u elastic https://localhost:9200


## Advanced Config

If you are comfortable with Linux and Elastic please check [Elastic Official Doc](https://www.elastic.co/guide/en/elasticsearch/reference/current/settings.html)

Elasticsearch ships with good defaults and requires very little configuration. 
Most settings can be changed on a running cluster using the [Cluster update settings](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-update-settings.html) API.

3 config files of elastic

- elasticsearch.yml for configuring Elasticsearch
- jvm.options for configuring Elasticsearch JVM settings
- log4j2.properties for configuring Elasticsearch logging

Please put this config in your `elasticsearch.yml` file

```ruby
    path.data: /var/lib/elasticsearch
    path.logs: /var/log/elasticsearch
    discovery.seed_hosts: ["https://host1.com", "https://host2.com"]
```

### Elastic path confif

```
path:
  data: /var/data/elasticsearch #Your Indexed data in indices and data streams
  logs: /var/log/elasticsearch #information about elastic cluster and operations
```