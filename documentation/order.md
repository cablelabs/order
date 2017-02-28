# Order

This repository contains an Order API that meets the business requirements documented by the Joint OBF OS/MEF LSO Sonata Ordering Team.
This API conforms to the business requirements stated in the Carrier Ethernet Ordering Technical Specification located in [LSO Sonata - Ethernet Ordering (Joint MEF-ATIS OBF)](https://wiki.mef.net/display/AL/Ethernet+Ordering+Contributions), inclusive of CfC comments resolved as of 2/27/2016.

The CfC comments are located in [LSO Sonata - Ethernet Ordering (Joint MEF-ATIS OBF)](https://wiki.mef.net/display/AL/Ethernet+Ordering+Contributions) in a spreadsheet called CfCBComments-Ordering-consolidated.

The Order state machine that is being used by the Joint OBF OS/MEF LSO Sonata Ordering Project is provided below. This state machine is based upon TMForum Order State machine, and will need to be revised (either by TMForum, or the Joint OBF OS/MEF LSO Sonata Ordering Team) to fully meet the needs defined in then Carrier Ethernet Ordering Technical Specification.
![Order State Machine](MEF_OrderStateDiagram.png)

##API

This API is based on TMForum Order, with some extensions to better support ordering of Ethernet service. The TMForum Characteristic/Characteristic Value pattern is *not* used. Instead, Product Specifications will be defined using the ONF Specification pattern, where the various concrete Product Specifications are schemas whose attributes are "injected" into the Products derived from the Product Specifications. I.e. each Property defined in the Product Specification will be included dynamically (using Json Linked Data - JSON LD) in the Product derived from the Product Specification. For the moment, Product attributes in this API are inlined as Product attributes, and the Product Specification is not referenced using JSON LD. This should be corrected once the TMForum support for the ONF Specification pattern is defined.

The Order API is described in [Order API](order-api.md)

The Order Status and Notification API is described in [Order Status and Notification API](order-status-and-notification-api.md)


##Additional Documentation

Endpoint definitions are provided in the `/endpoints` directory of this repository.

Json Schema definitions of the request and response payloads are provided in the `/schemas` directory of this repository.

Example payloads are included in the `/example-data` directory of this repository.
