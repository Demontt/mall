function add(x, y) {
    var brand = GetQueryString('brand');
    var taste = GetQueryString('taste');
    var city = GetQueryString('city');
    var sort = GetQueryString('sort');
    var low = GetQueryString('low');
    var high = GetQueryString('high');
    var price = '&low=' + low + '&high=' + high;
    var k = GetQueryString('k');
    if (x === 'brand') {
        brand = y;
    }
    if (x === 'taste') {
        taste = y;
    }
    if (x === 'city') {
        city = y;
    }
    if (x === 'sort') {
        sort = y;
    }
    if (x === 'price') {
        price = y;
    }
    var url = 'page.jsp?k=' + k + '&brand=' + brand + '&taste=' + taste + '&city=' + city + '&sort=' + sort + price;
    window.location.href = url;
}

function init(x) {
    var brand = GetQueryString('brand');
    var taste = GetQueryString('taste');
    var city = GetQueryString('city');
    var sort = GetQueryString('sort');
    var low = GetQueryString('low');
    var high = GetQueryString('high');
    var price = '&low=' + low + '&high=' + high;
    var k = GetQueryString('k');
    if (x === 'brand') {
        brand = null;
    }
    if (x === 'taste') {
        taste = null;
    }
    if (x === 'city') {
        city = null;
    }
    if (x === 'sort') {
        sort = null;
    }
    var url = 'page.jsp?k=' + k + '&brand=' + brand + '&taste=' + taste + '&city=' + city + '&sort=' + sort + price;
    window.location.href = url;
}

function sortBy(x, y) {
    if (y === 'off') {
        init('sort')
    } else {
        add('sort', x)
    }
}

function submit() {
    var lowprice = document.getElementById('lowprice');
    var upprice = document.getElementById('upprice');
    var flag1 = check(lowprice);
    var flag2 = check(upprice);
    var flag3 = parseInt(lowprice.value) <= parseInt(upprice.value);
    if (!(flag1 & flag2 & flag3)) {
        document.getElementById('errText').innerHTML = "输入不正确！";
        lowprice.value = "";
        upprice.value = "";
    } else {
        add('price', '&low=' + lowprice.value + '&high=' + upprice.value)
    }
}

function check(x) {
    return !(x.value.length > 3 || !(typeof (parseInt(x.value)) === 'number' && x.value % 1 === 0) || x.value <= 0);

}

function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return decodeURIComponent(r[2]);
    return null;
}