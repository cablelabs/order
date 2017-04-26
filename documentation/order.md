# Order

This repository contains an example Order API that meets the business requirements documented by the Joint OBF OS/MEF Ordering Team.
This API conforms to the business requirements, inclusive of CfC comments resolved as of 2/27/2017.

The Order state machine is provided below. This state machine is based upon TMForum Order State machine, and will need to be revised (either by TMForum, or the Joint OBF OS/MEF LSO Sonata Ordering Team) to fully meet the needs of Carrier Ethernet Ordering.
![Order State Machine](MEF_OrderStateDiagram.png)

## API

This API is based on TMForum Order, with some extensions to better support ordering of Ethernet service. The TMForum Characteristic/Characteristic Value pattern is *not* used. Instead, Product Specifications will be defined using the ONF Specification pattern, where the various concrete Product Specifications are schemas whose attributes are "injected" into the Products derived from the Product Specifications. I.e. each Property defined in the Product Specification will be included dynamically (using Json Linked Data - JSON LD) in the Product derived from the Product Specification. For the moment, Product attributes in this API are inlined as Product attributes, and the Product Specification is not referenced using JSON LD. This should be corrected once the TMForum support for the ONF Specification pattern is defined.

The Order API is described in [Order API](order-api.md).

The Order Status API is described in [Order Status API](order-status-api.md).

The Order Notification API is described in [Order Notification API](order-notification-api.md).

Example Order Notifications are provided in [Order Notification Examples](order-notification.md).



## Additional Documentation

Endpoint definitions are provided in the [endpoints](../endpoints) directory of this repository.

Json Schema definitions of the request and response payloads are provided in the [schemas](../schemas) directory of this repository.

Example payloads are included in the [example-data](../example-data) directory of this repository.
