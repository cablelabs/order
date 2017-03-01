## Order Status and Notification Interface

The Order Status and Notification API describes the API for Order Status and Notifications. Both synchronous and asynchronous API is provided.

The Endpoint Summary table describes each Order Status and Notification API endpoint. Following the table is an example of each action at each endpoint, including sample request and response payloads.


**Endpoint Summary**

| Action | Endpoint |
| ------ | -------- |
| Get status of an order (if synchronous status is supported). Query string is `?orderId=value1&buyerId=value2&sellerId=value3&buyerPurchaseOrderNumber=value4` | GET /orders/{id}/status |
| Create a status request of an order (if asynchronous status is supported) | POST /orders/status-request |
| Create a status response of an order (if asynchronous status is supported) | POST /orders/status-response |
| Get an order notification | GET /orders/{id}/notification |
| Create a notification for an order | POST /orders/{id}/notification |


##Endpoints

### Get status of an order (if synchronous status is supported)

```
GET /orders/status&id=ORD-CC-12345
```
or
```
GET /orders/status&buyerId=Verizon&sellerId=Cox&buyerPurchaseOrderNumber=PO-12345
```
Return the status of an Order by Order ID. This is a synchronous API, and the status of the Order is returned in the response.
This API is called at a Seller endpoint.

**Response**

Status: 200 OK
``` JSON
{
  "objectType": "orderStatusResponse",
  "orderId": "ORD-CC-12345",
  "buyerId": "Verizon",
  "sellerId": "Cox",
  "buyerPurchaseOrderNumber": "PO-12345",
  "buyerOrderVersion": "1",
  "projectId": "PRJ-CC-482457303",
  "requestedCompletionDate": "2016-10-11T17:20+01:00",
  "expectedCompletionDate": "2016-10-05T08:00+01:00",
  "orderStatus": "IN_PROGRESS"
}
```

### Create a status request of an order (if asynchronous status is supported)

```
POST /orders/status-request
```
Request the status of an Order by ID.
This is an asynchronous API, called at a Seller endpoint.

**Request**

``` JSON
{
  "objectType": "orderStatusRequest",
  "orderId": "ORD-CC-12345",
  "buyerId": "Verizon",
  "sellerId": "Cox Spectrum Business",
  "buyerPurchaseOrderNumber": "PO-12345"
}
```

**Response**

Status: 201 Created
``` JSON
{
  "objectType": "orderStatusRequest",
  "orderId": "ORD-CC-12345",
  "buyerId": "Verizon",
  "sellerId": "Cox Spectrum Business",
  "buyerPurchaseOrderNumber": "PO-12345"
}
```

### Create a status response of an order (if asynchronous status is supported)

```
POST /orders/status-response
```
Reply with the status of an Order.
This API is called at a Buyer endpoint.

**Request**

``` JSON
{
  "objectType": "orderStatusResponse",
  "orderId": "ORD-CC-12345",
  "buyerId": "Verizon",
  "sellerId": "Cox Spectrum Business",
  "buyerPurchaseOrderNumber": "PO-12345",
  "buyerOrderVersion": "1",
  "projectId": "PRJ-CC-482457303",
  "requestedCompletionDate": "2016-10-11T17:20+01:00",
  "expectedCompletionDate": "2016-10-05T08:00+01:00",
  "orderStatus": "IN_PROGRESS"
}
```

**Response**

Status: 201 Created
``` JSON
{
  "objectType": "orderStatusResponse",
  "orderId": "ORD-CC-12345",
  "buyerId": "Verizon",
  "sellerId": "Cox Spectrum Business",
  "buyerPurchaseOrderNumber": "PO-12345",
  "buyerOrderVersion": "1",
  "projectId": "PRJ-CC-482457303",
  "requestedCompletionDate": "2016-10-11T17:20+01:00",
  "expectedCompletionDate": "2016-10-05T08:00+01:00",
  "orderStatus": "IN_PROGRESS"
}
```

### Get an order notification

