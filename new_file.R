# здесь я просто тестировал, что новые файлы будут добавляться в историю
# таким способом можно будет отслеживать все модификации расчетов
if(!git2r::in_repository()){
    # если мы не в репозитории, то создаем его
    git2r::init()
}
# задаем пользователя, от которого будем коммитить
git2r::config(user.name = "user", user.email = "user@email.com")
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
    commit_info = git2r::commit(message = paste("Autocommit", Sys.time()), all = TRUE)
} else {
    # если все по-старому, то в качестве версии берем последний коммит
    commit_info = git2r::last_commit()
}
commit_info = format(commit_info)
cat("Версия", commit_info, "\n")
