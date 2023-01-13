# Search

## Basic search query to retrieve data

Use below command to do your first search in elastic search

```ruby
GET customer/_search
{
  "query" : {
    "match" : { "firstname": "Jennifer" }
  }
}
```
