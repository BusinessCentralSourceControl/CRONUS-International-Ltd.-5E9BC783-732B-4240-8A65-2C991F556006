codeunit 6189001 "ForNAV Install App"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin

    end;

    procedure UpdateUserAccess()
    var
        AccessControl: Record "Access Control";
    begin
        if AccessControl.FindSet() then
            repeat
                AddUserAccess(AccessControl."User Security ID", 'FORNAVUSER');
                AddUserAccess(AccessControl."User Security ID", 'FORNAVLANGUAGE');
                AddUserAccess(AccessControl."User Security ID", 'FORNAV CORE RUN TIME');
            until AccessControl.next = 0;
        AccessControl.SetFilter(AccessControl."Role ID", '%1|%2', 'SUPER', 'SECURITY');
        if AccessControl.FindSet() then
            repeat
                AddUserAccess(AccessControl."User Security ID", 'FORNAVARCHIVEADMIN');
                AddUserAccess(AccessControl."User Security ID", 'FORNAVLANGUAGEADMIN');
                AddUserAccess(AccessControl."User Security ID", 'FORNAVADMIN');
            until AccessControl.next = 0;

    end;

    trigger OnInstallAppPerDatabase()
    begin
        UpdateUserAccess();
    end;

    local procedure AddUserAccess(AssignToUser: Guid; PermissionSet: Code[20]);
    var
        AccessControl: Record "Access Control";
        AppGuid: Guid;
    begin

        Evaluate(AppGuid, '6f0293d3-86fc-4ff8-9632-54a580be6546');

        AccessControl.Init();
        AccessControl."User Security ID" := AssignToUser;
        AccessControl."App ID" := AppGuid;
        AccessControl.Scope := AccessControl.Scope::Tenant;
        AccessControl."Role ID" := PermissionSet;
        if not AccessControl.Find() then
            AccessControl.Insert(true);

    end;
}


