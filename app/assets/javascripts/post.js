$(document).on('turbolinks:load', function () {

        $(".spinner-border").hide();

        $(".like a").on('click', function () {
            $(this).toggleClass('far');
        });

        $(".submit").on('click', function () {
            $(".spinner-border").show()
        });
})