/*1. Készítsünk nézetet VSZOBA néven, amely megjeleníti a szobák adatai mellett a megfelelő szálláshely nevét, helyét és a csillagok számát is!

Az oszlopoknak nem szükséges külön nevet adni!
Teszteljük is a nézetet, pl: SELECT * FROM UJAENB_VSZOBA*/

CREATE OR ALTER VIEW VSZOBA
AS
SELECT sz.*,
		szh.SZALLAS_NEV,
        szh.HELY,
        szh.CSILLAGOK_SZAMA
FROM Szoba sz JOIN Szallashely szh ON sz.SZALLAS_FK=szh.SZALLAS_ID


/*2 Készítsen tárolt eljárást SPUgyfelFoglalasok, amely a paraméterként megkapott ügyfél azonosítóhoz tartozó foglalások adatait listázza!
Teszteljük a tárolt eljárás működését, pl: EXEC UJAENB_SPUgyfelFoglalasok 'laszlo2'
*/

CREATE OR ALTER PROC SPUgyfelFoglalasok
@ugyfel nvarchar(100)
AS 
BEGIN
	SELECT *
    FROM Foglalas
    WHERE ugyfel_fk= @ugyfel
END

/*
3. Készítsen skalár értékű függvényt UDFFerohely néven, amely visszaadja, hogy a paraméterként megkapott foglalás azonosítóhoz hány férőhelyes szoba tartozik!
a. Teszteljük a függvény működését!
*/

CREATE OR ALTER FUNCTION UDFFerohely
(
  @foglalasazon int
)
RETURNS int
AS
BEGIN
	declare @f int
    SELECT @f = sz.FEROHELY
	SELECT sz.FEROHELY
    FROM Foglalas f JOIN Szoba sz ON f.SZOBA_FK=sz.SZOBA_ID
    WHERE f.FOGLALAS_PK = @foglalasazon
	RETURN @f
END