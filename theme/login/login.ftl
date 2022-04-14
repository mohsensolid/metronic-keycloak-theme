<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
       
        ${msg("loginAccountTitle")}
    
    <#elseif section = "form">
     
    <div id="kc-form">
      <div id="kc-form-wrapper">
        <#if realm.password>
            
            <form  class="form w-100" id="kc-form-login" onsubmit="return false;" action="${url.loginAction}" method="post">
            <div class='text-center mb-10'>
            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span class="text-gray-400 fw-bold fs-4">${msg("noAccount")} <a class="link-primary fw-boldest"  tabindex="6"
                                                 href="${url.registrationUrl}">${msg("createAccount")}</a></span>
                </div>
            </div>
        </#if>
            </div>
                <#if !usernameHidden??>
                    <div class="${properties.kcFormGroupClass!}">
                        <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>

                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" placeholder='<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>' name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off"
                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        />
                    </div>
                </#if>

                <div class="${properties.kcFormGroupClass!}">
                    <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>

                    <input tabindex="2" placeholder='password' id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off"
                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                    />

                </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameHidden??>
                            <div class="form-check form-check-solid fv-row">
                                <label class='form-check-label fw-bold ps-2 fs-6'>
                                    <#if login.rememberMe??>
                                        <input class='form-check-input' tabindex="3" id="rememberMe"  name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input class='form-check-input' tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        </div>
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5" class='link-primary fs-6 fw-bolder ms-2 cursor-pointer' href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>

                  </div>

                  <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                      <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                      <button  tabindex="4"  type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" id="kc-login">
                        <span class="indicator-label">${msg("doLogIn")}</span>
                      </button>
                  
                  </div>
            </form>
        </#if>
        </div>

    </div>
    <#elseif section = "info" >
    
    <#elseif section = "socialProviders" >
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <div class='text-center text-muted text-uppercase fw-bolder mb-5'>OR</div>
                <#list social.providers as p>
                        <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                type="button" href="${p.loginUrl}">
                            <#if p.iconClasses?has_content>
                                <img alt="Logo" src="${url.resourcesPath}/img/social/${p.displayName!}.svg" class="h-20px me-3">
                                <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${msg("loginWith")} ${p.displayName!}</span>
                            <#else>
                                <span class="${properties.kcFormSocialAccountNameClass!}">${msg("loginWith")}${p.displayName!}</span>
                            </#if>
                        </a>
                    </#list>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>