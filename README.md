# Тестовое задание. Приложение погоды

## Сборка приложения: 
###  Cocoapods: 
```bash
pod install
```

### Внешние зависимости:
Realm - локальная дб
Swinject - реализация DI
Kingfisher - асинхронная загрузка картинок

## Архитектура:
MVC с тонкими вьюконтроллерами и UI в отдельных view.

## Примерное время реализации:
8 часов

## Возникшие проблемы:
Документация API OpenWeather


## ТЗ
ПРИЛОЖЕНИЕ
Прогноз погоды
Необходимо разработать мобильное приложение с отображением прогноза погоды. Основная задача: использование публичного API (например, openweathermap), минимальная верстка (кодом или с использованием xib/storyboards файлов), допускается использование необходимых библиотек (cocoapods, carthage, spm), архитектура (MVC, MVP, MVVM, Clean Swift) на выбор исполнителя.
Данное приложение должно состоять из:
1. Запрос разрешения отслеживать местоположение пользователя.
2. Таб бар с отображением одной вкладки (Main), где будет отображаться текущий населенный пункт пользователя, текущая температура в Цельсиях и минимальный комментарий-совет от исполнителя. Возможно ограничиться рекомендациями:
- температура меньше 0 градусов;
- температура от 0 до 15 градусов;
- температура выше 15 градусов; - осадки;
3. Возможность изменения населенного пункта. (В случае, если пользователь хочет увидеть текущую погоду в другом городе).
4. Обработка состояния, когда пользователь запретил доступ к местоположению.
5. Добавить в таб бар дополнительную вкладку (Forecast), в которой отобразить прогноз погоды для данного населенного пункта в виде таблицы на несколько дней.
6. Хранение прогноза погоды и отображение в оффлайн режиме.
7. Реализовать на экране Main дополнительно отображение иконки текущей погоды.
8. Ограничиться минимальным набором сторонних библиотек (по возможности).
9. Приложение должно быть максимально близко к production-состоянию.
При разработке проекта следует использовать XCode версии не ниже 11.0, Swift не
ниже 5.0 и минимальную версию iOS 12.0. Проект необходимо оформить в репозиторий (github, gitlab, bitbucket) и сопроводить минимальным описанием (выбор архитектуры, сторонних библиотек, возможными проблемами в реализации и указанием затраченного времени на выполнение).
