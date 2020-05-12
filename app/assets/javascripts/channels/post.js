$(document).on('turbolinks:load', function () {
    $(".like a").on('click', function () {
        $(this).toggleClass('fas');;
    }),
        $(".unlike a").on('click', function () {
            $(this).toggleClass('far');;
        }),

        $(".spinner-border").hide(),

        $(".submit").on('click', function () {
            $(".spinner-border").show()
        })
})