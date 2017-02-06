
# order
Web Services focused on MEF Order

> **IMPORTANT**: This project is in pre-release development. Please expect frequent changes and updates while we converge on our initial release.

### API

The API endpoints for MEF Order web services are designed and documented using [JSON Schema](http://json-schema.org/). Here's an example of the kind of JSON Schema you can expect to find:

``` JSON
{
  "/orders": {
    "post": {
      "tags": [
        "Order"
      ],
      "summary": "Create a new Order.",
      "description": "This service creates a new Order.",
      "consumes": [
        "application/json",
        "application/xml"
      ],
      "parameters": [
        {
          "in": "body",
          "name": "body",
          "description": "",
          "required": true,
          "schema": {
            "$ref": "#/definitions/order-create-update"
          }
        }
      ],
      "responses": {
        "201": {
          "description": "Instance created."
        },
        "405": {
          "description": "Invalid input."
        }
      }
    }
  }
}
```

### Schemas

The schemas can be found in the [schemas](schemas) directory. We provide schemas in [JSON Schema](http://json-schema.org/). Here's an example of the kind of JSON Schema you can expect to find:

``` JSON
{
    "$schema": "http://json-schema.org/draft-04/schema#",
    "title": "informationRateQuantity",
    "id": "informationRateQuantity",
    "description": "A quantity to be used for specifying information rates.",
    "type": "object",
    "required": [
        "objectType"
    ],
    "properties": {
        "objectType": {
            "type": "string",
            "enum": [
                "informationRateQuantity"
            ],
            "description": "The type of the object, bandwidthProfile."
        },
        "amount": {
          "type": "number",
          "required": true
        },
        "units": {
          "type": "string",
          "required": true,
          "enum": [
            "Mbps",
            "Gbps"
          ]
        }
    }
}
```

### Getting started

To get started, simply clone this repo:

```
$ git clone https://github.com/cablelabs/order.git
```

If you're new to git and GitHub, but sure to check out the [Pro Git](https://git-scm.com/book/en/v2) book. [GitHub Help](https://help.github.com/) is also outstanding.

### Contributing

enterprise-web-services was originally built by [CableLabs](http://cablelabs.com/), but we could use your help! Check out our [contributing guidelines](CONTRIBUTING.md) to get started.

### Other important stuff

We use an [MIT License](LICENSE).

Questions? Just send us an email at btech@cablelabs.com.
