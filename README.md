# swift3-tableview-issue

## 原因
swift3在iOS8下，heightForRowAt 方法里少最新加入的indexPath

## 解决方法
tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)返回 1，numberOfSections(in tableView: UITableView) -> Int 返回具体的数目
