$(function () {
    if ($('body').hasClass('new-action') && $('body').hasClass('datasets-controller')) {   
        var wrappers = $('.wrapper');
        $('button.next').click(function () {
            wrappers.eq(0).animate({
                left: "-100%"
            }, 450);
            wrappers.eq(1).animate({
                left: "0"
            }, 450);
        });
        $('button.prev').click(function () {
            wrappers.eq(0).animate({
                left: "0"
            }, 450);
            wrappers.eq(1).animate({
                left: "100%"
            }, 450);
        });
    }
});