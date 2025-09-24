@echo off
:: Получаем путь к папке, где лежит батник (без имени файла)
set "folderPath=%~dp0"

:: Записываем путь в файл folder_path.txt в той же папке
echo %folderPath% > "%folderPath%folder_path.txt"

echo Folder path saved to %folderPath%folder_path.txt
pause