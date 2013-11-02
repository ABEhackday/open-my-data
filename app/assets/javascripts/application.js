// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require dataTables/jquery.dataTables
//= require jquery.ba-bbq.js
//= require_tree .

// type as you search

var original_content = false;

$(function(){
    $('#top-search-box').keyup(function(event){
	if(!original_content)
	    original_content = $('#main').html();

	keyword = $('#top-search-box').val();
	if(keyword == ''){
	    $('body').removeClass('searching');
	    $('#main').html(original_content);
	}else{
	    $('body').addClass('searching');
	    $('#main').load('/datasets/?s='+keyword, function(){
		showing_datasets_index();
	    });
	}
    });
});


function dirtyIME(){ 
    if(old_search_term != $('#top-search-box').val()){
	old_search_term = $('#top-search-box').val();
	$('#top-search-box').trigger('keydown');
    }
}
