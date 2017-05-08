$(document).ready(function(){
    $('#step-next').click(toggleImageDetails);
    $('#step-back').click(toggleDetailsImage);
});


function toggleImageDetails(e) {
    e.preventDefault();
    $('.step-image-upload-div').css('display', 'none');
    $('.step-details-div').css('display', 'inline');
    
    var reader = new FileReader();
    var leadImage = document.getElementById('step-images').files[0];

    reader.onload = function (e) {
        $('#stepLeadImage').attr('src', e.target.result);
        $('#stepLeadImage').attr('width', '700px');
        $('#stepLeadImage').attr('height', '484px');
    }

    reader.readAsDataURL(leadImage);
}

function toggleDetailsImage(e) {
    e.preventDefault();
    $('.step-image-upload-div').css('display', 'inline');
    $('.step-details-div').css('display', 'none');
}