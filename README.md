# Elastic with Rails

## Some words with readers

``** There is nothing Impossible, Just give yourself time to understand every ecosystem’s nature **``

if you heard about Kibana, Logstash, (ELK) or Beats. I recommend not to try config ELK and run it, too keep your mind focused, First
learn to use Heart of ELK which is Elastic and then do your research,.

## Application

There is two controller to accept requests, DataController and SearchController.

Concrete functionality can be found on services directory.

## What is elastic

elastic is a search engine to search monitor and visualize your data and create insight of data for time series data.
Real power of elastic comes from Java library called Lucene core.

Need to mention lucene is not complete application, Do not confuse yourself with this, just remember the name and you can refer it after
getting better in Elastic, Elastic is standing on the shoulder of giants.

Recommendation: Do not confuse yourself with Kibana or Lucene engine, First Understand ElasticSearch Itself logic and concepts and
how it works using Rest API

Lucene Core is a Java library providing powerful indexing and search features, as well as spellchecking, 
hit highlighting and advanced analysis/tokenization capabilities.

Apache Lucene™ is a high-performance, full-featured search engine library written entirely in Java. It is a technology
suitable for nearly any application that requires structured search, full-text search, faceting, nearest-neighbor 
search across high-dimensionality vectors, spell correction or query suggestions.


Best feature of elastic in my opinion: Ability to manage your engine and work only with one Interface which is REST API, this simplification
makes elastic agile and easy to use. even though for using more effectively you need to get deeper in tuning it, for curious developers 
I recommend read about its underlying data structure and algorithms for handling all types of data such string, numeric, get_point and etc.

### Scalable, High-Performance Indexing

- over 800GB/hour on modern hardware
- small RAM requirements -- only 1MB heap
- incremental indexing as fast as batch indexing
- index size roughly 20-30% the size of text indexed


### Powerful, Accurate and Efficient Search Algorithms

- ranked searching -- best results returned first
- many powerful query types: phrase queries, wildcard queries, proximity queries, range queries and more
- fielded searching (e.g. title, author, contents)
- nearest-neighbor search for high-dimensionality vectors
- sorting by any field
- multiple-index searching with merged results
- allows simultaneous update and searching
- flexible faceting, highlighting, joins and result grouping
- fast, memory-efficient and typo-tolerant suggesters
- pluggable ranking models, including the Vector Space Model and Okapi BM25
- configurable storage engine (codecs)

### Cross-Platform Solution

- Available as Open Source software under the Apache License which lets you use Lucene in both commercial and Open Source programs
100%-pure Java
- Implementations in other programming languages available that are index-compatible

## Query DSL

Elasticsearch provides a full Query DSL (Domain Specific Language) based on JSON to define queries.
Think of the Query DSL as an AST (Abstract Syntax Tree) of queries, consisting of two types of clauses

## Searching your data

The Elasticsearch REST APIs support structured queries, full text queries, and complex queries that combine the two.
Structured queries are similar to the types of queries you can construct in SQL. For example, you could search the 
`gender` and `age` fields in your `employee` index and sort the matches by the `hire_date` field. Full-text queries find all 
documents that match the query string and return them sorted by relevance—how good a match they are for your search terms.

In addition to searching for individual terms, you can perform phrase searches, similarity searches, and prefix searches,
and get autocomplete suggestions.

You can access all of these search capabilities using Elasticsearch’s comprehensive JSON-style query language ([Query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl.html)).

Elasticsearch provides a simple, coherent REST API for managing your cluster and indexing and searching your data. we 
are focusing on searching part.

### Analyzing your data

Elasticsearch aggregations enable you to build complex summaries of your data and gain insight into key metrics, patterns, and trends.


### Machine Learning

Want to automate the analysis of your time series data? You can use machine learning features to create accurate baselines of
normal behavior in your data and identify anomalous patterns. With machine learning, you can detect:

