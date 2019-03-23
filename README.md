# A beadandóhoz használandó programozási nyelv leírása (While, 2019 tavasz)

A félév során az alábbi programozási nyelvhez kell fordítóprogramot írni `flex` és `bisonc++` segítségével.
A nyelv az oktatási célokra gyakran felhasznált While nyelv egy változata.
Az alábbi példaprogram a bemeneten kapott nemnegatív egész szám legkisebb valódi osztóját számolja ki.

````While
program oszto
  natural a;
  natural i;
  natural oszto;
  boolean vanoszto;
begin
  read( a );
  vanoszto := false;
  i := 2;
  while not vanoszto and i < a do
    if a mod i = 0 then
      vanoszto := true;
      oszto := i;
    endif
    i := i+1;
  done
  if vanoszto then
    write( vanoszto );
    write( oszto );
  else
    write( vanoszto );
  endif
end
````

## A nyelv definíciója

### Karakterek

A forrásfájlok a következő ASCII karaktereket tartalmazhatják:
- az angol abc kis és nagybetűi
- számjegyek (0-9)
- ():+-*<>=_;#
- szóköz, tab, sorvége
- megjegyzések belsejében pedig tetszőleges karakterek állhatnak

Minden más karakter esetén hibajelzést kell adnia a fordítónak, kivéve megjegyzések belsejében, mert ott tetszőleges karakter megengedett. A nyelv case-sensitive, azaz számít a kis és nagybetűk közötti különbség.

### Kulcsszavak

A nyelv kulcsszavai a következők: `program`, `begin`, `end`, `natural`, `boolean`, `true`, `false`, `div`, `mod`, `and`, `or`, `not`, `skip`, `if`, `then`, `else`, `elseif`, `endif`, `while`, `do`, `done`, `read`, `write`

### Azonosítók

A változók nevei betűkből, számjegyekből és _ jelből állhatnak, betűvel kell kezdődniük, és nem ütközhetnek egyik kulcsszóval sem.

### Típusok

- `natural`: négy bájtos, előjel nélküli egészként kell megvalósítani; konstansai számjegyekből állnak és nincs előttük előjel
- `boolean`: egy bájton kell ábrázolni; értékei: false, true

### Megjegyzések

A `#` karaktertől kezdve a következő `#` karakterig. Megjegyzések a program tetszőleges pontján előfordulhatnak, és tetszőleges számú sorra kiterjedhetnek. A fordítást és a keletkező programkódot nem befolyásolják.
