table 6189104 "ForNAV Document Archive Setup"
{
    DataClassification = SystemMetadata;
    Caption = 'ForNAV Document Archive Setup';

    fields
    {
        field(1; "Report ID"; Integer)
        {
            Caption = 'Id';
            DataClassification = SystemMetadata;
            TableRelation = "ForNAV Report Object";
            ValidateTableRelation = false;
            trigger OnValidate()
            var
                AllObj: Record AllObj;
            begin
                if "Report ID" <> 0 then begin
                    AllObj.Get(AllObj."Object Type"::Report, "Report ID");
                    CalcFields("Report Name");
                end else
                    "Report Name" := '*';
            end;
        }
        field(2; "Report Name"; Text[250])
        {
            Caption = 'Report Name';
            FieldClass = FlowField;
            CalcFormula = lookup(AllObj."Object Name" where("Object Type" = const(Report), "Object ID" = field("Report ID")));
            Editable = false;
        }
    }

    keys { key(PK; "Report ID") { Clustered = true; } }
}

// Copyright (c) 2017-2021 ForNAV ApS - All Rights Reserved
// The intellectual work and technical concepts contained in this file are proprietary to ForNAV.
// Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from ForNAV ApS.
// This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
