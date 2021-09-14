Codeunit 6188484 "ForNAV Check Design Allowed"
{

    trigger OnRun()
    begin
    end;

    procedure DesignIsAllowed(): Boolean
    var
        ReportLayoutSelection: Record "Report Layout Selection";
    begin
        exit(ReportLayoutSelection.WritePermission);
    end;
}

