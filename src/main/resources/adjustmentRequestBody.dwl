%dw 2.0
output application/json
---
{
	variables: {
	    "input": {
	        inventoryLevelId: payload.id,
	        availableDelta: sum(vars.erpData[0].INVENTORY.ON_HAND map ($ as Number)) - payload.available
	    }
	},
	query: "
mutation inventoryAdjustQuantity(\$input: InventoryAdjustQuantityInput!) {
  inventoryAdjustQuantity(input: \$input) {
    inventoryLevel {
      id
    }
    userErrors {
      field
      message
    }
  }
}
	"
}