## Order Status and Notification Interface

The Order Status and Notification API describes the API for Order Status and Notifications. Both synchronous and asynchronous API is provided.

The Endpoint Summary table describes each API endpoint. Following the table is an example of each action at each endpoint, including sample request and response payloads.


**Endpoint Summary**

| Action | Endpoint |
| ------ | -------- |
| Get status of an order (if synchronous status is supported). Query string is `?orderId=value1&buyerId=value2&sellerId=value3&buyerPurchaseOrderNumber=value4` | GET /orders/{id}/status |
| Create a status request of an order (if asynchronous status is supported) | POST /orders/status-request |
| Create a status response of an order (if asynchronous status is supported) | POST /orders/status-response |
| Get an order notification | GET /orders/{id}/notifications |
| Create a notification for an order | POST /orders/{id}/notifications |


##Endpoints

### Get status of an order (if synchronous status is supported)

```
GET /orders/status&id=ORD-CC-12345
or
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
This API is called at a Buyer endpoint.

**Request**

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
  "completionDate": "2016-10-05T08:00+01:00",
  "orderStatus": "COMPLETED",
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

**Response**

Status: 201 Created
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
  "completionDate": "2016-10-05T08:00+01:00",
  "orderStatus": "COMPLETED",
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

