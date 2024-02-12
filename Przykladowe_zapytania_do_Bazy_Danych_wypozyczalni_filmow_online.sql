SELECT gatunek.nazwa_gatunku, AVG(filmy.dlugosc) AS srednia_dlugosc
FROM filmy
JOIN film_gatunek ON filmy.id_filmu = film_gatunek.id_filmu
JOIN gatunek ON film_gatunek.id_gatunku = gatunek.id_gatunku
GROUP BY gatunek.nazwa_gatunku;

SELECT filmy.tytul, rezyserzy.nazwisko_rezysera, dystrybutorzy.nazwa_dystrybutora
FROM filmy
JOIN rezyserzy ON filmy.id_rezysera = rezyserzy.id_rezysera
JOIN dystrybutorzy ON filmy.id_dystrybutora = dystrybutorzy.id_dystrybutora;

SELECT klienci.imie_klienta, klienci.nazwisko_klienta, COUNT(wypozyczenia.id_wypozyczenia) AS liczba_wypozyczen
FROM klienci
JOIN wypozyczenia ON klienci.id_klienta = wypozyczenia.id_klienta
GROUP BY klienci.imie_klienta, klienci.nazwisko_klienta
ORDER BY liczba_wypozyczen DESC;

SELECT filmy.tytul, AVG(recenzje.ocena) AS srednia_ocena
FROM filmy
JOIN recenzje ON filmy.id_filmu = recenzje.id_filmu
GROUP BY filmy.tytul
ORDER BY srednia_ocena DESC
LIMIT 5;

SELECT filmy.tytul
FROM filmy
LEFT JOIN wypozyczenia ON filmy.id_filmu = wypozyczenia.id_filmu
WHERE wypozyczenia.id_wypozyczenia IS NULL;

