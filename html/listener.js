window.addEventListener("message", (event) => {
    var item = event.data;

    if(item !== undefined && item.type === "subtitle") {
        $('#speaker').html(item.speaker+": ");
        $('#message').html(item.message);
        $('#speaker').prop('style','color:'+item.speaker_color+';font-weight: bold;');
        $('#subtitle').fadeIn(500);
        
        setTimeout(() => {
            $('#subtitle').fadeOut(500);
        }, item.timeout);
    }
})
