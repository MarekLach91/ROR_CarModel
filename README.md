# CarModel

Biblioteka do nauki pracy na RESTowych kontrolerach.

## Instalacja

Dodaj tę linijkę do Gemfile'a swojej aplikacji:

```ruby
gem 'car_model', github: 'coderslab/ror_car_model'
```

## Instrukcja

* `.all` zwraca listę wszystkich aut w bazie w tablicy (Podpowiedź: po tablicy możesz iterować)
* `.first` zwraca pierwsze auto z bazy
* `.last` zwraca ostatnie auto z bazy
* `.find(id)` zwraca auto o `id=#{ID}` z bazy

## Testy

Testy uruchamiamy poprzez:

```
rake
```

## RuboCop

Rubocopa uruchamiamy poprzez:

```
rake rubocop
```
