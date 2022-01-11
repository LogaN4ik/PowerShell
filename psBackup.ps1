Clear-Host
$current_day = Get-Date -UFormat "%d.%m.%y"
$current_time = Get-Date -UFormat "%H-%M"
$dir_to_backup = Get-Content -Path "G:\Plan\ОПБиК\2\Скрипты\BackUp\ver3\to_backup.txt" #путь к txt где с каждой новой строки путь к бекап файлам
$dir_to_save = "C:\My\Scripts\Backup\EveryHourBackUp\$current_day\"                    #путь куда сохранаяем бекапы
$path_to_archive = $dir_to_save+$current_time
$temp_dir = "C:\My\Scripts\Backup\EveryHourBackUp\temp\"                               #временный путь, в который копируем файлы, дабы избежать ошибки что процесс занят

#Проверяем наличие и создаем если отсутствуют директории
If(!(test-path $temp_dir)){New-Item -ItemType Directory -Force -Path $temp_dir}
If(!(test-path $dir_to_save)){New-Item -ItemType Directory -Force -Path $dir_to_save}

#Копируем наши бекапы во временный каталог
Copy-Item -Path $dir_to_backup -Destination $temp_dir -Force

#архивируем временный каталог и удаляем его
Compress-Archive -Path $temp_dir -DestinationPath ($path_to_archive) -CompressionLevel Optimal -Force
Remove-item $temp_dir -Recurse
