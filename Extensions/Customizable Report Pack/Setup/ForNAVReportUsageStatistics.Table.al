Table 6188480 "ForNAV Report Usage Statistics"
{
    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = CustomerContent;
        }
        field(2; "Report ID"; Integer) { DataClassification = SystemMetadata; }
        field(4; "Report Caption"; Text[250])
        {
            CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object Type" = const(Report),
                                                                           "Object ID" = field("Report ID")));
            Caption = 'Report Caption';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "User ID"; Code[50]) { DataClassification = EndUserIdentifiableInformation; }
        field(6; "Date Time Printed"; DateTime) { DataClassification = SystemMetadata; }
    }

    keys
    {
        key(Key1; "Entry No.") { }
    }
}

// Copyright (c) 2017-2021 ForNAV ApS - All Rights Reserved
// The intellectual work and technical concepts contained in this file are proprietary to ForNAV.
// Unauthorized reverse engineering, distribution or copying of this file, parts hereof, or derived work, via any medium is strictly prohibited without written permission from ForNAV ApS.
// This source code is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
