
IndexAutoLoader = {
    loading: false,
    no_data: false,
    page: 1,
    loading_indecator: $('<div class="loading-indicator">Loading...</div>').appendTo($('body')).hide(),
    init: function(){
	$(window).scroll(function(e){
	    if(IndexAutoLoader.loading || IndexAutoLoader.no_data || ! IndexAutoLoader.near_bottom())
		return;
	    IndexAutoLoader.loading = true;
	    IndexAutoLoader.loading_indecator.show();
	    IndexAutoLoader.page ++;
	    url = $.param.querystring(location.href, {page: IndexAutoLoader.page});
	    $.get(url, function(data){
		page_items = $('.dataset', data);
		if(page_items.length == 0){
		    IndexAutoLoader.no_data = true;
		}else{
		    $('#main .container').append(page_items);
		    IndexAutoLoader.loading = false;
		    IndexAutoLoader.loading_indecator.hide();
		}
		console.log(data);
	    });
	});
    },
    near_bottom: function(){
	    main_container = $('#main');
	    main_container_bottom = main_container.offset().top + main_container.outerHeight();
	    return $(window).scrollTop() > main_container_bottom - $(window).height() - 100;
	}
};

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
    }else if($('body').hasClass('show-action')){
	$('table.dataset-preview').dataTable({ bJQueryUI: true });
    }else if($('body').hasClass('index-action')){
	IndexAutoLoader.init();
    }
});
