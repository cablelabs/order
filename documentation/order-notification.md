## Example Order Notifications

The Order Notification API is described in [Order Notification API](order-notification-api.md)

**Notification Summary**

|  **Notification Type** | **Notification Trigger** | **Notification Purpose** | **Key Information** |
|  :------ | :------ | :------ | :------ |
|  ERROR | Order is rejected after SUBMIT | Notify Buyer that Order needs to be corrected and either corrected, or a new replacement order submitted. | buyerPurchaseOrderNumber, buyerOrderVersion, status, and Order Messages. |
|  CONFIRMATION | Seller accepts Order into OM system, and assigns expectedCompletionDate, and configures seller assigned IDs | Notify Buyer that the Order is fully accepted, and of the Seller’s committed completion date for the Order, and Seller assigned IDs. | buyerPurchaseOrderNumber, buyerOrderVersion, and the expectedCompletionDate,  billingAccountNumber, sellerUniId, sellerEnniId, sellerOvcId, and enniSvlanId for the Order. |
|  CONFIGURATION | Seller assigns configuration information (new billing account number, sellerUniId, sellerEnniId, sellerOvcId, and enniSvlanId) | Notify Buyer of Seller assigned configuration items relevant to the Order. | buyerPurchaseOrderNumber, buyerOrderVersion, status, billingAccountNumber, sellerUniId, sellerEnniId, sellerOvcId, and enniSvlanId |
|  CANCELLATION | Seller (or Buyer) Cancels Order | Notify Buyer that the Order is cancelled in the Seller system, and will not be processed further.<br/>The Buyer may resubmit a corrected Order as a new Order (i.e. new buyerPurchaseOrderNumber). | buyerPurchaseOrderNumber, buyerOrderVersion, cancellation date and cancellation reason. |
|  COMPLETION | Seller completes the Order (and marks it as Complete in their OM system). | Notify the Buyer that the Order is completely implemented, and there will be no further notifications for this Order. | buyerPurchaseOrderNumber, buyerOrderVersion, status, completionDate, billingAccountNumber, sellerUniId, sellerEnniId, sellerOvcId, and enniSvlanId. |
|  JEOPARDY | Seller believes that the expectedCompletionDate may be in jeopardy. | Notify the Buyer that the expectedCompletionDate may not be met, the reason that the expectedCompletionDate may not be met, and whether the Buyer is expected to correct the Order and respond with a new buyerOrderVersion. | Key information includes: buyerPurchaseOrderNumber, buyerOrderVersion, jeopardy reason, and whether the Seller expects the Buyer to submit an update (supplemental order) with a new buyerOrderVersion. |
|  STATUS_UPDATE | Conveys changes in Order Status to the Buyer.<br/><br/>After an order is Accepted, but prior to a COMFIRMATION notification being sent by the Seller, order errors are communicated via a STATUS_UPDATE Notification.<br/><br/>Changes to the Order status are communicated via a STATUS_UPDATE Notification (except for Order Completion, which is communicated via a COMPLETION Notification). | Notify the Buyer or order status changes, or that there is something that needs to be corrected in the Order before it can be fulfilled by the Seller. | buyerPurchaseOrderNumber, buyerOrderVersion, orderStatus, and what needs correction or clarification, and whether the Seller expects the Buyer to submit an update (supplemental order) with a new buyerOrderVersion. |

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
    "correctionOrderExpected": true,
    "correctionOrderDueDate": "2016-11-02"
}
```

**CONFIRMATION Notification**
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
      "svlanId": 1235
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
    "expectedCompletionDate": "2016-10-11",
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
    "enniSvlanIds": [
      {
        "objectType": "svlanIdAssignment",
        "sellerEnniId": "ENNI-123-abc",
        "svlanId": 1
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
    "enniSvlanIds": [
      {
        "objectType": "svlanIdAssignment",
        "sellerEnniId": "ENNI-123-abc",
        "svlanId": 1
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
