# add-tags - Мини-приложение по добаужлению и удалению тэгов

[Макет](https://www.figma.com/file/xfRZ6MHiLNO9BSUN9uVhnN/iOS-%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D1%8F?type=design&node-id=0-1&mode=design&t=baN0ybNeb4z1AJ1j-0) проекта.

<img src="/Source/1. Screen.png" height="450">
<img src="/Source/2. Animation.gif" height="450">
<img src="/Source/3. Cell.gif" height="450">

### Состав экрана
1. Заголовок “Профиль”.
2. Фотография пользователя (хардкод).
3. Девиз пользователя, краткая информация. Лейбл ограничен двумя строчками, длинный текст обрезается троеточием. Значение - хардкод.
4. Место жительства пользователя. Ограничен одной строкой, длинный текст обрезается троеточием. Значение - хардкод.
5. Заголовок “Мои навыки” и кнопка режима редактирования. Иконка “карандашика” для входа в режим редактирования, иконка “галочки” для сохранения изменений.
6. Блок мои навыки. Может редактироваться пользователем. Ограничение высоты ячейки одной строкой. Максимальная ширина ячейки ограничена шириной экрана минус боковые отступы. Количество ячеек (навыков) в
разделе не ограничено. Если текст не помещается, он сокращается троеточием.
В режиме редактирования на каждую ячейку с навыком добавляется крестик, по нажатию на который, навык удаляется. Также добавляется ячейка с плюсиком, по нажатию на которую, добавляется новый навык. Навык вводится через нативную Alert View.
7. О себе. Текстовый блок. Количество строк не ограничено. Значение - хардкод.