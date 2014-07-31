<%@ page title="Register" language="C#" masterpagefile="~/Site.master" autoeventwireup="true"
    codebehind="Register.aspx.cs" inherits="VehicleMaintenanceSystem.Account.Register" %>

<%@ register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:content id="HeaderContent" runat="server" contentplaceholderid="HeadContent">
</asp:content>
<asp:content id="BodyContent" runat="server" contentplaceholderid="MainContent">
    <asp:toolkitscriptmanager id="RegisterToolkitScriptManager" runat="server">
    </asp:toolkitscriptmanager>
    <asp:createuserwizard id="RegisterUser" runat="server" enableviewstate="false" logincreateduser="False"
        oncreateduser="RegisterUser_CreatedUser">
        <layouttemplate>
            <asp:placeholder id="wizardStepPlaceholder" runat="server"></asp:placeholder>
            <asp:placeholder id="navigationPlaceholder" runat="server"></asp:placeholder>
        </layouttemplate>
        <wizardsteps>
            <asp:createuserwizardstep id="RegisterUserWizardStep" runat="server">
                <contenttemplate>
                    <h2>
                        Create a New Account
                    </h2>
                    <p>
                        Passwords are required to be a minimum of
                        <%= Membership.MinRequiredPasswordLength %>
                        characters in length.
                    </p>
                    <span class="failureNotification">
                        <asp:literal id="ErrorMessage" runat="server"></asp:literal>
                    </span>
                    <asp:validationsummary id="RegisterUserValidationSummary" runat="server" cssclass="failureNotification"
                        validationgroup="RegisterUserValidationGroup" />
                    <div class="accountInfo">
                        <fieldset class="register">
                            <legend>Account Information</legend>
                            <p>
                                <asp:label id="UserNameLabel" runat="server" associatedcontrolid="UserName">User Id:</asp:label>
                                <asp:textbox id="UserName" runat="server" cssclass="textEntry" maxlength="5"></asp:textbox>
                                <asp:requiredfieldvalidator id="UserNameRequired" runat="server" controltovalidate="UserName"
                                    cssclass="failureNotification" errormessage="User Id is required." tooltip="User Id is required."
                                    validationgroup="RegisterUserValidationGroup">*</asp:requiredfieldvalidator>
                                <asp:filteredtextboxextender id="UserName_FilteredTextBoxExtender" runat="server" filtermode="ValidChars" filtertype="Numbers" targetcontrolid="UserName">
                                </asp:filteredtextboxextender>
                            </p>
                            <p>
                                <asp:label id="FullNameLabel" runat="server" associatedcontrolid="FullName">User Name:</asp:label>
                                <asp:textbox id="FullName" runat="server" cssclass="textEntry" maxlength="50"></asp:textbox>
                                <asp:requiredfieldvalidator id="FullNameRequired" runat="server" controltovalidate="FullName"
                                    cssclass="failureNotification" errormessage="User Name is required." tooltip="User Name is required."
                                    validationgroup="RegisterUserValidationGroup">*</asp:requiredfieldvalidator>
                            </p>
                            <p>
                                <asp:label id="EmailLabel" runat="server" associatedcontrolid="Email">E-mail:</asp:label>
                                <asp:textbox id="Email" runat="server" cssclass="textEntry"></asp:textbox>
                                <asp:requiredfieldvalidator id="EmailRequired" runat="server" controltovalidate="Email"
                                    cssclass="failureNotification" errormessage="E-mail is required." tooltip="E-mail is required."
                                    validationgroup="RegisterUserValidationGroup">*</asp:requiredfieldvalidator>
                            </p>
                            <p>
                                <asp:label id="PasswordLabel" runat="server" associatedcontrolid="Password">Password:</asp:label>
                                <asp:textbox id="Password" runat="server" cssclass="passwordEntry" textmode="Password" text="123456" ></asp:textbox>
                                <asp:requiredfieldvalidator id="PasswordRequired" runat="server" controltovalidate="Password"
                                    cssclass="failureNotification" errormessage="Password is required." tooltip="Password is required."
                                    validationgroup="RegisterUserValidationGroup">*</asp:requiredfieldvalidator>
                            </p>
                            <p>
                                <asp:label id="ConfirmPasswordLabel" runat="server" associatedcontrolid="ConfirmPassword">Confirm Password:</asp:label>
                                <asp:textbox id="ConfirmPassword" runat="server" cssclass="passwordEntry" textmode="Password"></asp:textbox>
                                <asp:requiredfieldvalidator controltovalidate="ConfirmPassword" cssclass="failureNotification"
                                    display="Dynamic" errormessage="Confirm Password is required." id="ConfirmPasswordRequired"
                                    runat="server" tooltip="Confirm Password is required." validationgroup="RegisterUserValidationGroup">*</asp:requiredfieldvalidator>
                                <asp:comparevalidator id="PasswordCompare" runat="server" controltocompare="Password"
                                    controltovalidate="ConfirmPassword" cssclass="failureNotification" display="Dynamic"
                                    errormessage="The Password and Confirmation Password must match." validationgroup="RegisterUserValidationGroup">*</asp:comparevalidator>
                            </p>
                            <p>
                                <asp:label id="CompanyLabel" runat="server" associatedcontrolid="Company">Company:</asp:label>
                                <asp:dropdownlist id="Company" runat="server" cssclass="comboEntry" datavaluefield="CompanyId"
                                    datatextfield="CompanyName" datasourceid="CompanySqldatasource">
                                </asp:dropdownlist>
                                <asp:comparevalidator id="CompanyCompare" runat="server" valuetocompare="0" controltovalidate="Company"
                                    cssclass="failureNotification" display="Dynamic" errormessage="Company is required."
                                    validationgroup="RegisterUserValidationGroup" operator="NotEqual">*</asp:comparevalidator>
                                <asp:sqldatasource id="CompanySqldatasource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                                    selectcommand="SELECT 0 AS CompanyId, '[Select Company]' AS CompanyName UNION SELECT c.CompanyId,c.CompanyName FROM Companies c">
                                </asp:sqldatasource>
                            </p>
                            <p>
                                <asp:label id="DepartmentLabel" runat="server" associatedcontrolid="Department">Department:</asp:label>
                                <asp:dropdownlist id="Department" runat="server" cssclass="comboEntry" datavaluefield="DepartmentId"
                                    datatextfield="DepartmentName" datasourceid="DepartmentSqldatasource">
                                </asp:dropdownlist>
                                <asp:comparevalidator id="DepartmentCompare" runat="server" valuetocompare="0"
                                    controltovalidate="Department" cssclass="failureNotification" display="Dynamic"
                                    errormessage="Department is required." validationgroup="RegisterUserValidationGroup"
                                    operator="NotEqual">*</asp:comparevalidator>
                                <asp:sqldatasource id="DepartmentSqldatasource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                                    selectcommand="SELECT 0 AS DepartmentId, '[Select Department]' AS DepartmentName UNION SELECT d.DepartmentId,d.DepartmentName  FROM Departments d WHERE d.Status = 'A'">
                                </asp:sqldatasource>
                            </p>
                            <p>
                                <asp:label id="DesignationLabel" runat="server" associatedcontrolid="Designation">Designation:</asp:label>
                                <asp:dropdownlist id="Designation" runat="server" cssclass="comboEntry" datavaluefield="DesignationId"
                                    datasourceid="DesignationSqlDataSource" datatextfield="DesignationName">
                                </asp:dropdownlist>
                                <asp:comparevalidator id="DesignationCompare" runat="server" valuetocompare="0"
                                    controltovalidate="Designation" cssclass="failureNotification" display="Dynamic"
                                    errormessage="Designation is required." validationgroup="RegisterUserValidationGroup"
                                    operator="NotEqual">*</asp:comparevalidator>
                                <asp:sqldatasource id="DesignationSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                                    selectcommand="SELECT 0 AS DesignationId, '[Select Designation]' AS DesignationName UNION SELECT d.DesignationId,d.DesignationName FROM Designations d">
                                </asp:sqldatasource>
                            </p>
                        </fieldset>
                        <p class="submitButton">
                            <asp:button id="CreateUserButton" runat="server" commandname="MoveNext" text="Create User"
                                validationgroup="RegisterUserValidationGroup" />
                        </p>
                    </div>
                </contenttemplate>
                <customnavigationtemplate>
                </customnavigationtemplate>
            </asp:createuserwizardstep>
<asp:CompleteWizardStep runat="server"></asp:CompleteWizardStep>
        </wizardsteps>
    </asp:createuserwizard>
</asp:content>
