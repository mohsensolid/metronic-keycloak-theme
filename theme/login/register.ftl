<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        ${msg("createAccount")}
    <#elseif section = "form">
        <form class="form w-100 fv-plugins-bootstrap5 fv-plugins-framework" id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div class='text-center mb-10'>
            <span class="text-gray-400 fw-bold fs-4">${msg("haveAccount")} <a class="link-primary fw-boldest"  tabindex="6"
                                                 href="${url.loginUrl}">${msg("doLogIn")}</a></span>
            </div>
            <div class="d-flex align-items-center justify-content-center mb-10"><div class="border-bottom border-gray-300 w-100"></div></div>
            <div class='row fv-row mb-7'>
                <div class='col-xl-6'>
                    <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}<span class="text-black-50 fs-8"></span></label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input placeholder='${msg("firstName")}' type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName"
                            value="${(register.formData.firstName!'')}"
                            aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                        />

                        <#if messagesPerField.existsError('firstName')>
                            <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>
            </div>
                <div class='col-xl-6'>
                    <div class="${properties.kcFormGroupClass!}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}<span class="text-black-50 fs-8"></span></label>
                        </div>
                        <div class="${properties.kcInputWrapperClass!}">
                            <input placeholder='${msg("lastName")}' type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName"
                                value="${(register.formData.lastName!'')}"
                                aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                            />

                            <#if messagesPerField.existsError('lastName')>
                                <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
            

            
            <#if !realm.registrationEmailAsUsername>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input placeholder='${msg("username")}' type="text" id="username" class="${properties.kcInputClass!}" name="username"
                               value="${(register.formData.username!'')}" autocomplete="username"
                               aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                        />

                        <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input placeholder='${msg("email")}' type="text" id="email" class="${properties.kcInputClass!}" name="email"
                           value="${(register.formData.email!'')}" autocomplete="email"
                           aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                    />

                    <#if messagesPerField.existsError('email')>
                        <div class="fv-plugins-message-container invalid-feedback d-block my-2 ">
                            <div class="fv-help-block">
                            <span role="alert"> ${kcSanitize(messagesPerField.get('email'))?no_esc}</span>
                            </div>
                        </div>
                     </#if>
            </div>
            </div>
             
            <#if passwordRequired??>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input placeholder='${msg("password")}' type="password" id="password" class="${properties.kcInputClass!}" name="password"
                               autocomplete="new-password"
                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                        />

                        <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password-confirm"
                               class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input placeholder='${msg("passwordConfirm")}' type="password" id="password-confirm" class="${properties.kcInputClass!}"
                               name="password-confirm"
                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                        />

                        <#if messagesPerField.existsError('password-confirm')>
                            <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>
            </#if>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
               
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <button tabindex="6"  type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" id="kc-regester-btn">
                        <span class="indicator-label">${msg("doRegister")}</span>
                      </button>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>