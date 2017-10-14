require("./scss/styles.scss");

$ = require("jquery");
require("slick-carousel");
// import $ from "jquery";
// window.$ = $;

function init() {
}
function initlate() {
    $(".section_slider").slick({
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