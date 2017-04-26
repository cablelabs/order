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


## Endpoints

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
  "orderStatus": "IN_PROGRESS",
  "orderItemStatuses": [
    {
      "orderItemReference": "01",
      "orderItemStatus": "COMPLETE"
    },
    {
      "orderItemReference": "02",
      "orderItemStatus": "IN_PROGRESS"
    }
  ]
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
  "orderStatus": "IN_PROGRESS",
  "orderItemStatuses": [
    {
      "orderItemReference": "01",
      "orderItemStatus": "COMPLETE"
    },
    {
      "orderItemReference": "02",
      "orderItemStatus": "IN_PROGRESS"
    }
  ]
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
  "notificationVersion": "01",
  "projectId": "PRJ-CC-482457303",
  "requestedCompletionDate": "2016-10-11T17:20+01:00",
  "expectedCompletionDate": "2016-10-05T08:00+01:00",
  "orderStatus": "IN_PROGRESS",
  "sellerOrderContact": {
    "objectType": "contact",
    "name": "Janis Freewheel",
    "telephoneNumber": "+1868-334-0565"
  },
  "billingAccountNumber": "12345678",
  "sellerOvcId": {
    "objectType": "idAssignment",
    "sellerAssignedId": "OVC-123-abc",
    "buyerAssignedId": "OVC-123-xyz",
    "orderItemReference": "1"
  },
  "sellerUniIds": [
    {
      "objectType": "idAssignment",
      "sellerAssignedId": "UNI-123-abc",
      "buyerAssignedId": "UNI-123-xyz",
      "orderItemReference": "2"
    }
  ],
  "sellerEnniIds": [
    {
      "objectType": "idAssignment",
      "sellerAssignedId": "ENNI-123-abc",
      "buyerAssignedId": "ENNI-123-xyz",
      "orderItemReference": "3"
    }
  ],
  "enniSvlanIds": [
    {
      "objectType": "svlanIdAssignment",
      "sellerEnniId": "ENNI-123-abc",
      "svlanId": 1,
      "svlanIdLast": 2
    }
  ],
  "uniSvlanIds": [
    {
      "objectType": "svlanIdAssignment",
      "sellerUniId": "UNI-123-abc",
      "svlanId": 10,
      "svlanIdLast": 20
    }
  ],
  "correctionOrderExpected": "false"
}
```

### Create a notification for an order

```
POST /orders/{id}/notifications
```
This API is used to create an Order Notification.
The example below creates a ERROR notification.
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
    "notificationType": "ERROR",
    "notificationVersion": "03",
    "projectId": "Costco0954",
    "requestedCompletionDate": "Dog",
    "sellerOrderContact": {
      "objectType": "contact",
      "name": "Janis Freewheel",
      "telephoneNumber": "+1868-334-0565"
    },
    "orderMessages": [
      {
        "code": "FMT002",
        "description": "Desired Completion Date Invalid",
        "messageInformation": "The Desired Completion Date specified is not a valid date",
        "severity": "ERROR",
        "correctionRequired": false
      }
    ],
    "correctionOrderExpected": false
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
    "notificationType": "ERROR",
    "notificationVersion": "04",
    "projectId": "Costco0954",
    "requestedCompletionDate": "Dog",
    "sellerOrderContact": {
      "objectType": "contact",
      "name": "Janis Freewheel",
      "telephoneNumber": "+1868-334-0565"
    },
    "orderMessages": [
      {
        "code": "FMT002",
        "description": "Desired Completion Date Invalid",
        "messageInformation": "The Desired Completion Date specified is not a valid date",
        "severity": "ERROR",
        "correctionRequired": false
      }
    ],
    "correctionOrderExpected": false
}
```

### Example Order Notifications ###

