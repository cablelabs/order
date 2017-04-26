## Order Status Interface

This file describes the API for Order Status interactions. Both synchronous and asynchronous API is provided.

The Endpoint Summary table describes each Order Status endpoint. Following the table is an example of each action at each endpoint, including sample request and response payloads.


**Endpoint Summary**

| Action | Endpoint |
| ------ | -------- |
| Get status of an order (if synchronous status is supported). Query string is `?orderId=value1&buyerId=value2&sellerId=value3&buyerPurchaseOrderNumber=value4` | GET /orders/{id}/status |
| Create a status request of an order (if asynchronous status is supported) | POST /orders/status-request |
| Create a status response of an order (if asynchronous status is supported) | POST /orders/status-response |


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

**Response**

Status: 201 Created
