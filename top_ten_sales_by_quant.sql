select top 10 p.ProductName, sum(od.Quantity) as [total sales] from dbo.[Order Details] od
inner join dbo.Products p on od.ProductID = p.ProductID
group by p.ProductName
order by [total sales] desc