- Anomalies related to temporal deviations in values, counts, or frequencies
- Statistical rarity
- Unusual behaviors for a member of a population
- 
And the best part? You can do this without having to specify algorithms, models, or other data science-related configurations.

## Distributed Nature

Elasticsearch automatically distributes your data and query load across all of the available nodes.

### Under the Hood

How does this work? Under the covers, an Elasticsearch index is really just a logical grouping of one or more physical shards, 
where each shard is actually a self-contained index. By distributing the documents in an index across multiple shards, and distributing
those shards across multiple nodes, Elasticsearch can ensure redundancy, which both protects against hardware failures and increases
query capacity as nodes are added to a cluster. As the cluster grows (or shrinks), Elasticsearch automatically migrates shards to 
rebalance the cluster.

There are two types of shards: primaries and replicas. Each document in an index belongs to one primary shard. A replica shard is 
a copy of a primary shard. Replicas provide redundant copies of your data to protect against hardware failure and increase capacity
to serve read requests like searching or retrieving a document.

Shard in distributed among nodes and an index created from multiple shard which means our index data is distributed among nodes
inside cluster

To find sweet spot of shards for your use case you need to test your case: [Check here out](https://www.elastic.co/elasticon/conf/2016/sf/quantitative-cluster-sizing)

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

## Mapping

Mapping is the process of defining how a document, and the fields it contains, are stored and indexed.

First I want to draw your attention to explicit mapping to gain basic understanding or flow then we will move to dynamic mapping.



Two types of mapping:

    1. Dynamic
    2. Explicit

elastic uses dynamic mapping in case of not defining any mapping.

This default behavior makes it easy to index and explore your data—​just start indexing documents and
Elasticsearch will detect and map booleans, floating point and integer values, dates, and strings to the 
appropriate Elasticsearch data types.

### Explicit Mapping

Explicit mapping enables you:

- Distinguish between full-text string fields and exact value string fields
- Perform language-specific text analysis
- Optimize fields for partial matching
- Use custom date formats
- Use data types such as geo_point and geo_shape that cannot be automatically detected

#### Example:

Create an Index to save data:

```ruby
PUT /users
{
  "mappings": {
    "properties": {
      "age":    { "type": "integer" },  # creates age field with integer datatype
      "email":  { "type": "keyword"  }, # creates email field with keyword datatype
      "name":   { "type": "text"  }     # creates name field with text datatype
    }
 }
}
```
Its possible to create nested data: 

```ruby
PUT /users
{
  "mappings": {
    "properties": {
      "age":    { "type": "integer" },  # creates age field with integer datatype
      "email":  { "type": "keyword"  }, # creates email field with keyword datatype
      "purchase":   {
         "properties": {
            "name" : { "type" : "keyword" },
            "price" : { "type" : "integer" } 
          }
      }   
    }
 }
}
```

Also its possible to add new field to index.


### Dynamic Mapping

One of the most important features of Elasticsearch is that it tries to get out of your way and let you start exploring your data
as quickly as possible. To index a document, you don’t have to first create an index, define a mapping type, and define your 
fields you can just index a document and the index, type, and fields will display automatically

#### Dynamic Filed Mapping

When Elasticsearch detects a new field in a document, it dynamically adds the field to the type mapping by default.
The `dynamic` parameter controls this behavior.

You can explicitly instruct Elasticsearch to dynamically create fields based on incoming documents by setting 
the dynamic parameter to true or runtime.

refer [Official Document](https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping.html) for more info.

#### Dynamic Template Mapping

Apply mapping base on condition in data creation time.

- `match_mapping_type` operates on the data type that Elasticsearch detects
- `match` and `unmatch` use a pattern to match on the field name
- `path_match` and `path_unmatch` operate on the full dotted path to the field

Example: 

Changes string value for field name starts with ip

```ruby
PUT my-index-000001/
{
  "mappings": {
    "dynamic_templates": [
      {
        "strings_as_ip": {
          "match_mapping_type": "string",
          "match": "ip*",
          "runtime": {
            "type": "ip"
          }
        }
      }
    ]
  }
}
```

## Search Data

Search query is a question you ask elastic in a format elastic understands it, for instance users activity: what is the average price for 
all sold materials or what is the most recent request and what is the popular api in my app, or search specific word in description of products.

Responses returns in JSON format inside `hits` key.

Examples: 

Search for users with name `John` in `users` index 

```ruby
GET /users/_search
{
  "query": {
    "match": {
      "user.name": "John"
    }
  }
}
```

or in all indices, search address for students and teachers and all other indices has address field

```ruby
GET /users/_search
{
  "query": {
    "match": {
      "address": "Main St"
    }
  }
}
```

```ruby
{
  "took": 5,
  "timed_out": false,
  "_shards": {
    "total": 1,
    "successful": 1,
    "skipped": 0,
    "failed": 0
  },
  "hits": {
    "total": {
      "value": 1,
      "relation": "eq"
    },
    "max_score": 1.3862942,
    "hits": [
      {
        "_index": "users",
        "_id": "kxWFcnMByiguvud1Z8vC",
        "_score": 1.3862942,
        "_source": {
          "@timestamp": "2099-11-15T14:12:12",
          "http": {
            "request": {
              "method": "get"
            },
            "response": {
              "bytes": 1070000,
              "status_code": 200
            },
            "version": "1.1"
          },
          "message": "GET /search HTTP/1.1 200 1070000",
          "source": {
            "ip": "127.0.0.1"
          },
          "user": {
            "name": "John"
          }
        }
      },
      {
        "_index": "users",
        "_id": "kxWFcnMByfghtud1Z8vD",
        "_score": 1.2862942,
        "_source": {
          "@timestamp": "2099-11-15T14:12:12",
          "http": {
            "request": {
              "method": "get"
            },
            "response": {
              "bytes": 1070000,
              "status_code": 200
            },
            "version": "1.1"
          },
          "message": "GET /search HTTP/1.1 200 1070000",
          "source": {
            "ip": "127.0.0.1"
          },
          "user": {
            "name": "Johne"
          }
        }
      }
    ]
  }
}
```

## Aggregations

I will implement this under `services/aggregations`

## Data streams

A data stream lets you store append-only time series data across multiple indices while giving you a single named resource
for requests. Data streams are well-suited for logs, events, metrics, and other continuously generated data.

Check [here](https://www.elastic.co/guide/en/elasticsearch/reference/current/rest-apis.html) for more

## API conventions

The Elasticsearch REST APIs are exposed over HTTP. Except where noted, the following conventions apply across all APIs.

For see list of common option across all elastic API's check [here](https://www.elastic.co/guide/en/elasticsearch/reference/current/common-options.html
)

## A Bit of Functionality 

Check docs folder and services for real functionality

## Advanced Config

This part is for more information and its not necessary for using repo code

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
### Elastic Configs

#### Elastic path config

```
path:
  data: /var/data/elasticsearch #Your Indexed data in indices and data streams
  logs: /var/log/elasticsearch #information about elastic cluster and operations
```

#### Cluster name setting
A node can only join a cluster when it shares its cluster.name with all the other nodes in the cluster.

    cluster.name: logging-prod

#### Network setting

to run elastic cluster with multiple nodes

    network.host: xxx.xxx.xxx.xxx

to add nodes address to elastic for nodes to find each other and elect for master node:

#### Discovery and Cluster
```
    discovery.seed_hosts:
        - 192.168.1.10:9300
        - 192.168.1.11
        - seeds.mydomain.com
        - [0:0:0:0:0:ffff:c0a8:10c]:9301 
```


### System Configs

Ideally, Elasticsearch should run alone on a server and use all of the resources available to it.
In order to do so, you need to configure your operating system to allow the user running 
Elasticsearch to access more resources than allowed by default.


## Beats

They are data shippers for Elastic and send data from different sources to Elastic and Logstash check [here](https://www.elastic.co/beats/) for more
