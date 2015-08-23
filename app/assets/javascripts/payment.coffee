
simplifyResponseHandler = (data) ->
    paymentForm = $('#simplify-payment-form')
    $('.error').remove()
    if data.error
        if data.error.code == 'validation'
            errorList = ''
            for f in data.error.fieldErrors
                errorList += "<div class='error'>Field #{f.field} is invalid &ndash; #{f.message}</div>"
            paymentForm.after errorList

        $('#process-payment-btn').removeAttr 'disabled'
    else
        token = data['id']
        paymentForm.append "<input type='hidden' name='simplifyToken' value='#{token}'>"
        paymentForm.get(0).submit()
    return

ready = ->
    $('#simplify-payment-form').on 'submit', ->
        $('#process-payment-btn').attr disabled: 'disabled'
        SimplifyCommerce.generateToken {
            key: "sbpb_NjJjNGM4YTAtMmNkYi00ZjBhLWFiODAtN2NmZjY3YTM0YmYw",
            card: {
                number: $('#cc-number').val(),
                cvc: $('#cc-cvc').val(),
                expMonth: $('#cc-exp-month').val(),
                expYear: $('#cc-exp-year').val().slice(-2)
            },
            amount: $('#donation-amount').val(),
        }, simplifyResponseHandler
        false

$(document).ready(ready)