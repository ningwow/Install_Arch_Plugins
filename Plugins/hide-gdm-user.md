在登录列表中隐藏用户
gdm 用户列表的用户由它会自动隐藏系统用户（UID < 1000）。 要从登录列表中隐藏普通用户，请创建或编辑一个以用户命名的文件，并将其保存在 /var/lib/AccountsService/users/ 中，随之隐藏该文件。文件至少应包含：


```bash
/var/lib/AccountsService/users/username
[User]
SystemAccount=true
```