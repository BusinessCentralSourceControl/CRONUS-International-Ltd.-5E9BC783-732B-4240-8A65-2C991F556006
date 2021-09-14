table 6189182 "ForNAV Field"
{
    DataClassification = ToBeClassified;
    LookupPageId = "ForNAV Fields";
    fields
    {
        field(1; "Table No."; Integer) { Caption = 'Table No.'; DataClassification = SystemMetadata; }
        field(2; "No."; Integer) { Caption = 'No.'; DataClassification = SystemMetadata; }
        field(3; Name; Text[50]) { Caption = 'Name'; DataClassification = SystemMetadata; }
    }

    keys { key(PK; "Table No.", "No.") { Clustered = true; } }
    fieldgroups { fieldgroup(DropDown; "No.", Name) { } }
}

page 6189182 "ForNAV Fields"
{
    PageType = List;
    SourceTable = "ForNAV Field";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field(Name; Rec.Name) { ApplicationArea = All; }
            }
        }
    }

    trigger OnOpenPage()
    var
        Fld: Record Field;
        PlsFilterOnTableErr: Label 'Please filter on a Table first';
    begin
        if Rec.GetFilter("Table No.") = '' then
            Error(PlsFilterOnTableErr);
        fld.SetFilter(TableNo, Rec.GetFilter("Table No."));
        fld.FindSet;
        repeat
            Rec."No." := Fld."No.";
            Rec.Name := Fld.FieldName;
            Rec.Insert;
        until fld.Next = 0;
        Rec.FindFirst;
    end;

}

table 6189183 "ForNAV Report Object"
{
    DataClassification = ToBeClassified;
    LookupPageId = "ForNAV Report Objects";
    fields
    {
        field(1; "ID"; Integer) { Caption = 'ID'; DataClassification = SystemMetadata; }
        field(3; Name; Text[250]) { Caption = 'Name'; DataClassification = SystemMetadata; }
    }

    keys { key(PK; "ID") { Clustered = true; } }
    fieldgroups { fieldgroup(DropDown; "ID", Name) { } }
}

page 6189183 "ForNAV Report Objects"
{
    PageType = List;
    SourceTable = "ForNAV Report Object";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(ID; Rec.ID) { ApplicationArea = All; }
                field(Name; Rec.Name) { ApplicationArea = All; }
            }
        }
    }

    trigger OnOpenPage()
    var
        ReportMgt: Codeunit "ForNAV Check Is ForNAV Report";
    begin
        if Rec.IsEmpty then
            ReportMgt.GetAllForNAVReports(Rec);
        if not Rec.FindFirst then
            Error('No ForNAV Reports Found');
    end;

    procedure SetData(var Value: Record "ForNAV Report Object")
    begin
        Rec.Copy(Value, true);
    end;
}