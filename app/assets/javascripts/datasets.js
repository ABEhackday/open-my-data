$(function () {
    if(!$('body').hasClass('datasets-controller'))
	return;

    if ($('body').hasClass('new-action')) {
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
    }else if($('body').hasClass('show')){
	$('table.dataset-preview').dataTable({ bJQueryUI: true });
    }else if($('body').hasClass('index')){
    
    }
});
