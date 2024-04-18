#!/bin/bash

############################################
在保证polkit服务正常和polkit-gnome服务自启动的情况下
请直接应用下面第三个方法，复制粘贴即可
############################################


# https://wiki.archlinux.org/title/Polkit
# 提供图形化下的权限提升：弹窗认证，很有用。
# 安装其中一个热门桌面的包，然后启动

#建议使用gnome的，这个服务一直运行，sudo pacman -S polkit-gnome
#ked的每运行一次必须重新运行程序
#将安装的程序路径

################ polkit-gnome自启动 ###########################
#通过在i3配置文件中配置自启动 exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
################ polkit-gnome 快捷启动
#使用此执行文件在/usr/bin/polkit-gnome 下执行
#!/bin/bash
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1


#######################
以下操作在中一共安装了 polkit     //是 PolicyKit 的核心组件
                   polkit-gnome //是一个用于 GNOME 桌面环境的 PolicyKit 认证代理，提供了一个与 GNOME 桌面环境集成的图形化界面，用于处理系统中需要管理员权限的操作的身份验证。
        两个并不冲突，因为他们分别负责不同的功能
#######################

#############polkit配置详解
配置文件：/usr/share/polkit*(rules.d // actions)
程序路径: /usr/lib/polkit*

rules.d     用于定义授权规则，以确定用户或用户组对特定操作的访问权限。
actions     对系统资源执行操作的行为。通过定义这些操作，可以为特定的操作创建授权策略，以确定哪些用户或用户组有权执行这些操作，以及在执行这些操作时需要什么样的身份验证。

在执行clash时不用多次输入密码的方法：
1.在rules.d 文件中配置49-nopasswd_global.rules
    /etc/polkit-1/rules.d/49-nopasswd_global.rules
    /* Allow members of the wheel group to execute any actions
    * without password authentication, similar to "sudo NOPASSWD:"
    */
    polkit.addRule(function(action, subject) {
        if (subject.isInGroup("wheel")) {
            return polkit.Result.YES;
        }
    });
    如此，这个组的所有成员在干什么时都不需要输入密码了

2.在actions中找到在程序运行时所需要的操作，
    clash所需要的操作为：
        启动时：
            org.freedesktop.resolve1.policy
                    id="org.freedesktop.resolve1.set-default-route"
                    id="org.freedesktop.resolve1.set-dns-servers"
                    id="org.freedesktop.resolve1.set-domains"
        授权内核权限时：
            org.freedesktop.policykit.policy
                id="org.freedesktop.policykit.exec"
    将以上文件及文件中的条目中defaults中
    allow_any,allow_inactive,allow_active都设置为yes，
    即可实现这些操作不需要输入密码直接运行。

3. 推荐第三种方式。为arch wiki中方式    ################################################直接使用这个方法
    同样为创建一个rules，（以下为以正常使用文件）

        /* Allow members of the wheel group to execute the defined actions
        * without password authentication, similar to "sudo NOPASSWD:"
        */
        polkit.addRule(function(action, subject) {
            if ((action.id == "org.freedesktop.resolve1.set-default-route" ||    //可加入多个操作的id,比如以上列举的id
            action.id == "org.freedesktop.resolve1.set-dns-servers" ||
            action.id == "org.freedesktop.resolve1.set-domains" ||
            action.id == "org.freedesktop.policykit.exec"
            ) && (subject.isInGroup("wheel") || subject.user=="rjn"))
            {
                return polkit.Result.YES;
            }
        });

        如此，这个组的所有成员在干什么时都不需要输入密码了


#扩展  allow_*  的允许模式
    no：用户无权执行该操作。因此不需要进行身份验证。
    yes：用户有权执行该操作，无需任何身份验证。
    auth_self：需要身份验证，但用户不必是管理用户。
    auth_admin：需要作为管理用户进行身份验证。
    auth_self_keep：与 auth_self 相同，但与 sudo 一样，授权持续几分钟。
    auth_admin_keep：与 auth_admin 相同，但与 sudo 一样，授权持续几分钟。