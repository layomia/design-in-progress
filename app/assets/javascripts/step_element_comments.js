$(document).ready(function(){
});

function handleImageClick(ev, stepElementID) {
    requestForCommentPrompt(ev, stepElementID);
}

function requestForCommentPrompt(ev, stepElementID) {
    var img = ev.target;
    var route = "sec_prompt", params;
    var $commentPromptLink = $("#sei-link-" + stepElementID);
    var $imgParent = $(img.parentElement);
    var relX = parseInt(ev.pageX - $imgParent.offset().left) - 10;
    var relY = parseInt(ev.pageY - $imgParent.offset().top) - 10;
    params = "?id=" + stepElementID + "&relX=" + relX + "&relY=" + relY;
    
    $commentPromptLink.attr("href", route + params);
    $commentPromptLink.trigger("click");
}