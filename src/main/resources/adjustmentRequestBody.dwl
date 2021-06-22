%dw 2.0
output application/json
---
{
	inventory_item_id: payload.inventoryItemID as Number,
	available_adjustment: sum(vars.erpData[0].INVENTORY.ON_HAND map ($ as Number)) - payload.available,
	location_id: payload.locationId as Number
}