```
GET /orders/{id}/notifications
```
Request the notifications of an Order by ID.
This is a synchronous API called on a Seller endpoint.
NOTE: An asynchronous API using a request & response pattern (similar to the Order Status asynchronous API could also be supported)

**Response**

Status: 200 OK
``` JSON
{
  "objectType": "orderNotification",
  "orderId": "ORD-CC-12345",
  "buyerId": "Verizon",
  "sellerId": "Cox Spectrum Business",
  "buyerPurchaseOrderNumber": "PO-12345",
  "buyerOrderVersion": "1",
  "notificationType": "CONFIRMATION",
  "projectId": "PRJ-CC-482457303",
  "requestedCompletionDate": "2016-10-11T17:20+01:00",
  "expectedCompletionDate": "2016-10-05T08:00+01:00",
  "orderStatus": "IN_PROGRESS",
  "billingAccountNumber": "12345678",
  "sellerOvcId": {
    "objectType": "idAssignment",
    "sellerAssignedId": "OVC-123-abc",
    "buyerAssignedId": "OVC-123-xyz",
    "orderId": "ORD-CC-12345",
    "buyerPurchaseOrderNumber": "PO-12345",
    "orderItemReference": "1"
  },
  "sellerUniIds": [
    {
      "objectType": "idAssignment",
      "sellerAssignedId": "UNI-123-abc",
      "buyerAssignedId": "UNI-123-xyz",
      "orderId": "ORD-CC-12345",
      "buyerPurchaseOrderNumber": "PO-12345",
      "orderItemReference": "1"
    }
  ],
  "sellerEnniIds": [
    {
      "objectType": "idAssignment",
      "sellerAssignedId": "ENNI-123-abc",
      "buyerAssignedId": "ENNI-123-xyz",
      "orderId": "ORD-CC-12345",
      "buyerPurchaseOrderNumber": "PO-12345",
      "orderItemReference": "1"
    }
  ],
  "enniSvlanIds": [
    {
      "objectType": "svlanIdAssignment",
      "sellerEnniId": "ENNI-123-abc",
      "sellerUniId": "UNI-123-abc",
      "svlanId": 1,
      "svlanIdLast": 2
    }
  ],
  "uniSvlanIds": [
    {
      "objectType": "svlanIdAssignment",
      "sellerEnniId": "ENNI-123-abc",
      "sellerUniId": "UNI-123-abc",
      "svlanId": 1,
      "svlanIdLast": 2
    }
  ],
  "correctiveOrderExpected": "false"
}
```

### Create a notification for an order

```
POST /orders/{id}/notifications
```
This API is used to create an Order Notification.
The example below creates a REJECT notification.
This API is called at a Buyer endpoint.

**Request**

``` JSON
{
    "objectType": "orderNotification",
    "orderId": "ORD-CC-0293479283",
    "buyerId": "Verizon",
    "sellerId": "Cox",
    "buyerPurchaseOrderNumber": "PO14432",
    "buyerOrderVersion": "04",
    "notificationType": "REJECTION",
    "projectId": "Costco0954",
    "requestedCompletionDate": "Dog",
    "orderMessages": [
      {
        "code": "FMT002",
        "description": "Desired Completion Date Invalid",
        "messageInformation": "The Desired Completion Date specified is not a valid date",
        "severity": "ERROR",
        "correctionRequired": false
      }
    ],
    "correctiveOrderExpected": false
}
```

**Response**

Status: 201 Created
``` JSON
{
    "objectType": "orderNotification",
    "orderId": "ORD-CC-0293479283",
    "buyerId": "Verizon",
    "sellerId": "Cox",
    "buyerPurchaseOrderNumber": "PO14432",
    "buyerOrderVersion": "04",
    "notificationType": "REJECTION",
    "projectId": "Costco0954",
    "requestedCompletionDate": "Dog",
    "orderMessages": [
      {
        "code": "FMT002",
        "description": "Desired Completion Date Invalid",
        "messageInformation": "The Desired Completion Date specified is not a valid date",
        "severity": "ERROR",
        "correctionRequired": false
      }
    ],
    "correctiveOrderExpected": false
}
```

