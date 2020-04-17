-- SKRYPT NAPISANY PRZEZ MILOMARA :)
Config                            = {}
Config.Lickabron                  = true  -- jezeli true to skrypt bedzie losowac czy na nowym dowodzie masz miec licencje na bron (jezeli dasz na false to nigdy nie bedziesz mial "zielonej" licki w dowodzie)
Config.PrawoJazdy                 = true  -- jezeli true to skrypt bedzie losowac czy na nowym dowodzie masz miec licencje na prawo jazdy (bedzie losowac kategorie) (jezeli dasz na false to nigdy nie bedziesz mial "zielonego" prawka w dowodzie)
Config.NNW                        = true  -- jezeli true to skrypt bedzie losowac czy na nowym dowodzie masz miec ubezpieczenie NNW (bedzie losowac czy masz miec czy też nie)

Config.CenaKupno                  = 5000  -- cena kupna dowodu
Config.CenaUsuniecie              = 5000  -- cena usuniecia z bazy danych handlarza

Config.SzansaLickaBron            = 50    -- ile masz % szans na wylosowanie licencji na broń (działa tylko w momencie gdy Config.LickaBron = true)
Config.SzansaNNW                  = 50    -- ile masz % szans na wylosowanie ubezpieczenia NNW (działa tylko w momencie gdy Config.NNW = true)

-- UWAGA! Aby zmienić prawdopodobieństwo wylosowania kategorii prawa jazdy, sprawdź server.lua linijki 220-236