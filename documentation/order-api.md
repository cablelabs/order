## Orders

**Endpoint Summary**

| Action | Endpoint |
| ------ | -------- |
| List all orders | GET /orders |
| Create an order | POST /orders |
| Get an order | GET /orders/{id} |
| Update an order | PUT /orders/{id} |
| Update an order with partial attributes | PATCH /orders/{id} |
| Get status of an order (if synchronous status is supported). Query string is `?orderId=value1&buyerId=value2&sellerId=value3&buyerPurchaseOrderNumber=value4` | GET /orders/{id}/status |
| Create a status request of an order (if asynchronous status is supported) | POST /orders/status-request |
| Create a status response of an order (if asynchronous status is supported) | POST /orders/status-response |
| Get a order notification | GET /orders/{id}/notifications |
| Create a notification for an order | POST /orders/{id}/notifications |
| Cancel an order | POST /orders/{id}/cancel |
| Hold an order | POST /orders/{id}/hold |
| Release a held order | POST /orders/{id}/release |


### List all Orders

```
GET /orders
```

**Response**

Status: 200 OK
``` JSON
{
  "link": {
    "href": "http://orders/ord-list-234"
  },
  "available": 1,
  "returned": 1,
  "items": [
    {
      "objectType": "order",
      "id": "ORD-CC-12345",
      "link": {
        "href": "http://orders/ORD-CC-12345"
      },
      "buyerId": "Verizon",
      "sellerId": "Cox Spectrum Business",
      "buyerPurchaseOrderNumber": "PO-12345",
      "buyerOrderVersion": "1",
      "orderDate": "2016-10-01T13:20+01:00",
      "orderActivity": "INSTALL",
      "orderStatus": "IN_PROGRESS",
      "desiredResponses": "CONFIRMATION_ONLY",
      "projectId": "PRJ-CC-482457303",
      "requestedCompletionDate": "2016-10-11T17:20+01:00",
      "requestedStartDate": "2016-10-05T08:00+01:00",
      "priority": 2,
      "billingInfo": {
        "objectType": "billingInformation",
        "existingBillingAccountNumber": "12345678"
      },
      "buyerOrderContact": {
        "objectType": "contact",
        "name": "John Doe",
        "telephoneNumber": "+1720-666-1234",
        "telephoneNumberExt": "6576",
        "email":"j.doe@verizon.com"
      },
      "buyerImplementationContact": {
        "objectType": "contact",
        "name": "Mary Jones",
        "telephoneNumber": "+1720-666-1234",
        "telephoneNumberExt": "4536",
        "email":"m.jones@verizon.com"
      },
      "buyerTechnicalContact": {
        "objectType": "contact",
        "name": "Mark Smith",
        "telephoneNumber": "+1303-354-5645",
        "telephoneNumberExt": "845",
        "email":"m.smith@verizon.com"
      },
      "pricingMethod": "CONTRACT",
      "pricingReference": "MSA-12345",
      "pricingTerm": 24,
      "promotionId": "SuperDeal",
      "orderType": "ACCESS_EPL",
      "notes": "Notes go here.",
      "serviceabilityResponse": {
        "objectType": "resourceReference",
        "id": "srr-cc-00234",
        "type": "SERVICEABILITY_RESPONSE",
        "link": {
          "objectType": "link",
          "href": "http://serviceability_responses/srr-cc-00234",
          "rel": "self",
          "title": "Retrieve the Serviceability Response",
          "method": "get",
          "type": "application/json"
        }
      },
      "orderItems": [
        {
          "objectType": "orderItem",
          "orderItemReference": "01",
          "action": "INSTALL",
          "quantity": 1,
          "orderItemDetail": {
            "objectType": "accessEplProductOrder",
            "sellerOvcId": "OVC-123-abc",
            "buyerOvcId": "OVC-123-xyz",
            "productSpecification": "accessEpl-Superfast",
            "enniSvlanId" : 100,
            "enniSvlanIdLast" : 104,
            "mtuSize": 1526,
            "colorForwardingEnabled": true,
            "classOfService": "medium",
            "enniReference": {
                "objectType": "existingEnniReference",
                "sellerEnniId": "ENNI-123-abc",
                "buyerEnniId": "ENNI-456-xyz"
            },
            "enniSiteContact": {
              "objectType": "contact",
              "name": "Bob Rice",
              "telephoneNumber": "+1320-768-9988",
              "telephoneNumberExt": "124",
              "email":"b.rice@verizon.com"
            },
            "enniSiteAlternateContact": {
                "objectType": "contact",
                "name": "Jane Hardy",
                "telephoneNumber": "+1320-768-9988",
                "telephoneNumberExt": "546",
                "email":"j.hardy@verizon.com"
            },
            "enniIngressBandwidthProfile": {
              "objectType": "bandwidthProfile",
              "committedInformationRate": {
                "objectType": "informationRateQuantity",
                "amount": 1,
                "units": "Gbps"
              },
              "committedBurstSize": 250000,
              "excessInformationRate": {
                "objectType": "informationRateQuantity",
                "amount": 1,
                "units": "Gbps"
              },
              "excessBurstSize": 0,
              "colorMode": "COLOR_AWARE",
              "couplingFlag": false
            },
            "uniReference": {
                "objectType": "orderedUniReference",
                "orderItemReference": "02"
            },
            "uniSiteContact": {
              "objectType": "contact",
              "name": "Bob Rice",
              "telephoneNumber": "+1320-768-9988",
              "telephoneNumberExt": "124",
              "email":"b.rice@verizon.com"
            },
            "uniSiteAlternateContact": {
                "objectType": "contact",
                "name": "Jane Hardy",
                "telephoneNumber": "+1320-768-9988",
                "telephoneNumberExt": "546",
                "email":"j.hardy@verizon.com"
            },
            "uniIngressBandwidthProfile": {
              "objectType": "bandwidthProfile",
              "committedInformationRate": {
                "objectType": "informationRateQuantity",
                "amount": 1,
                "units": "Gbps"
              },
              "committedBurstSize": 25000000,
              "excessInformationRate": {
                "objectType": "informationRateQuantity",
                "amount": 1,
                "units": "Gbps"
              },
              "excessBurstSize": 0,
              "colorMode": "COLOR_AWARE",
              "couplingFlag": false
            }
           }
          },
        {
          "objectType": "orderItem",
          "orderItemReference": "02",
          "action": "INSTALL",
          "quantity": 1,
          "orderItemDetail": {
            "objectType": "uniProductOrder",
            "sellerUniId": "UNI-334",
            "buyerUniId": "UNI-343",
            "productSpecification": {
              "objectType": "productSpecRef",
              "name": "Access EVPL 100",
              "code": "AEVPL100",
              "productSpecification": {
                "objectType": "resourceReference",
                "id": "prd-spec-00234",
                "type": "PRODUCT_SPEC",
                "link": {
                  "objectType": "link",
                  "href": "http://product_spec/prod-spec-00234",
                  "rel": "self",
                  "title": "Retrieve the Product Specification",
                  "method": "get",
                  "type": "application/json"
                }
              }
            },
            "physicalLayer": "10GBASE_SR",
            "synchronousModeEnabled": true,
            "numberOfLinks": 1,
            "uniResiliency": "NONE",
            "maxServiceFrameSize": 1522,
            "tokenShareEnabled": false,
            "serviceMultiplexingEnabled": false,
            "bundlingEnabled": false,
            "allToOneBundlingEnabled": true,
            "linkOamEnabled": true,
            "uniMegEnabled": true,
            "elmiEnabled": false,
            "uniL2cpAddressSet": "CTB",
            "serviceSiteInformation": {
              "objectType": "serviceSiteInformation",
              "siteCompanyName": "LeaseCo",
              "customerName": "Wal-Mart",
              "siteAddressType": "FORMATTED_ADDRESS",
              "siteAddress": {
                "objectType": "formattedAddress",
                "addressLine1": "2112 E California",
                "addressLine2": "Suite 250",
                "city": "Oklahoma City",
                "stateOrProvince": "OK",
                "postcode": "73102",
                "postcodeExtension": "4617",
                "country": "US"
              },
              "additionalSiteInformation": "Enter through rear of building"
            },
            "primarySiteContact": {
              "objectType": "contact",
              "name": "James Joy",
              "telephoneNumber": "+1567-676-1334",
              "telephoneNumberExt": "4998",
              "email":"j.joy@walmart.com"
            },
            "alternateSiteContact": {
              "objectType": "contact",
              "name": "John Patrick",
              "telephoneNumber": "+1567-676-1334",
              "telephoneNumberExt": "7869",
              "email":"j.patrick@walmart.com"
            }
          }
        }
      ]
    }
  ]
}
```