**ERROR Notification**
``` JSON
{
    "objectType": "orderNotification",
    "orderId": "ORD-CC-0293479283",
    "buyerId": "Verizon",
    "sellerId": "Cox",
    "buyerPurchaseOrderNumber": "PO14432",
    "buyerOrderVersion": "04",
    "notificationType": "ERROR",
    "notificationVersion": "01",
    "projectId": "Costco0954",
    "requestedCompletionDate": "Dog",
    "sellerOrderContact": {
      "objectType": "contact",
      "name": "Janis Freewheel",
      "telephoneNumber": "+1868-334-0565"
    },
    "orderMessages": [
      {
        "code": "FMT002",
        "description": "Desired Completion Date Invalid",
        "messageInformation": "The Desired Completion Date specified 'dog' is not a valid date",
        "severity": "ERROR",
        "correctionRequired": false
      }
    ],
    "correctionOrderExpected": false
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
    "notificationVersion": "02",
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
        "objectType": "svlanIdAssignment",
        "sellerEnniId": "ENNI-123-abc",
        "svlanId": 100,
        "svlanIdLast": 120
      }
    ],
    "sellerOrderContact": {
      "objectType": "contact",
      "name": "Janis Freewheel",
      "telephoneNumber": "+1868-334-0565"
    }
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
    "notificationVersion": "03",
    "projectId": "Costco0954",
    "requestedCompletionDate": "2016-10-11T17:20+01:00",
    "orderStatus": "IN_PROGRESS",
    "sellerOrderContact": {
      "objectType": "contact",
      "name": "Janis Freewheel",
      "telephoneNumber": "+1868-334-0565"
    },
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
        "objectType": "svlanIdAssignment",
        "sellerEnniId": "CKT-14-G-092349235",
        "svlanId": 1141,
        "svlanIdLast": 1147
      }
    ]
}
```

**CANCELLATION Notification (This represents a Seller initiated Cancellation**
``` JSON
{
    "objectType": "orderNotification",
    "orderId": "ORD-CC-0293479283",
    "buyerId": "Verizon",
    "sellerId": "Cox",
    "buyerPurchaseOrderNumber": "PO14432",
    "buyerOrderVersion": "04",
    "notificationType": "CANCELLATION",
    "notificationVersion": "04",
    "orderDate": "2016-10-11T17:20+01:00",
    "orderCancellationDate": "2016-14-14T13:10+10:10",
    "orderCancellationReason": "Correction Order not received",
    "sellerOrderContact": {
      "objectType": "contact",
      "name": "Janis Freewheel",
      "telephoneNumber": "+1868-334-0565"
    },
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
    "notificationVersion": "02",
    "projectId": "Costco0954",
    "requestedCompletionDate": "2016-10-11T17:20+01:00",
    "orderStatus": "COMPLETED",
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
    "notificationVersion": "02",
    "projectId": "Costco0954",
    "requestedCompletionDate": "2016-10-11T17:20+01:00",
    "orderStatus": "HELD",
    "sellerOrderContact": {
      "objectType": "contact",
      "name": "Janis Freewheel",
      "telephoneNumber": "+1868-334-0565"
    },
    "expectedCompletionDate": "2016-11-02",
    "orderMessages": [
      {
        "code": "JEP002",
        "MessageInformation": "Awaiting contractor confirmation for inside wiring to customer location.",
        "severity": "INFORMATION",
        "correctionRequired": false
      }
    ],
    "correctionOrderExpected": false
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
    "notificationVersion": "02",
    "projectId": "Costco0954",
    "requestedCompletionDate": "2016-10-11T17:20+01:00",
    "orderStatus": "PENDING",
    "sellerOrderContact": {
      "objectType": "contact",
      "name": "Janis Freewheel",
      "telephoneNumber": "+1868-334-0565"
    },
    "expectedCompletionDate": "2016-11-02",
    "orderMessages": [
      {
        "code": "PRD045",
        "field": "Pricing Term.",
        "MessageInformation": "The pricing term specified 'dog' is not valid. A pricing term of 12 months has been used. If a different pricing term is desired, submit a new order version.",
        "severity": "INFORMATION",
        "orderItemReference": "01",
        "correctionRequired": false
      },
      {
        "code": "PRD16",
        "field": "Product Specification",
        "MessageInformation": "The product specified 'Super UNI II' does not exist. Correct the product and submit a new order version. This order will be automatically cancelled in 45 days if a new order version is not received",
        "severity": "ERROR",
        "orderItemReference": "02",
        "correctionRequired": true
      }
    ],
    "correctionOrderExpected": true,
    "correctionOrderDueDate": "2016-11-02"
}
```
