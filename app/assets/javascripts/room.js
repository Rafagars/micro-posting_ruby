//Catch the content of the message that the user send
$(document).on('turbolinks:load', function () {
    $(function(){
        $("#new_room_message").on('ajax:success', function (a, b, c) {
            $(this).find('input[type="text"]').val('');
        });
    });
});