### Example Order Notifications ###

**Rejection Notification**
``` JSON
{
    "objectType": "orderNotification",
    "orderId": "ORD-CC-0293479283",
    "buyerId": "Verizon",
    "sellerId": "Cox",
    "buyerPurchaseOrderNumber": "PO14432",
    "buyerOrderVersion": "04",
    "notificationType": "REJECTION",
    "projectId": "Costco0954",
    "requestedCompletionDate": "Dog",
    "orderMessages": [
      {
        "code": "FMT002",
        "description": "Desired Completion Date Invalid",
        "messageInformation": "The Desired Completion Date specified 'dog' is not a valid date",
        "severity": "ERROR",
        "correctionRequired": false
      }
    ],
    "correctiveOrderExpected": false
}
```

**CONFIRMATION Notification**
``` JSON
{
    "objectType": "orderNotification",
    "orderId": "ORD-CC-0293479283",
    "buyerId": "Verizon",
    "sellerId": "Cox",
    "buyerPurchaseOrderNumber": "PO14432",
    "buyerOrderVersion": "04",
    "notificationType": "CONFIRMATION",
    "projectId": "Costco0954",
    "requestedCompletionDate": "2016-10-11T17:20+01:00",
    "orderStatus": "IN_PROGRESS",
    "expectedCompletionDate": "2016-10-11"
}
```

**CONFIGURATION Notification**
``` JSON
{
    "objectType": "orderNotification",
    "orderId": "ORD-CC-0293479283",
    "buyerId": "Verizon",
    "sellerId": "Cox",
    "buyerPurchaseOrderNumber": "PO14432",
    "buyerOrderVersion": "04",
    "notificationType": "CONFIGURATION",
    "projectId": "Costco0954",
    "requestedCompletionDate": "2016-10-11T17:20+01:00",
    "orderStatus": "IN_PROGRESS",
    "expectedCompletionDate": "2016-10-11",
    "billingAccountNumber": "10128627954C12",
    "sellerOvcId": "CKT-10-O-293848176253",
    "sellerUniIds": [
      {
        "sellerAssignedId": "CKT-10-O-293848176253",
        "orderItemReference": "02"
      }
    ],
    "sellerEnniIds": [
      {
        "sellerAssignedId": "CKT-14-G-092349235",
        "buyerAssignedId": "10.VLXP.553622.22.MJD"
      }
    ],
    "enniSvlanIds": [
      {
        "sellerEnniId": "CKT-14-G-092349235",
        "svlanId": 1141
      }
    ],
    "svlanIdLast": [
      {
        "sellerEnniId": "CKT-14-G-092349235",
        "svlanId": 1145
      }
    ]
}
```

**CANCELLATION Notification (This represents a Buyer initiated Cancellation, which differs from a Seller initiated Cancellation only in the orderErrors returned)**
``` JSON
{
    "objectType": "orderNotification",
    "orderId": "ORD-CC-0293479283",
    "buyerId": "Verizon",
    "sellerId": "Cox",
    "buyerPurchaseOrderNumber": "PO14432",
    "buyerOrderVersion": "04",
    "notificationType": "CANCELLATION",
    "projectId": "Costco0954",
    "requestedCompletionDate": "2016-10-11T17:20+01:00",
    "orderMessages": [
      {
        "code": "CAN001",
        "description": "Buyer Initiated Cancellation",
        "messageInformation": "The order was cancelled by f.fullerton@verizon.com at 2016-10-03T15:10+45:00",
        "severity": "INFORMATION",
        "correctionRequired": false
      }
    ],
    "correctiveOrderExpected": false
}
```

