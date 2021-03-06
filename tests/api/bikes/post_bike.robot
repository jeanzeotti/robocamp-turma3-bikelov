*** Settings ***

Resource        ../../../resources/services.robot

Test Setup      Create Session    bikelov         ${BASE_URL}

*** Test Cases ***
Create a new Bike Ad
    ${user_id}=     Get User Id           jeanz.pires@gmail.com
    ${payload}=     Convert To Json       {"name": "Elleven Rocker", "brand": "Shimano", "price": "15"}
    Remove Bike     ${payload['name']}

    ${resp}=        Post Bike Ad          ${user_id}      ${payload}      elleven.jpg
    
    Should Be Equal As Strings     ${resp.status_code}      200

Empty Name
    [Template]      Require Fields
    {"name": "", "brand": "Shimano", "price": "15"}     1001        Bike name is required

Empty Brand
    [Template]      Require Fields
    {"name": "Elleven Rocker", "brand": "", "price": "15"}     1002        Brand is required

*** Keywords ***
Require Fields
    [Arguments]     ${json}     ${expect_bcode}     ${expect_message}
    ${user_id}=     Get User Id           jeanz.pires@gmail.com
    ${payload}=     Convert To Json       ${json}
    Remove Bike     ${payload['name']}

    ${resp}=        Post Bike Ad          ${user_id}      ${payload}      elleven.jpg
    Log             ${resp.text}

    ${business_code}=        Convert To Integer      ${expect_bcode}

    Should Be Equal As Strings          ${resp.status_code}         412
    Should Be Equal                     ${resp.json()['code']}      ${business_code}
    Dictionary Should Contain Value     ${resp.json()}              ${expect_message}