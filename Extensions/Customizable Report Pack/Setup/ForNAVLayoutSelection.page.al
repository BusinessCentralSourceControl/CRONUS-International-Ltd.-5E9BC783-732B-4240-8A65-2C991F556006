page 6188503 "ForNAV Layout Selection"
{
    Caption = 'ForNAV Layout Selection';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "ForNAV Layout Selection";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(List)
            {
                field("Report ID"; Rec."Report ID") { ApplicationArea = All; }
                field("Report Name"; Rec."Report Name") { ApplicationArea = All; }
                field("Table No."; Rec."Table No.") { ApplicationArea = All; }
                field("Field No."; Rec."Field No.") { ApplicationArea = All; }
                field("Field Name"; Rec."Field Name") { ApplicationArea = All; }
                field(Value; Rec.Value) { ApplicationArea = All; }
                field(CustomLayoutDescription; CustomLayoutDescription)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Custom Layout Description';

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupCustomLayout;
                    end;

                    trigger OnValidate()
                    var
                        CustomReportLayout: Record "Custom Report Layout";
                        CouldNotFindCustomReportLayoutErr: Label 'There is no custom report layout with %1 in the description.';
                    begin
                        CustomReportLayout.SetCurrentKey("Report ID", "Company Name", Type);
                        CustomReportLayout.SetRange("Report ID", Rec."Report ID");
                        CustomReportLayout.SetFilter("Company Name", '%1|%2', '', CompanyName);
                        CustomReportLayout.SetFilter(
                          Description, StrSubstNo('@*%1*', CustomLayoutDescription));
                        if not CustomReportLayout.FindFirst then
                            Error(CouldNotFindCustomReportLayoutErr, CustomLayoutDescription);

                        if CustomReportLayout.Code <> Rec."Custom Report Layout Code" then
                            Rec.Validate("Custom Report Layout Code", CustomReportLayout.Code);

                        //CurrPage.Update(false);
                    end;
                }
            }
        }
    }

    var
        CustomLayoutDescription: Text;

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Report Layout Description");
        CustomLayoutDescription := Rec."Report Layout Description";
    end;

    local procedure LookupCustomLayout()
    var
        CustomReportLayout: Record "Custom Report Layout";
        WrongCompanyErr: Label 'You cannot select a layout that is specific to another company.';
    begin
        CustomReportLayout.FilterGroup(4);
        CustomReportLayout.SetRange("Report ID", Rec."Report ID");
        CustomReportLayout.FilterGroup(0);
        CustomReportLayout.SetFilter("Company Name", '%1|%2', CompanyName, '');
        if PAGE.RunModal(PAGE::"Custom Report Layouts", CustomReportLayout) = ACTION::LookupOK then
            if CustomReportLayout.Find then begin
                if not (CustomReportLayout."Company Name" in [CompanyName, '']) then
                    Error(WrongCompanyErr);
                Rec."Custom Report Layout Code" := CustomReportLayout.Code;
                CustomLayoutDescription := CustomReportLayout.Description;
            end

    end;
}