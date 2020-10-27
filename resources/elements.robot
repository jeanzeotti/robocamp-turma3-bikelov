

*** Variables ***
### Login Page
${INPUT_EMAIL}      id:email
${BUTTON_LOGIN}     xpath://button[contains(text(), 'Quero Anúnciar')]
${ALERT_DARK}       class:alert-dark

### Dashboard Page
${DIV_DASH}         class:dashboard
${BIKE_ITEM}        css:.bike-list li
${BIKE_LIST}        class:bike-list

### Formulario Page
${INPUT_THUMB}      css:#thumbnail input
${INPUT_NAME}       id:name
${INPUT_BRAND}      id:brand
${INPUT_PRICE}      css:input[placeholder$=dia]
${BUTTON_SUBMIT}    class:btn-red
${ALERT_ERROR}      class:alert-error  