### Create an Order

```
POST /order
```

**Response**

Status: 201 Created
``` JSON
{
  "objectType": "order",
  "id": "ORD-CC-12345",
  "link": {
    "href": "http://orders/ORD-CC-12345"
  },
  "buyerId": "Verizon",
  "sellerId": "Cox Spectrum Business",
  "buyerPurchaseOrderNumber": "PO-12345",
  "buyerOrderVersion": "1",
  "orderDate": "2016-10-01T13:20+01:00",
  "orderActivity": "INSTALL",
  "orderStatus": "IN_PROGRESS",
  "desiredResponses": "CONFIRMATION_ONLY",
  "requestedCompletionDate": "2016-10-11T17:20+01:00",
  "billingInfo": {
    "objectType": "billingInformation",
    "existingBillingAccountNumber": "12345678"
  },
  "buyerOrderContact": {
    "objectType": "contact",
    "name": "John Doe",
    "telephoneNumber": "+1720-666-1234"
  },
  "buyerImplementationContact": {
    "objectType": "contact",
    "name": "Mary Jones",
    "telephoneNumber": "+1720-666-1234"
  },
  "buyerTechnicalContact": {
    "objectType": "contact",
    "name": "Mark Smith",
    "telephoneNumber": "+1303-354-5645"
  },
  "orderType": "ACCESS_EPL",
  "orderItems": [
    {
      "objectType": "orderItem",
      "orderItemReference": "01",
      "action": "INSTALL",
      "quantity": 1,
      "orderItemDetail": {
        "objectType": "accessEplProductOrder",
        "sellerOvcId": "OVC-123-abc",
        "buyerOvcId": "OVC-123-xyz",
        "enniReference": {
            "objectType": "existingEnniReference",
            "sellerEnniId": "ENNI-123-abc"
        },
        "enniSiteContact": {
          "objectType": "contact",
          "name": "Bob Rice",
          "telephoneNumber": "+1320-768-9988"
        },
        "enniIngressBandwidthProfile": {
          "objectType": "bandwidthProfile",
          "committedInformationRate": {
            "objectType": "informationRateQuantity",
            "amount": 1,
            "units": "Gbps"
          }
        },
        "uniReference": {
            "objectType": "orderedUniReference",
            "orderItemReference": "02"
        },
        "uniSiteContact": {
          "objectType": "contact",
          "name": "Bob Rice",
          "telephoneNumber": "+1320-768-9988"
        },
        "uniIngressBandwidthProfile": {
          "objectType": "bandwidthProfile",
          "committedInformationRate": {
            "objectType": "informationRateQuantity",
            "amount": 1,
            "units": "Gbps"
          }
        }
      }
    },
    {
      "objectType": "orderItem",
      "orderItemReference": "02",
      "action": "INSTALL",
      "quantity": 1,
      "orderItemDetail": {
        "objectType": "uniProductOrder",
        "buyerUniId": "UNI-343",
        "productSpecification": {
          "objectType": "productSpecRef",
          "code": "AEVPL100",
          "productSpecification": {
            "objectType": "resourceReference",
            "id": "prd-spec-00234",
            "type": "PRODUCT_SPEC",
            "link": {
              "objectType": "link",
              "href": "http://product_spec/prod-spec-00234",
              "rel": "self",
              "method": "get",
              "type": "application/json"
            }
          }
        },
        "physicalLayer": "10GBASE_SR",
        "serviceSiteInformation": {
          "objectType": "serviceSiteInformation",
          "siteCompanyName": "LeaseCo",
          "siteAddressType": "FORMATTED_ADDRESS",
          "siteAddress": {
            "objectType": "formattedAddress",
            "addressLine1": "2112 E California",
            "city": "Oklahoma City",
            "stateOrProvince": "OK",
            "postcode": "73102"
          }
        },
        "primarySiteContact": {
          "objectType": "contact",
          "name": "James Joy",
          "telephoneNumber": "+1567-676-1334"
        }
      }
    }
  ]
}
