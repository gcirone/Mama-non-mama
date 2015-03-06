$(window).ready(init);

function init(){
    $('.preview_image img')
        .mouseover(overImage)
        .mousemove(moveImage)
        .mouseout(outImage);
}

function overImage(e) {
    $('#image-fly').remove();
    var image = $(this).clone();
    image.attr('id', 'image-fly').addClass('fly');
    $('body').append(image);
}

function moveImage(e){
    var image = $('#image-fly');
    image.css('top', e.pageY-250);
    image.css('left', e.pageX+10);
}
function outImage(e){
    $('#image-fly').remove();
}