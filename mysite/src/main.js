require("./scss/styles.scss");

import $ from "jquery";
window.$ = $;

function init() {
}
function initlate() {
    $(".slider").slick({
        dots:true,
        arrows:false,
        fade:false
    });
}

$(init);

if(editmode) {
    setTimeout(initlate, 2000);
} else {
    $(initlate);
}