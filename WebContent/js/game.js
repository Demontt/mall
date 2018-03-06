'use strict';
var gameLevel = 14;
var colorsCount = 7;
var colors = [
    '#000000',
    '#f8c1c1',
    '#fde9a0',
    '#bae3dd',
    '#acc4f7',
    '#f8c9ed',
    '#aedff3',
    '#62befd'
];

var img = [
    'img/game/00.jpg',
    'img/game/01.jpg',
    'img/game/02.jpg',
    'img/game/03.jpg',
    'img/game/04.jpg',
    'img/game/05.jpg',
    'img/game/06.jpg',
    'img/game/07.jpg'
]

var values = [];
var score = 0;

window.onresize = function () {
    showGame();
};

function newGame() {
    score = 0;
    document.getElementById('score').innerHTML = score + '.00';
    for (var i = 0; i < gameLevel; i++) {
        values[i] = [];
        for (var j = 0; j < gameLevel; j++) {
            values[i][j] = getRand()
        }
    }
    // debug()
    showGame()
}

function debug() {
    for (var i = 0; i < gameLevel; i++) {
        for (var j = 0; j < gameLevel; j++) {
            console.log(values[i][j])
        }
    }
}

function showGame() {
    if (values[0] === 0) {
        return
    }
    document.getElementById('game').innerHTML = '';
    for (var i = 0; i < gameLevel; i++) {
        for (var j = 0; j < gameLevel; j++) {
            document.getElementById('game').appendChild(newBlock(values[i][j], i, j))
        }
        document.getElementById('game').appendChild(document.createElement('br'))
    }
}
function getRand() {
    return Math.floor(Math.random() * colorsCount + 1)
}
function getColor(x) {
    return colors[x]
}
function getImg(x) {
    return img[x]
}
function newBlock(color, i, j) {
    var node = document.createElement('div');
    node.innerHTML = color;
    node.setAttribute('class', 'block');
    node.setAttribute('onclick', 'check(' + i + ', ' + j + ')');
    node.style.backgroundColor = getColor(color);
    node.style.color = getColor(color + 1);
    var length = document.getElementById('game').offsetHeight;
    node.style.width = length / gameLevel * 0.85 + 'px';
    node.style.height = length / gameLevel * 0.85 + 'px';
    node.style.borderWidth = length / gameLevel * 0.01 + 'px';
    node.innerHTML = '<img style="margin: 0px;padding: 0px" src=' + getImg(color) + ' height="' + node.style.width + '" width="' + node.style.height + '" />';
    return node
}
function check(i, j) {
    var s = dfs(i, j, values[i][j]);
    if (s >= 2) {
        update(s)
    } else {
        undo()
    }
}

function dfs(i, j, verify) {
    if (i < 0 || i >= gameLevel || j < 0 || j >= gameLevel || verify === 0) {
        return 0
    } else {
        if (values[i][j] === verify) {
            values[i][j] = -verify;
            return 1 + dfs(i + 1, j, verify) + dfs(i - 1, j, verify) + dfs(i, j + 1, verify) + dfs(i, j - 1, verify);
        } else {
            return 0
        }
    }
}

function undo() {
    for (var i = 0; i < gameLevel; i++) {
        for (var j = 0; j < gameLevel; j++) {
            if (values[i][j] < 0) {
                values[i][j] = -values[i][j]
            }
        }
    }
}

function update(s) {
    score += s * s * 5 * 0.001;
    var score_show = score.toString().substr(0, 4);
    if (score_show.length === 3) {
        score_show += '0'
    }
    document.getElementById('score').innerHTML = score_show;
    for (var j = 0; j < gameLevel; j++) {
        for (var i = gameLevel - 1; i > 0; i--) {
            if (values[i][j] < 0) {
                for (var k = i; k > 0; k--) {
                    values[k][j] = values[k - 1][j]
                }
                values[0][j] = 0;
                if (values[i][j] < 0) {
                    i++
                }
            }
        }
        if (values[0][j] < 0) {
            values[0][j] = 0
        }
    }
    for (j = 0; j < gameLevel - 1; j++) {
        if (values[gameLevel - 1][j] === 0) {
            for (k = j; k < gameLevel - 1; k++) {
                for (i = 0; i < gameLevel; i++) {
                    values[i][k] = values[i][k + 1]
                }
            }
            for (i = 0; i < gameLevel; i++) {
                values[i][gameLevel - 1] = 0
            }
            if (values[gameLevel - 1][j] === 0) {
                for (k = j + 1; k < gameLevel - 1; k++) {
                    if (values[gameLevel - 1][k] !== 0) {
                        j--;
                        break;
                    }
                }
            }
        }
    }
    showGame()
}