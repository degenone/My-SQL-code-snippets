CREATE CLUSTERED INDEX [_dta_index_Order DetailsTemp1_c_5_663673412__K1_K2] ON [dbo].[Order DetailsTemp1]
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
---
CREATE STATISTICS [_dta_stat_663673412_1_2] ON [dbo].[Order DetailsTemp1]([OrderID], [ProductID])
---
CREATE CLUSTERED INDEX [_dta_index_OrdersTemp1_c_5_647673355__K1] ON [dbo].[OrdersTemp1]
(
	[OrderID] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
---
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [_dta_index_OrdersTemp1_5_647673355__K12] ON [dbo].[OrdersTemp1]
(
	[ShipRegion] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
---
CREATE STATISTICS [_dta_stat_647673355_1_7] ON [dbo].[OrdersTemp1]([OrderID], [ShipVia])
---
CREATE STATISTICS [_dta_stat_647673355_2_1] ON [dbo].[OrdersTemp1]([CustomerID], [OrderID])
---
CREATE STATISTICS [_dta_stat_647673355_2_3_7] ON [dbo].[OrdersTemp1]([CustomerID], [EmployeeID], [ShipVia])
---
CREATE STATISTICS [_dta_stat_647673355_3_1] ON [dbo].[OrdersTemp1]([EmployeeID], [OrderID])
---
CREATE STATISTICS [_dta_stat_647673355_3_12] ON [dbo].[OrdersTemp1]([EmployeeID], [ShipRegion])