**CANCELLATION Notification (This represents a Seller initiated Cancellation, which differs from a Buyer initiated Cancellation only in the orderErrors returned)**
``` JSON
{
    "objectType": "orderNotification",
    "orderId": "ORD-CC-0293479283",
    "buyerId": "Verizon",
    "sellerId": "Cox",
    "buyerPurchaseOrderNumber": "PO14432",
    "buyerOrderVersion": "04",
    "notificationType": "CANCELLATION",
    "projectId": "Costco0954",
    "requestedCompletionDate": "2016-10-11T17:20+01:00",
    "orderMessages": [
      {
        "code": "CAN002",
        "description": "Seller Initiated Cancellation",
        "messageInformation": "The order was cancelled because no corrective order provided.",
        "severity": "INFORMATION",
        "correctionRequired": false
      }
    ],
    "correctiveOrderExpected": false
}
```

**COMPLETION Notification**
``` JSON
{
    "objectType": "orderNotification",
    "orderId": "ORD-CC-0293479283",
    "buyerId": "Verizon",
    "sellerId": "Cox",
    "buyerPurchaseOrderNumber": "PO14432",
    "buyerOrderVersion": "04",
    "notificationType": "COMPLETION",
    "projectId": "Costco0954",
    "requestedCompletionDate": "2016-10-11T17:20+01:00",
    "orderStatus": "IN_PROGRESS",
    "expectedCompletionDate": "2016-10-11",
    "completionDate": "2016-10-11",
    "billingAccountNumber": "10128627954C12",
    "sellerOvcId": "CKT-10-O-293848176253",
    "sellerUniIds": [
      {
        "sellerAssignedId": "CKT-10-O-293848176253",
        "orderItemReference": "02"
      }
    ],
    "sellerEnniIds": [
      {
        "sellerAssignedId": "CKT-14-G-092349235",
        "buyerAssignedId": "10.VLXP.553622.22.MJD"
      }
    ],
    "enniSvlanIds": [
      {
        "sellerEnniId": "CKT-14-G-092349235",
        "svlanId": 1141
      }
    ],
    "svlanIdLast": [
      {
        "sellerEnniId": "CKT-14-G-092349235",
        "svlanId": 1145
      }
    ]
}
```

**JEOPARDY Notification**
``` JSON
{
    "objectType": "orderNotification",
    "orderId": "ORD-CC-0293479283",
    "buyerId": "Verizon",
    "sellerId": "Cox",
    "buyerPurchaseOrderNumber": "PO14432",
    "buyerOrderVersion": "04",
    "notificationType": "JEOPARDY",
    "projectId": "Costco0954",
    "requestedCompletionDate": "2016-10-11T17:20+01:00",
    "orderStatus": "HELD",
    "expectedCompletionDate": "2016-11-02",
    "orderMessages": [
      {
        "code": "JEP002",
        "description": "Order Jeopardy Notification - expected completion date updated.",
        "MessageInformation": "Awaiting contractor confirmation for inside wiring to customer location.",
        "severity": "INFORMATION",
        "correctionRequired": false
      }
    ],
    "correctiveOrderExpected": false
}
```

**STATUS_UPDATE Notification**
``` JSON
{
    "objectType": "orderNotification",
    "orderId": "ORD-CC-0293479283",
    "buyerId": "Verizon",
    "sellerId": "Cox",
    "buyerPurchaseOrderNumber": "PO14432",
    "buyerOrderVersion": "04",
    "notificationType": "STATUS_UADATE",
    "projectId": "Costco0954",
    "requestedCompletionDate": "2016-10-11T17:20+01:00",
    "orderStatus": "PENDING",
    "expectedCompletionDate": "2016-11-02",
    "orderMessages": [
      {
        "code": "PRD045",
        "description": "Invalid Pricing Term.",
        "MessageInformation": "The pricing term specified 'dog' is not valid. A pricing term of 12 months has been used. If a different pricing term is desired, submit a new order version.",
        "severity": "WARNING",
        "orderItemReference": "01",
        "correctionRequired": false
      },
      {
        "code": "PRD16",
        "description": "The product specified 'Super UNI II' does not exist. Correct the product and submit a new order version. This order will be automatically cancelled in 45 days if a new order version is not received",
        "MessageInformation": "Awaiting contractor confirmation for inside wiring to customer location.",
        "severity": "ERROR",
        "orderItemReference": "02",
        "correctionRequired": true
      }
    ],
    "correctiveOrderExpected": true
}
```
