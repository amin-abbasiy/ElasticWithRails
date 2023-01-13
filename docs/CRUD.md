# CRUD in Elastic

## Insert

You index data into Elasticsearch by sending JSON objects (documents) through the REST APIs. 
Whether you have structured or unstructured text, numerical data, or geospatial data,
Elasticsearch efficiently stores and indexes it in a way that supports fast searches.

For timestamped data such as logs and metrics, you typically add documents to a
data stream made up of multiple auto-generated backing indices.

Example:
```ruby
POST /<index_name>/_doc/1
{
"firstname": "Jennifer",
"lastname": "Walters"
}
```
## Select

you can retrieve document by sending get request

Example:

```ruby
GET /customer/_doc/1
```

