```{r include=FALSE}
### ЭТО ДОЛЖНА БЫТЬ САМАЯ ПОСЛЕДНЯЯ ЧАСТЬ В ОТЧЕТЕ 
# здесь мы автоматически записываем изменения в git
# таким способом можно будет отслеживать все модификации расчетов
if(!git2r::in_repository()){
    # если мы не в репозитории, то создаем его
    git2r::init()
}
# задаем пользователя, от которого будем коммитить
git2r::config(user.name = "datamary", user.email = "datamary@admitad.com")
if(!file.exists(".gitignore")){
    # если не существует файла .gitignore, то создаем его
    writeLines(c(".Rproj.user", ".Rhistory", ".RData", ".Ruserdata", "data/", "secret"),
               ".gitignore")
}
# добавлляем все файлы для коммита
git2r::add(path = "*")
git_status = git2r::status()
# проверяем, есть ли что коммитить
if(length(git_status)>0){
    #  если есть что коммитить, то коммитим
    version = git2r::commit(message = paste("Autocommit", Sys.time()), all = TRUE)
} else {
    # если все по-старому, то в качестве версии берем последний коммит
    version = git2r::last_commit()
}
version = format(version)
```

###### Версия `r version` # тут надо добавить буковку r