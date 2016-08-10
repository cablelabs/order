
# mef-order
Web Services focused on MEF Order

> **IMPORTANT**: This project is in pre-release development. Please expect frequent changes and updates while we converge on our initial release.

### API

The API endpoints for MEF Order web services are designed and documented using [Swagger](http://swagger.io/). The endpoint definitions can be found in the [endpoints](endpoints) directory. We utilize a [builder](builder) to compile all of the endpoint definitions and their respective schemas into a single Swagger file, which is ultimately published to our github.io site [here](http://cablelabs.github.io/mef-order/swagger/index.html) using Swagger UI. We automate this build and deploy process with [Codeship](https://codeship.com/).

### Schemas

The schemas can be found in the [schemas](schemas) directory. We provide schemas in both [JSON Schema](http://json-schema.org/) and [XSD](http://www.w3schools.com/schema/). Here's an example of the kind of JSON Schema you can expect to find:

``` JSON
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "title": "quantity",
  "id": "quantity",
  "description": "A base / value business entity used to represent measurements.",
  "type": "object",
  "properties": {
    "amount": {
      "type": "number",
      "description": "A positive floating point number representing the amount of the quantity."
    },
    "units": {
      "type": "string",
      "description": "The unit of measure for the quantity, such as meters, cubic yards, kilograms [ISO 1000]."
    }
  }
}
```

### Apps

The [apps](apps) directory will contains sample applications used to demonstrate the enterprise web services APIs.

### Getting started

To get started, simply clone this repo:

```
$ git clone https://github.com/cablelabs/enterprise-web-services.git
```

If you're new to git and GitHub, but sure to check out the [Pro Git](https://git-scm.com/book/en/v2) book. [GitHub Help](https://help.github.com/) is also outstanding.

### Contributing 

enterprise-web-services was originally built by [CableLabs](http://cablelabs.com/), but we could use your help! Check out our [contributing guidelines](CONTRIBUTING.md) to get started.

### Other important stuff

We use an [MIT License](LICENSE.md).

Questions? Just send us an email at btech@cablelabs.com.
