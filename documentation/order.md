# Order

This Order repository contains an Order API that meets the business requirements documented by the Joint OBF OS/MEF LSO Sonata Ordering Team.
This API conforms to the business requirements stated in the Carrier Ethernet Ordering Technical Specification located in [LSO Sonata - Ethernet Ordering (Joint MEF-ATIS OBF)](https://wiki.mef.net/display/AL/Ethernet+Ordering+Contributions), inclusive of CfC comments resolved as of 2/27/2016.
The CfC comments are also located in [LSO Sonata - Ethernet Ordering (Joint MEF-ATIS OBF)](https://wiki.mef.net/display/AL/Ethernet+Ordering+Contributions) in a spreadsheet called CfCBComments-Ordering-consolidated.

The Order state machine that is being used by the Joint OBF OS/MEF LSO Sonata Ordering Project is provided below. This state machine is based upon TMForum Order State machine, and will need to be revised (either by TMForum, or the Joint OBF OS/MEF LSO Sonata Ordering Team to fully meet the needs defined in then Carrier Ethernet Ordering Technical Specification.
![Order State Machine](MEF_OrderStateDiagram.png)

##API

This API is based on TMForum Order, and the Products included in the Order Items are Products that would result from applying the ONF Specification Pattern (minus JSON LD @context and @id). I.e. the TMForum Characteristic/Characteristic Value pattern is *not* used, and instead the attributes from the Product Specification (schema) are imbedded in the Product.

The Order API is described in [Order API](order-api.md)

The Order Status and Notification API is described in [Order Status and Notification API](order-status-and-notification-api.md)


##Additional Documentation

Endpoint definitions are provided in the /endpoints directory of this repository.
Json Schema definitions of the request and response payloads are provided in the /schemas directory of this repository.
Example payloads are included in the /example-data directory of this repository.
