CREATE user dorkakovacs without login
grant SELECT ON Vendeg to dorkakovacs
execute As user = 'dorkakovacs'
SELECT * FROM Vendeg
revert
SELECT * FROM Vendeg