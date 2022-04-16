
$(function () {
    //Validate Login Form
    $("#kc-form-login").validate({
        errorClass: "is-invalid",
        validClass: "is-valid",
        submitHandler: function (form) {
            let loginButton = $('#kc-login');
            loginButton.prop("disabled", true);
            loginButton.html('<span class="indicator-progress" style="display: block;">Please wait...<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>')
            form.submit();
        },
        rules: {
            username: {
                required: true,
                minlength: 3
            },
            password: {
                required: true,
                minlength: 5
            },
        },
        messages: {
            username: {
                required: "Username is required",
                minlength: "Minimum 3 symbols"
            },
            password: {
                required: "Password is required",
                minlength: "Minimum 5 symbols"
            },
        }
    });
    //Validate Register Form
    $("#kc-register-form").validate({
        errorClass: "is-invalid",
        validClass: "is-valid",
        submitHandler: function (form) {
            let loginButton = $('#kc-regester-btn');
            loginButton.prop("disabled", true);
            loginButton.html('<span class="indicator-progress" style="display: block;">Please wait...<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>')
            form.submit();
        },
        rules: {
            firstName: "required",
            lastName: "required",
            email: {
                required: true,
                email: true
            },
            username: {
                required: true,
                minlength: 3
            },
            password: {
                required: true,
                minlength: 5
            },
            "password-confirm": {
                required: true,
                equalTo: "#password"
            },
        },
        messages: {
            firstName: { required: "First name is required" },
            lastName: { required: "Last name is required" },
            username: {
                required: "Username is required",
                minlength: "Minimum 3 symbols"
            },
            password: {
                required: "Password is required",
                minlength: "Minimum 5 symbols"
            },
            email: {
                required: "Email is required",
            },
            "password-confirm": {
                required: "Password confirmation is required",
                equalTo: "Password confirmation doesn't match."
            }
        }
    });
})
