-- 1. Consultar el supermercado que tenga más cantidad de productos con el tipo “CARNICOS” que han vendido hasta la fecha 31 de diciembre del 2013 retornando el nombre del supermercado, la cantidad, la descripción del tipo de supermercado y la fecha de venta.
SELECT S.NOMBRE_SUPERMERCADO, 
       F.CANTIDAD, 
       TP.DESCRIPCION_TIPO, 
       F.FECHA_VENTE
FROM FACTURA F
JOIN PRODUCTO P ON F.ID_PRODUCTO = P.ID_PRODUCTO
JOIN TIPO_PRODUCTO TP ON P.ID_TIPO_PRODUCTO = TP.ID_TIPO_PRODUCTO
JOIN VENDEDOR V ON F.ID_VENDEDOR = V.ID_VENDEDOR
JOIN SUPERMERCADO S ON V.ID_SUPERMERCADO = S.ID_SUPERMERCADO
WHERE TP.DESCRIPCION_TIPO = 'Carnicos' 
  AND F.FECHA_VENTE <= '2013-12-31'
ORDER BY F.CANTIDAD DESC
LIMIT 1;

-- 2. Seleccionar los clientes que compran en el SUPERMERCADO “Exito” cuya compra supera los $150.000 mil peso e imprimir todos los datos del cliente más el nombre del supermercado y el valor de venta, y ordenarlos descendentemente

SELECT C.*, S.NOMBRE_SUPERMERCADO, F.VALOR_VENTA
FROM FACTURA F
JOIN CLIENTE C ON F.ID_CLIENTE = C.ID_CLIENTE
JOIN VENDEDOR V ON F.ID_VENDEDOR = V.ID_VENDEDOR
JOIN SUPERMERCADO S ON V.ID_SUPERMERCADO = S.ID_SUPERMERCADO
WHERE S.NOMBRE_SUPERMERCADO = 'Exito'
  AND F.VALOR_VENTA > 150000
ORDER BY F.VALOR_VENTA DESC;

-- Construir la consulta que permita conocer las ventas totales de cada vendedor en cada SUPERMERCADO, retornando el nombre del vendedor, SUPERMERCADO y valor total de ventas por cada vendedor ordenado descendentemente por valor

SELECT V.NOMBRE_VENDEDOR, 
       S.NOMBRE_SUPERMERCADO, 
       SUM(F.VALOR_VENTA) AS TOTAL_VENTAS
FROM FACTURA F
JOIN VENDEDOR V ON F.ID_VENDEDOR = V.ID_VENDEDOR
JOIN SUPERMERCADO S ON V.ID_SUPERMERCADO = S.ID_SUPERMERCADO
GROUP BY V.NOMBRE_VENDEDOR, S.NOMBRE_SUPERMERCADO
ORDER BY TOTAL_VENTAS DESC;

-- Consultar las facturas cuyo valor es superior a $100.000 pesos y el código del vendedor sea el 3, retornando el número de la factura, el valor de la factura y el nombre del vendedor

SELECT F.NUMERO_FACTURA, 
       F.VALOR_VENTA, 
       V.NOMBRE_VENDEDOR
FROM FACTURA F
JOIN VENDEDOR V ON F.ID_VENDEDOR = V.ID_VENDEDOR
WHERE F.VALOR_VENTA > 100000 
  AND V.ID_VENDEDOR = 3;
