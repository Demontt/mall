"use strict";
function valuePlus() {
    var val = document.getElementById('value');
    if (val.value === "") {
        val.value = 1;
    } else {
        val.value = val.value * 1 + 1;
    }
    check(document.getElementById('value'))
}

function valueMinus() {
    var val = document.getElementById('value');
    if (val.value <= 1 || val.value === "") {
        val.value = "1";
    } else {
        val.value -= 1;
    }
    check(document.getElementById('value'))
}

function check(x) {
    if (x.value.length > 3 || !(typeof (parseInt(x.value)) === 'number' && x.value % 1 === 0) || x.value == 0) {
        document.getElementById('errText').innerHTML = "输入不正确！";
        x.value = "1"
    } else {
        if (parseInt(x.value) > parseInt(document.getElementById('amount').innerHTML)) {
            document.getElementById('errText').innerHTML = "超出库存！";
            x.value = "1"
        } else {
            document.getElementById('errText').innerHTML = "";
        }
    }
}

function valueSubmit(x) {
    window.location.href = "cart?id=" + x + "&amount=" + document.getElementById('value').value;
}