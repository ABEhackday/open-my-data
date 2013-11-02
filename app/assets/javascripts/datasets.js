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
    } else if ($('body').hasClass('show-action')) {
	    $('table.dataset-preview').dataTable({ bJQueryUI: true, bAutoWidth: true });
    } else if ($('body').hasClass('index-action')) {
        var template = Handlebars.compile($("#t-datasets-more").html());
        $('.dataset').click(function () {
            var id = $(this).attr('data-id'),
                more = $(this).find('.more'),
                active = $(this).data('active'),
                self = this;
            if (!active) {
                $.ajax({
                    url: '/datasets/' + id + '.json',
                    format: 'json',
                    success: function (data) {
                        more.html(template(data));
                        more.slideDown();
                        $(self).data('active', true);
                    }
                });
            } else {
                more.slideUp();
                $(this).data('active', false);
            }
        });
    }
});
