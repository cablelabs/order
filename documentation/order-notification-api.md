## Order Notification Interface

This file describes the API for Order Notifications.

The Endpoint Summary table describes each Order Notification API endpoint. Following the table is an example of each action at each endpoint, including sample request and response payloads.


**Endpoint Summary**

| Action | Endpoint |
| ------ | -------- |
| Get an order notification | GET /orders/{id}/notification |
| Create a notification for an order | POST /orders/{id}/notification |


## Endpoints

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
      "svlanId": 1448,
    }
  ],
  "uniSvlanIds": [
    {
      "objectType": "svlanIdAssignment",
      "sellerUniId": "UNI-123-abc",
      "svlanId": 10
    }
  ]
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
    "notificationType": "ERROR_OR_INFORMATION",
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
    "correctionOrderExpected": true,
    "correctionOrderDueDate": "2016-11-02"
}
```

**Response**

Status: 201 Created
