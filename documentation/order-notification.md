## Example Order Notifications

The Order Notification API is described in [Order Notification API](order-notification-api.md)

**Notification Summary**

|  **Notification Type** | **Notification Trigger** | **Notification Purpose** | **Key Information** |
|  :------ | :------ | :------ | :------ |
|  REJECTION | Order is rejected after SUBMIT | Notify Buyer that Order was not accepted by the Seller. A new Order will need to be submitted by the Buyer. | Buyer Purchase Order Number, Buyer Order Version, Order Status, and Order Messages. |
|  ERROR_OR_INFORMATION | Subsequent to the Order being ACKNOWLEDGED by the Seller, ERROR_OR_INFORMATION Notifications can be used to communicate Errors, or Informational Messages to the Buyer. The ERROR_OR_INFORMATION Notification may be sent any time that an ERROR or INFORMATION needs to be communicated to the Buyer, regardless of whether the Order Status has changed as a result of the ERROR or INFORMATION. | Notify Buyer of Information about the Order, or that the Order needs to be corrected and a new replacement (correction) Order submitted. | Buyer Purchase Order Number, Buyer Order Version, Order Status, and Order Messages. |
|  CONFIRMATION | Seller accepts Order into their system, assigns the Expected Completion Date, and configures the seller assigned IDs | Notify Buyer that the Order is fully accepted, the Seller’s expected completion date for the Order, and the IDs assigned by the Seller. | Buyer Purchase Order Number, Buyer Order Version, Expected Completion Date, Billing Account Number, Seller UNI Id, Seller ENNI Id, Seller OVC Id, and ENN SVLAN Id for the Order. |
|  CONFIGURATION | Seller assigns configuration information (new Billing Account Number, Seller UNI Id, Seller ENNI Id, Seller OVC Id, and ENN SVLAN Id for the Order) | Notify Buyer of Seller assigned configuration items relevant to the Order. | Buyer Purchase Order Number, Buyer Order Version, Expected Completion Date, Billing Account Number, Seller UNI Id, Seller ENNI Id, Seller OVC Id, and ENN SVLAN I |
|  CANCELLATION | Seller (or Buyer) Cancels Order | Notify Buyer that the Order is cancelled in the Seller system, and will not be processed further. The Buyer may resubmit a corrected Order as a new Order (i.e. new Buyer Purchase Order Number). | Buyer Purchase Order Number, Buyer Order Version, Cancellation Date and Cancellation Reason. |
|  COMPLETION | Seller completes the Order (and marks it as Complete in their OM system). | Notify the Buyer that the Order is completely implemented, and there will be no further notifications for this Order. | Buyer Purchase Order Number, Buyer Order Version, Expected Completion Date, Billing Account Number, Seller UNI Id, Seller ENNI Id, Seller OVC Id, and ENN SVLAN Id for the Order. |
|  JEOPARDY | Seller believes that the Expected Completion Date may be in jeopardy. | Notify the Buyer that the Expected Completion Date may not be met, the reason that the Expected Completion Date may not be met, and whether the Buyer is expected to correct the Order and respond with a corrected Order with a new Buyer Order Version. | Key information includes: Buyer Purchase Order Number, Buyer Order Version, Jeopardy Reason, and whether the Seller expects the Buyer to submit a correction order with a new Buyer Order Version. |
|  STATUS_UPDATE | Conveys changes in Order Status to the Buyer. Changes to the Order Status are communicated via a STATUS_UPDATE Notification (except for Order Completion, which is communicated via a COMPLETION Notification), and Order Status changes that are the result of an ERROR (which are communicated on an ERROR_OR_INFORMATION Notification). | Notify the Buyer or order status changes. | Buyer Purchase Order Number, Buyer Order Version, Order Status, what needs to be corrected or clarified, and whether the Seller expects the Buyer to submit an Correction Order with a new Buyer Order Version. |

### Example Order Notifications ###

**ERROR_OR_INFORMATION Notification**
``` JSON
{
    "objectType": "orderNotification",
    "orderId": "ORD-CC-0293479283",
    "buyerId": "Verizon",
    "sellerId": "Cox",
    "buyerPurchaseOrderNumber": "PO14432",
    "buyerOrderVersion": "04",
    "notificationType": "ERROR_OR_INFORMATION",
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

**JEOPARDY Notification Example 1**
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

**JEOPARDY Notification Example 2**
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
        "code": "JEP001",
        "MessageInformation": "Unable to gain access to customer location. Reschedule installation, and provide correction Order with new Requested Due Date.",
        "severity": "INFORMATION",
        "correctionRequired": false
      }
    ],
    "correctionOrderExpected": true
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
    "orderStatus": "IN_PROGRESS",
    "sellerOrderContact": {
      "objectType": "contact",
      "name": "Janis Freewheel",
      "telephoneNumber": "+1868-334-0565"
    },
    "expectedCompletionDate": "2016-11-02"
}
```
