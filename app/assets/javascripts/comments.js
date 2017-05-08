$(document).ready(function(){
    $(".comment-textbox").on("keydown", handleCommentKeydown);
});

function handleCommentKeydown(e) {
    if (!e) { 
        var e = window.event; 
    }

    if (e.keyCode == 13) { 
        var submitButton, $commentTextBox = $(this);
        e.preventDefault();
        submitButton = $(this).next()["0"].firstElementChild;
        
        submitButton.click();
        
        setTimeout(function() {
            scrollToBottomOfCommentsDiv($commentTextBox);
        }, 500);
        
        $commentTextBox.val("");
    }
}

function scrollToBottomOfCommentsDiv(commentTextBox){
    var $commentsBox = commentTextBox.closest(".step-comments-frame")["0"].firstElementChild;
    $commentsBox.scrollTop = $commentsBox.scrollHeight;
}

function closeCommentPrompts(e) {
    var isFromCommentBox;
    var srcClassName = $(e.target)["0"].className;
    isFromCommentBox = (srcClassName == "textarea comment-textbox");
    isFromCommentBox = isFromCommentBox || (srcClassName == "col col-md-5 step-comments-frame");
    
    if (!isFromCommentBox) {
        $('.se-comment-block').each(function(i, item) {
            var $item = $(item);
            if($item.hasClass('open'))
            {
                $item.removeClass('open');
                $item.addClass('close');
            }
        });   
    }
}


function handleKeyDown(e){
    switch(e.which) {
        case 27:
            return closeCommentPrompts();
    }
}