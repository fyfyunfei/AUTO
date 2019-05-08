*** Settings ***
Library           Selenium2Library
Resource          测试流程.txt

*** Test Cases ***
登录正确帐号密码
    tear
    登录信息    http://bdosdowell.com    test01    qwe12345

选择项目管理
    Sleep    3
    页面选择    //*[@id="header"]/ul/li[6]/a/span

新增项目
    Sleep    3
    新增    //*[@id="body"]/div/div[1]/i/span    test00004    test4
    [Teardown]

取消新增项目
    Sleep    3
    取消新增    //*[@id="body"]/div/div[1]/i/span    test00001    test1
    [Teardown]

删除新增项目
    删除    确认删除吗？    确认提示

编辑项目
    编辑    newname    修改项目描述

test
    Reload Page
    sleep    2
    Click Element    //*[@id="body"]/div/div[2]/div/div[1]/table/tbody/tr[2]/td[7]/div/a[1]
    sleep    2
    press key    Xpath = /html/body/div[3]/div/div[2]/div/div/div[2]/div/form/div[2]/div[2]/input    \\1
    sleep    20
    Clear Element Text    Xpath = /html/body/div[3]/div/div[2]/div/div/div[2]/div/form/div[2]/div[2]/input    #清空名称
    sleep    2
    Input Text    Xpath = /html/body/div[3]/div/div[2]/div/div/div[2]/div/form/div[2]/div[2]/input    testname    #输入新名称
    Clear Element Text    xpath = /html/body/div[3]/div/div[2]/div/div/div[2]/div/form/div[3]/div[2]/textarea
    sleep    2
    Input Text    Xpath = /html/body/div[3]/div/div[2]/div/div/div[2]/div/form/div[3]/div[2]/textarea    测试描述    #输入描述
    Click Button    Xpath = /html/body/div[3]/div/div[2]/div/div/div[2]/div/div/button[2]
    Reload Page
    sleep    2
    Page Should not Contain    testname
