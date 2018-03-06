"use strict";
function valuePlus(x) {
    var val = document.getElementById('value' + x);
    if (val.value === "") {
        val.value = 1;
    } else {
        val.value = val.value * 1 + 1;
    }
    check(document.getElementById('value' + x))
}

function valueMinus(x) {
    var val = document.getElementById('value' + x);
    if (val.value <= 1 || val.value === "") {
        val.value = "1";
    } else {
        val.value -= 1;
    }
    check(document.getElementById('value' + x))
}

function check(x) {
    if (x.value.length > 3 || !(typeof (parseInt(x.value)) === 'number' && x.value % 1 === 0) || x.value == 0) {
        x.value = "1"
    }
}

function del(x) {
    window.location.href = "cart?id=" + x + "&del=1";
}

function save(x) {
    window.location.href = "cart?id=" + x + "&update=" + document.getElementById('value' + x).value;
}