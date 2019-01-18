# Библиотека `crypto` для шифрования в OScript

[![Stars](https://img.shields.io/github/stars/khorevaa/crypto.svg?label=Github%20%E2%98%85&a)](https://github.com/khorevaa/crypto/stargazers)
[![Release](https://img.shields.io/github/tag/khorevaa/crypto.svg?label=Last%20release&a)](https://github.com/khorevaa/crypto/releases)
[![Открытый чат проекта https://gitter.im/EvilBeaver/oscript-library](https://badges.gitter.im/khorevaa/crypto.png)](https://gitter.im/EvilBeaver/oscript-library)

[![Build Status](https://travis-ci.org/khorevaa/crypto.svg?branch=master)](https://travis-ci.org/khorevaa/crypto)
[![Coverage Status](https://coveralls.io/repos/github/khorevaa/crypto/badge.svg?branch=master)](https://coveralls.io/github/khorevaa/crypto?branch=master)

## Возможности

> Короткое название `crypto`

Данная библиотека предназначена для выполнения шифрования в OScript.
Реализует 
 * модуль:
   * `Шифрование` - основной модуль содержит доступные алгоритмы шифрования (реализованы `HMAC`) 
 * классы: 
   * `JWT` - реализация токенов JWT c шифрованием `HMAC` и алгоритмом сумм `HS256`

## Требования

   * OScript  >= 1.0.21

## Установка

Для установки необходимо:
* Скачать файл crypto*.ospx из раздела [releases](https://github.com/khorevaa/crypto/releases)
* Воспользоваться командой:

```
opm install -f <ПутьКФайлу>
```
или установить с хаба пакетов

```
opm install crypto
```

## Пример работы

* Создание токена `JWT`
```bsl

	jwt = новый jwt;
	КлючШифрования = "secret";
	ДанныеКлюча = Новый Структура;
	ДанныеКлюча.Вставить("sub", "1234567890");
	ДанныеКлюча.Вставить("name", "John Doe");
	ДанныеКлюча.Вставить("admin", True);
	
	Токен = jwt.Кодировать(КлючШифрования, ДанныеКлюча);
	
	РасшифрованныеДанные = jwt.Декодировать(Токен, КлючШифрования);

	Ожидаем.Что(РасшифрованныеДанные.sub, "Расшифрованные данные sub должны совпадать").Равно(ДанныеКлюча.sub);
	Ожидаем.Что(РасшифрованныеДанные.name, "Расшифрованные данные name должны совпадать").Равно(ДанныеКлюча.name);
	Ожидаем.Что(РасшифрованныеДанные.admin, "Расшифрованные данные sub должны совпадать").Равно(ДанныеКлюча.admin);

```

* Шифрование по алгоритму `HMAC`
```bsl

    РезультатШифрования = Шифрование.HMAC(
                    GetBinaryDataFromString("Секретный ключ"),
                    GetBinaryDataFromString("Данные для шифрования"),
                    HashFunction.SHA256);

```


## Публичный интерфейс

[Документация публичного интерфейса (в разработке)](docs/README.md)

## Доработка

Доработка проводится по git-flow. Жду ваших PR.

## Лицензия

Смотри файл [`LICENSE`](LICENSE).