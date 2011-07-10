// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
    $(".noowsButton").css('cursor', 'pointer')
});

function vote(a,b) {
    if(b == false){
        $('#flashes').addClass('alert').html('You must be logged in to vote');
        return;
    }
    $.get('/news_items/' + a + '/vote_up.js', function(jsonObj){
        if(jsonObj.success == true){
            $('#' + a).fadeIn('slow').removeClass('noowsButton').addClass('noowsedButton').html('Noows')
        }
    });
};

