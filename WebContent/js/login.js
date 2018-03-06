"use strict";
function loginSubmit() {
    var username = document.getElementById('login_username').value;
    var password = document.getElementById('login_password').value;
    var login_code = document.getElementById('login_code').value;
    if (!checkInvalidCharacters(username)) {
        alert('用户名包含非法字符或为空或超过20个字符');
        document.getElementById('login_username').value = "";
        document.getElementById('login_password').value = "";
    } else {
        if (!checkInvalidCharacters(password)) {
            alert('密码包含非法字符或为空');
            document.getElementById('login_username').value = "";
            document.getElementById('login_password').value = ""
        } else {
            return true
        }
    }
    return false
}

function signup() {
    document.getElementById('login').style.display = "none";
    document.getElementById('signup').style.display = "block";
    document.getElementById('title').innerHTML = "会员注册";
    return false
}

function signupSubmit() {
    var username = document.getElementById('signup_username').value;
    var password = document.getElementById('signup_password').value;
    var password_confirm = document.getElementById('signup_password_confirm').value;
    var signup_code = document.getElementById('signup_code').value;
    if (!checkInvalidCharacters(username)) {
        alert('用户名包含非法字符或为空或超过20个字符');
        document.getElementById('signup_username').value = "";
        document.getElementById('signup_password').value = "";
        document.getElementById('signup_password_confirm').value = ""
    } else {
        if (!checkInvalidCharacters(password)) {
            alert('密码包含非法字符或为空');
            document.getElementById('signup_password').value = "";
            document.getElementById('signup_password_confirm').value = ""
        } else {
            if (password !== password_confirm) {
                alert('两次密码不匹配');
                document.getElementById('signup_password_confirm').value = ""
            } else {
                return true
            }
        }
    }
    return false
}

function checkInvalidCharacters(x) {
    if (x.length > 0 && x.length < 20) {
        var str = "~`!#$%^&*()+={}[]:;\"'<>,.?/ ";
        for (var i = 0; i < str.length; i++) {
            if (x.indexOf(str[i]) > -1) {
                return false
            }
        }
    } else {
        return false
    }
    return true;
}

function code(x) {
    x.src = "code.jsp?seed=" + new Date().getMilliseconds();
}