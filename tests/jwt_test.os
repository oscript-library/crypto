#использовать "../src"
#Использовать asserts
#Использовать logos

Перем юТест;

Функция ПолучитьСписокТестов(Знач Тестирование) Экспорт

	юТест = Тестирование;

	ИменаТестов = Новый Массив;

	ИменаТестов.Добавить("ТестДолжен_ПроверитьРаботуКласса");


	Возврат ИменаТестов;

КонецФункции

Процедура ТестДолжен_ПроверитьРаботуКласса() Экспорт

	jwt = новый jwt;
	SecretKey = "secret";
	Payload = New Structure;
	Payload.Insert("sub", "1234567890");
	Payload.Insert("name", "John Doe");
	Payload.Insert("admin", True);
	
	Token = jwt.Encode(SecretKey, Payload);
	
	DecodedPayload = jwt.Decode(Token, SecretKey);

	Сообщить(DecodedPayload.sub);

КонецПроцедуры




